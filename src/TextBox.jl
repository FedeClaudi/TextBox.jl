module TextBox

export reshape_text

"""
    loop_last(v)

Yield an iterable with info about when the last item is reached
"""
function loop_last(v)
    is_last =  1:length(v) .== length(v)
      return zip(is_last, v)
  end
  

"""
    do_by_line(fn::Function, text::String)

Apply `fn` to each line in the `text`.

The function `fn` should accept a single `::String` argument.
"""
function do_by_line(fn::Function, text)::String
    out = ""
    for (last, line) in loop_last(split(text, "\n"))
        out *= fn(line) * (last ? "" : "\n")
    end
    return out
end

do_by_line(fn::Function, text::Vector)::String = join_lines(fn.(text))

"""
    reshape_text(text, width::Int)

Reshape a string to be a multi-line text with given width.

Arguments:
    text::AbstractString
    width::Int

New line characters `\n` are inserted to give a new string in which
each line has is at most `width` wide. This takes into account 
characters with width > 1 and number of code units > 1.
New lines are preferentially insterted at spaces if there is any near
the end of the line to improve readability.
"""
function reshape_text(text, width::Int)
    if occursin("\n", text)
        return do_by_line(l -> reshape_text(l, width), text)
    end

    textwidth(text) <= width && return text

    chars::Vector{Union{Char, String}} = collect(text)
    spaces::Vector{Bool} = Bool.(chars .== ' ')

    # get width at each char (ignoring ANSI codes)
    widths::Vector{Int} = textwidth.(chars)
    cumwidths = cumsum(widths)

    # get initial cut candidates
    cuts = findall(diff(mod.(cumwidths, width)) .< 0) .+ 1
    ncuts = length(cuts)
    
    # adjust cut locations to insert new lines at spaces
    n = 1
    while n <= length(cuts)
        cut = cuts[n]
        
        # if there is a space near the cut, prefer to insert a new line
        if width > 25
            for i in 1:4
                if spaces[cut-i] == true
                    # get width of text excluded by new cut position
                    if n < ncuts
                        # adjust cuts poisitions
                        Δw = cumwidths[cut] - cumwidths[cut-i]
                        newcuts = findall(
                            diff(
                                mod.(cumwidths .- cumwidths[cut] .+ Δw, width)
                                ) .< 0
                        )
                        
                        newcuts = newcuts[newcuts .> cut]
                        cuts = [cuts[1:n]..., newcuts...]
                    end

                    cut -= i
                    break
                end
            end
        end
        
        # insert new line
        chars[cut] *= '\n'
        n += 1
    end

    # check that the last line has the right width
    if sum(widths[cuts[end]:end]) > width
        _chars = chars[cuts[end]+1:end]
        chars = chars[1:cuts[end]]
        append!(chars, collect(
                reshape_text(join(_chars), width)
                )
        )
    end
  
    # stitch it back together
    return chomp(join(chars))
end

end

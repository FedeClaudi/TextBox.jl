using TextBox


"""
Example showing how to reshape texts from different languages.

The reshaped texts are printed side-by-side one line at the time.
"""


lorems = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",

    "แชมเปญแมมโบ้แก๊สโซฮอล์ โค้กมาร์ชวาไรตี้ พิซซ่าคอร์รัปชั่นจิ๊กโก๋ตรวจทาน บริกรปัจเจกชนไอติมอ่วมฮองเฮา ลาตินฮันนีมูนหมวย ป๊อปโปลิศไวกิ้งป๊อกวานิลลา แชมพูเกรดไคลแมกซ์แฟ็กซ์เทรนด์ สปอร์ตพิซซ่าฮากกาสเก็ตช์ วีไอพี ไคลแมกซ์หลวงปู่ผู้นำ",

    "국가원로자문회의의 의장은 직전대통령이 된다, 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다, 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.",

    "近社豪潜並送薄多注庭前使喜致健航殺。誉写運次安人性関法下作近年一予合捕割団。控切奪人立判千家購速概込記越。一交掲教地年府棚度士七属自復一秋今政無期",

    "كانت بالجانب تحت لم, إحتار الخطّة يبق أي. حقول واتّجه عن حتى, تصرّف الضروري باستخدام ضرب و. كلّ وحتى استرجاع تم. الا تم وس",

    "על בדפים פיסיקה לעברית שתי, על שתי ויקימדיה לויקיפדיה טכנולוגיה. עמוד קסאם של צעד. בה בהשחתה קלאסיים כתב, צעד אם היום והנדסה. זאת התוכן בחירות האנציקלופדיה את, אחר או טבלאות ויקיפדיה, מה צי",
]


function keep_10_lines(txt)
    return split(txt, "\n")[1:10]
end


width = 52


# for lorem in lorems
#     println("_"^width)
#     println(reshape_text(lorem, width; at_spaces=false))
#     println("_"^width)
# end



reshaped= []
for lorem in lorems
    push!(reshaped, keep_10_lines(reshape_text(lorem^5, width)))
end

print("\n"^5)
N = length(reshaped)

alphabets = ["latin", "thai", "korean", "chinese", "arabic", "hebrew"]
println(
    "\e[34m\e[1m" * *(
        map(
            alpha -> rpad(alpha, width+4), 
            alphabets
        )...
    )[1:end-5] * "\e[0m"
)


println("\e[2m" * ("─"^width*"    ")^N * "\e[0m")
for i in 1:10
    println(*(map(n -> rpad(reshaped[n][i], width+4), 1:N)...))
end
print("\n"^5)
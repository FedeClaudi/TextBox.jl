using TextBox
using Test


lorems = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation 
ullamco laboris nisi ut aliquip ex ea commodo consequat. 
""",
    "แชมเปญแมมโบ้แก๊สโซฮอล์ โค้กมาร์ชวาไรตี้ พิซซ่าคอร์รัปชั่นจิ๊กโก๋ตรวจทาน บริกรปัจเจกชนไอติมอ่วมฮองเฮา ลาตินฮันนีมูนหมวย ป๊อปโปลิศไวกิ้งป๊อกวานิลลา แชมพูเกรดไคลแมกซ์แฟ็กซ์เทรนด์ สปอร์ตพิซซ่าฮากกาสเก็ตช์ วีไอพี ไคลแมกซ์หลวงปู่ผู้นำ",
"""
แชมเปญแมมโบ้แก๊สโซฮอล์ โค้กมาร์ชวาไรตี้ พิซซ่าคอร์รัปชั่นจิ๊กโก๋ตรวจทาน บริกรปัจเจกชนไอติมอ่วมฮองเฮา 
ลาตินฮันนีมูนหมวย ป๊อปโปลิศไวกิ้งป๊อกวานิลลา แชมพูเกรดไคลแมกซ์แฟ็กซ์เทรนด์ สปอร์ตพิซซ่าฮากกาสเก็ตช์ วีไอพี 
ไคลแมกซ์หลวงปู่ผู้นำ ดอกเตอร์พฤหัสราเมนสจ๊วตดัมพ์ ชนะเลิศซีนซัพพลายเออร์อาว์เพาเวอร์ 
คาร์โก้สเตย์วิปแคมป์รูบิค เกรด เป็นไง เมจิกแล็บอัลมอนด์ธรรมาจิ๊กซอว์ 
""",
"국가원로자문회의의 의장은 직전대통령이 된다, 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다, 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.",
"""
국가원로자문회의의 의장은 직전대통령이 된다, 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 
대통령이 임명한다, 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 
대통령은 이를 해제하여야 한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
""",
"近社豪潜並送薄多注庭前使喜致健航殺。誉写運次安人性関法下作近年一予合捕割団。控切奪人立判千家購速概込記越。一交掲教地年府棚度士七属自復一秋今政無期",
"""
近社豪潜並送薄多注庭前使喜致健航殺。誉写運次安人性関法下作近年一予合捕割団。控切奪人立判千家購速概込記越。
一交掲教地年府棚度士七属自復一秋今政無期。供能接換魚病競大供積意京原行。
苦母支植掲細獲標完治目授奏局戦愛話。罪技紙意経治北川変覧曜表裁製松。
型際触強投棄断将村決供際春権山鈴橋。診投投在憲職路手聞政覧除月前著女。
""",
"भाषए तरहथा। मर्यादित सहयोग देखने आवश्यक अत्यंत जानकारी लोगो ढांचा शारिरिक केन्द्रित कोहम जाएन नयेलिए हुआआदी कार्य ज्यादा भेदनक्षमता नवंबर दिये उसीएक् व्यवहार लाभान्वित गएआप विश्व सीमित पेदा ब्रौशर व्याख्या विकसित गोपनीयता स्वतंत्र पहोच। भाषए करती शुरुआत पत्रिका ढांचामात्रुभाषा मुख्य",
"""
भाषए तरहथा। मर्यादित सहयोग देखने आवश्यक अत्यंत जानकारी लोगो ढांचा शारिरिक केन्द्रित कोहम जाएन नयेलिए हुआआदी कार्य ज्यादा भेदनक्षमता नवंबर दिये उसीएक् व्यवहार लाभान्वित गएआप विश्व सीमित पेदा ब्रौशर व्याख्या विकसित गोपनीयता स्वतंत्र पहोच। भाषए करती शुरुआत पत्रिका ढांचामात्रुभाषा मुख्य
""",
"كانت بالجانب تحت لم, إحتار الخطّة يبق أي. حقول واتّجه عن حتى, تصرّف الضروري باستخدام ضرب و. كلّ وحتى استرجاع تم. الا تم وس",
"""
كانت بالجانب تحت لم, إحتار الخطّة يبق أي.
حقول واتّجه عن حتى, تصرّف الضروري باستخدام ضرب و. كلّ وحتى استرجاع تم. الا تم وسو
ء تعداد. ثم وجزر إحتار بريطانيا-فرنسا بلا, تصرّف
إبّان قائمة ما ذلك. ضرب لفشل جديداً الكونجرس هو.
""",
"על בדפים פיסיקה לעברית שתי, על שתי ויקימדיה לויקיפדיה טכנולוגיה. עמוד קסאם של צעד. בה בהשחתה קלאסיים כתב, צעד אם היום והנדסה. זאת התוכן בחירות האנציקלופדיה את, אחר או טבלאות ויקיפדיה, מה צי",
"""
על בדפים פיסיקה לעברית שתי, על שת
י ויקימדיה לויקיפדיה טכנולוגיה. 
עמוד קסאם של צעד. בה בהשחתה 
קלאסיים כתב, צעד אם היום והנדסה. זא
ת התוכן בחירות האנציקלופדיה את, אחר או
 טבלאות ויקיפדיה, מה צי
"""
]



@testset "TextBox.jl" begin
    for lorem in lorems
        for width in (15, 21, 30, 44)
            reshaped = reshape_text(lorem, width)
            for line in split(reshaped, "\n")
                @test textwidth(line) <= width+1
            end
        end
    end
end

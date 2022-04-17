# TextBox

[![Build Status](https://github.com/FedeClaudi/TextBox.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/FedeClaudi/TextBox.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/FedeClaudi/TextBox.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/FedeClaudi/TextBox.jl)


Reshape a text (string, or multi-line string) to have a selected width. 
There's other Julia packages that do this, like [TextWrap.jl](https://github.com/carlobaldassi/TextWrap.jl), but `TextBox.jl` can also handle alphabets with non-standard unicode characters (e.g. characters with width > 1 and right-to-left languages).

Installation
```
] add TextBox
```

Usage:

```Julia
using TextBox

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
reshape_text(lorem, 31)
```

```
Latin
____________________________________________________
Lorem ipsum dolor sit amet, consectetur adipiscing 
elit, sed do eiusmod tempor incididunt ut labore 
et dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut 
aliquip ex ea commodo consequat. 
____________________________________________________

Thai
____________________________________________________
แชมเปญแมมโบ้แก๊สโซฮอล์ โค้กมาร์ชวาไรตี้ พิซซ่าคอร์รัปชั่นจิ๊กโก๋ตรวจ
ทาน บริกรปัจเจกชนไอติมอ่วมฮองเฮา ลาตินฮันนีมูนหมวย ป๊อปโปลิศไว
กิ้งป๊อกวานิลลา แชมพูเกรดไคลแมกซ์แฟ็กซ์เทรนด์ สปอร์ตพิซซ่าฮากกาส
เก็ตช์ วีไอพี ไคลแมกซ์หลวงปู่ผู้นำ
____________________________________________________

Korean
____________________________________________________
국가원로자문회의의 의장은 직전대통령이 된다, 
헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 
대통령이 임명한다, 국회가 재적의원 과반수의 찬성으로 
계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야
 한다. 감사원은 원장을 포함한 5인 이상 11인 
이하의 감사위원으로 구성한다.
____________________________________________________

Chinese
____________________________________________________
近社豪潜並送薄多注庭前使喜致健航殺。誉写運次安人性関
法下作近年一予合捕割団。控切奪人立判千家購速概込記越
。一交掲教地年府棚度士七属自復一秋今政無期
____________________________________________________

Arabic
____________________________________________________
كانت بالجانب تحت لم, إحتار الخطّة يبق أي. حقول واتّجه 
عن حتى, تصرّف الضروري باستخدام ضرب و. كلّ وحتى استرجاع
 تم. الا تم وس
____________________________________________________

Hebrew
____________________________________________________
על בדפים פיסיקה לעברית שתי, על שתי ויקימדיה לויקיפדי
ה טכנולוגיה. עמוד קסאם של צעד. בה בהשחתה קלאסיים 
כתב, צעד אם היום והנדסה. זאת התוכן בחירות האנציקלופ
דיה את, אחר או טבלאות ויקיפדיה, מה צי
____________________________________________________

```

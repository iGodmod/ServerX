-------------------------------------
Username = "4737"
Password = "4737"
Result = gg.prompt({"👨‍🔧 รหัสผู้ใช้งาน🔒",},nil,{"text"})
gg.alert("😊ใส่ชื่อ และรหัสให้ถูก ทุกครั้งที่จะใช้งานครับ\n⚠️หรือระบบหมดอายุ จะเด้งออกจากเชิฟ⚠️\n\n🤯ระบบบัค ล็อคอินไม่ได้ ติดต่อได้ที่ เฟสบุ๊ค iGodmod เน้ออ 🙏")


if Result[1] == Username and Result[1] == Password then
gg.toast('🔑รหัสถุกต้อง 🔓')
else
gg.toast("😵 ชื่อ หรือ รหัสผ่านผิด😵‍💫️")
os.exit()
end
-------------✏️✏️✏️---------
gg.alert("⚠️อ่านก่อนใช้งาน⚠️\nเปิดเน็ตก่อนใช้งานทุกครั้ง️\n\n✅️สคิปต์ออนไลน์เข้าถึงอินเตอร์เท่านั้น\n✅️ไม่มีการดักจับข้อมูลการใช้งาน \n✅️หรือโหลดไวรัสลงเครื่องปลอดภัย 100%","👉เข้าใช้งาน")
if os.date("%Y%m%d") > "20250327" then
gg.alert("iGodmod.Hacker ปิดระบบอัฟเดตปรับปรุงโค๊ดชั่วคราว\n_________________________________")
os.exit()
end
gg.alert("🔥อัฟเดตสคิปต์เชิฟแท้🔥 \n📝⭐️แก้บัคสคิปต์ทำสเต๊ปผิดพลาดใหม่ทั้งหมด⛑️\n⭐แก้บัคโค๊ดทำงานวนลูปซ้ำ\n❤️\n️\n\n⚠อ่านก่อนใช้งาน**หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป⚠️️","👉เข้าใช้งาน")
----------✌️✌️✌️✌️
gg.setVisible(false)
menu = gg.choice({
  "⭐️เติมทองโครตเยอะ(จากท่าเต้นคู่)",--1
  "😝เติมเงินM 1000ล้านน++",--2
  "🔰สเต๊ป 414",--3
  "🔰สเต๊ป 636",--4
  "🔰บัค 555",--5
  "🔰สเต๊ป 191",--6
  "🔥สเต๊ป 799  เสียงเดิมแบบไม่ใส่เครื่องสำหรับกะบะรีโวเท่านั้น",--7
  "🔥สเต๊ป 899  เสียงเดิมแบบไม่ใส่เครื่องสำหรับกะบะรีโวเท่านั้น",--8
  "🔥สเต๊ป 1199 เสียงเดิมแบบไม่ใส่เครื่องสำหรับกะบะรีโวเท่านั้น",--9
  "⭐️สเต๊ป 369-Tesla⚠",--10
  "⭐️สเต๊ป 717",--11
  "⭐️สเต๊ป 696",--12
  "⭐️สเต๊ป 404",--13
  "⭐️สเต๊ป 699",--14
  "⭐️สเต๊ป 873",--15
  "⭐️สเต๊ป 612",--16
  "⭐️สเต๊ป 944",--17
  "⭐️สเต๊ป 851",--18
  "🤔HP ดริฟ",---19
  "🔥สเต๊ป 3000+",--20
  "⭐️เสต๊ปบัค 321",--21
  "🚘เผายางทำรถดริฟ",--22
  "ปลดล็อคล้อเติม",--23
  -------------------------$$$$$$$$---------------------------------------  ------
  "EXIT ⌦"
}, nil, "⭐️เชิฟแท้ CPM 4.8.24.4.New Update ⭐️VIP Scrips by.iGodmod.Hacker ")  
-------
if menu == 1 then
gg.setRanges(gg.REGION_ANONYMOUS)
gg.alert("กดเข้าไปที่ท่าเต้นแล้วรอสคิปต์ทำงาน")
gg.sleep(5000)
gg.searchNumber("0;30;50;100;500", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(59512, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-19000000", gg.TYPE_DWORD)
gg.getResults(98)
gg.alert("กดออกจากท่าเต้น 3วิ แล้วกดเข้าใหมทันที่ ")
gg.sleep(9000)
gg.alert("กดชื้อ 1 ท่าเต้น")
gg.sleep(5000)
gg.processResume()
if revert ~= nil then gg.setValues(revert) end
revert = gg.getResults(59512, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2147483148", gg.TYPE_DWORD)
gg.alert("กดออกจากท่าเต้น 3วิ แล้วกดเข้าใหม่ ไปท่าเต้นคู่")
gg.sleep(5000)
gg.alert("กดชื้อ 1 ท่าเต้นอีกที")
gg.sleep(5000)
gg.clearResults(98)
gg.processResume()
gg.toast("สำเร็จ!!⚡️️")
gg.sleep(5000)
end
----
if menu == 2 then
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("50000000", gg.TYPE_FLOAT)
  gg.getResults(1000)
  gg.editAll("1000000000", gg.TYPE_FLOAT)
  gg.clearResults(1000)
  gg.sleep(100)
   gg.toast("รอออออระบบทำงาน")
  ---------------
gg.setRanges(gg.REGION_ANONYMOUS)
gg.alert("กดเลือกด่าน 2 แล้วกดใช้สคิปต์แล้วรอออ....")
gg.sleep(3000)
gg.searchNumber("40;60", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("900000000", gg.TYPE_FLOAT)
gg.alert("กดเลือกด่าน อื่นใหม่\nแล้วไปด่าน 1  แล้วขับรถให้เสร็จภารกิจ")
gg.toast("แฮกสำเร็จ!!!")
gg.clearResults(1000)
gg.processResume()
end



if menu == 3 then--414
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("414", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end
-----------
if menu == 4 then---636
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("636", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

--------------


--------------

if menu == 5 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("191", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7999", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end


if menu == 6 then
-- main code
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("280", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("799", gg.TYPE_FLOAT)

gg.clearResults(100000)
gg.searchNumber("340", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)

gg.clearResults(100000000)
gg.searchNumber("6700", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults(1000000)
gg.searchNumber("2000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(10000000)
gg.alert("กดชื้อ ยางรถเท่านั้น")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end
if menu == 7 then
-- main code
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("280", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("899", gg.TYPE_FLOAT)

gg.clearResults(100000)
gg.searchNumber("340", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)

gg.clearResults(100000000)
gg.searchNumber("6700", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults(1000000)
gg.searchNumber("2000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(10000000)
gg.alert("กดชื้อ ยางรถเท่านั้น")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 8 then
-- main code
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("280", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1199", gg.TYPE_FLOAT)

gg.clearResults(100000)
gg.searchNumber("340", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)

gg.clearResults(100000000)
gg.searchNumber("6700", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults(1000000)
gg.searchNumber("2000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(10000000)
gg.alert("กดชื้อ ยางรถเท่านั้น")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 9 then --11A
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(100)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("368", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 10 then---369Hp
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("717", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

-----
if menu == 11 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("696", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 12 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("498", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 13 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("699", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end



if menu == 14 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("873", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 15 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("612", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 16 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("944", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end


if menu == 17 then
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 ❤️"
gg.sleep(1000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("581", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

if menu == 18 then---ดริฟ
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 และกดชื้อ Turbo 3❤️"
gg.sleep(5000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("319", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1642", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end
-------❤️❤️❤️❤️--------


if menu == 19 then----30000
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5❤️"
gg.sleep(5000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
-- main code
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7998", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("2000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("9000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("3000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("6000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("5000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3500", gg.TYPE_FLOAT)
gg.processResume()
---@----🚫🚫🚫🚫🚫🚫
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end

-------❤️❤️❤️❤️--------
if menu == 20 then---
gg.setVisible(false)
gg.alert"กดชื้อเครื่องยนต์ L4 2.5 และกดชื้อ Turbo 3❤️"
gg.sleep(5000)
gg.alert"กดชื้อเสดกดGG 1ครั้งให้ระบบทำงาน"
gg.sleep(800)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.clearList()
while not gg.isVisible() do
end
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.processResume()
gg.searchNumber("5900", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("6773", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("190", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("321", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1234", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("4100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3456", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.setRanges(gg.REGION_CODE_APP)
gg.toast"รอระบบทำงานนน"
gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1E-38", gg.TYPE_FLOAT)
gg.processResume()
gg.toast"รอระบบทำงานนน"
gg.clearResults(10000000000)
gg.alert("กดเครื่องยนต์L4 2.5 ❤️อีกครั้ง \nและกดชื้อยาง Sport และชิพไทม์🔒")
gg.alert("หลังทำสเต๊ปเสดจะเข้าห้องเล่นออนไลน์ไม่ได้ วิธีแก้ให้รีเกมส์ทุกครั้ง หลังทำสเต๊ป✌️")
gg.toast("iGodmod.Hacker️")
end




if menu == 21 then
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.sleep(5000)
  gg.searchNumber("1.6", gg.TYPE_FLOAT)
  gg.getResults(1000000000)
  gg.editAll("-999", gg.TYPE_FLOAT)
  gg.clearResults(10000000)
  gg.sleep(5000)
  gg.alert("เผายางนานๆๆ เผาเสดกดออกรีเกม")
  gg.clearResults()
  end
  
if menu == 23 then -- Wheel premium 
gg.setVisible(false)
LibStart=gg.getRangesList('libil2cpp.so')[2].start
SP=nil
SP={}
SP[1]={}
SP[2]={}
SP[1].address=LibStart+0x30289CC
SP[1].value='h200080D2'
SP[1].flags=4
SP[2].address=LibStart+(0x30289CC+0x4)
SP[2].value='hC0035FD6'
SP[2].flags=4
gg.setValues(SP)

LibStart=gg.getRangesList('libil2cpp.so')[1].start
SP=nil
SP={}
SP[1]={}
SP[2]={}
SP[1].address=LibStart+0x30289CC
SP[1].value='h200080D2'
SP[1].flags=4
SP[2].address=LibStart+(0x30289CC+0x4)
SP[2].value='hC0035FD6'
SP[2].flags=4
gg.setValues(SP)
gg.setValues(SP)
gg.alert("🔥😊สำเร็จ✅️")
gg.toast("iGodmod.Hacker")
gg.sleep(1000)
end
-----------####--☆☆☆☆☆☆☆☆☆☆zzzzz
------####------


if menu == 25 then
end
if menu == 26 then
end
if menu == 27 then
end
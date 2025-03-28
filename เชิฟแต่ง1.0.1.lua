-----------------🔑🔑🔑--------------------
function search(class, offset, tryHard, bit32, valueType)
Get_user_input = {}
Get_user_input[1] = class
Get_user_input[2] = offset
Get_user_input[3] = tryHard
Get_user_input[4] = bit32
Get_user_type = valueType
start()
end

function loopCheck()
if userMode == 1 then
UI()
elseif error == 3 then
os.exit()
end
end

function found_(message)
if error == 1 then
found2(message)
elseif error == 2 then
found3(message)
elseif error == 3 then
found4(message)
else
found(message)
end
end

function found(message)
if count == 0 then
gg.clearResults()
gg.clearList()
first_error = message
error = 1
second_start()
end
end

function found2(message)
if count == 0 then
gg.clearResults()
gg.clearList()
second_error = message
error = 2
third_start()
end
end

function found3(message)
if count == 0 then
gg.clearResults()
gg.clearList()
third_error = message
error = 3
fourth_start()
end
end

function found4(message)
if count == 0 then
gg.clearResults()
gg.clearList()
gg.setVisible(true)
gg.toast("🚫ทำผิดวิธี Error รีเกมเปิดใหม🚫่")
loopCheck()
end
end

function user_input_taker()
::stort::
gg.clearResults()
if userMode == 1 then
if Get_user_input == nil then
default1 = "PlayerController"
default2 = "0x148"
default3 = false
default4 = false
else
default1 = Get_user_input[1]
default2 = Get_user_input[2]
default3 = Get_user_input[3]
default4 = Get_user_input[4]
end
Get_user_input = gg.prompt(
{"Class Name: ", "Offset: ","Try Harder -- (decreases accuracy)","Try For 32 bit"},
{default1,default2,default3,default4},
{"text","text","checkbox","checkbox"})
if Get_user_input ~= nil then
if (Get_user_input[1] == "") or (Get_user_input[2] == "") then
gg.alert("ไม่พบข้อมูล")
goto stort
end
else
gg.toast("ระบบผิดพลาด")
goto stort
end
Get_user_type = gg.choice({"1. Byte / Boolean","2. Dword / 32 bit Int","3. Qword / 64 bit Int","4. Float","5. Double"})
if Get_user_type == 1 then
Get_user_type = gg.TYPE_BYTE
elseif Get_user_type == 2 then
Get_user_type = gg.TYPE_DWORD
elseif Get_user_type == 3 then
Get_user_type = gg.TYPE_QWORD
elseif Get_user_type == 4 then
Get_user_type = gg.TYPE_FLOAT
elseif Get_user_type == 5 then
Get_user_type = gg.TYPE_DOUBLE
end
if Get_user_type ~= gg.TYPE_BYTE then
if (Get_user_input[2] % 4) ~= 0 then
gg.alert("Hex")
goto stort
end
end
end
error = 0 
end

function O_initial_search()
gg.setVisible(false)
gg.toast("😝รอระบบทำงาน!😝")
user_input = ":"..Get_user_input[1] 
if Get_user_input[3] then
offst = 25
else
offst = 0
end
end

function O_dinitial_search()
if error > 1 then
gg.setRanges(gg.REGION_C_ALLOC)
else
gg.setRanges(gg.REGION_OTHER)
end
gg.searchNumber(user_input, gg.TYPE_BYTE)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
Refiner = gg.getResults(1)
gg.refineNumber(Refiner[1].value, gg.TYPE_BYTE)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
val = gg.getResults(count)
gg.addListItems(val)
end

function CA_pointer_search()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
gg.loadResults(gg.getListItems())
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("CA_pointer_search")
return 0
end
vel = gg.getResults(count)
gg.clearList()
gg.addListItems(vel)
end

function CA_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
	v.address = v.address + tanker
	if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

function CA2_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
	v.address = v.address + tanker
	if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

function Q_apply_fix()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix")
return 0
end
yy = gg.getResults(1000)
gg.clearResults()
i = 1
c = 1
s = {}
while (i-1) < count do
yy[i].address = yy[i].address + 0xb400000000000000
gg.searchNumber(yy[i].address, gg.TYPE_QWORD)
cnt = gg.getResultsCount()
if 0 < cnt then
bytr = gg.getResults(cnt)
n = 1
while (n-1) < cnt do
s[c] = {}
s[c].address = bytr[n].address
s[c].flags = 32
n = n + 1
c = c + 1
end
end
gg.clearResults()
i = i + 1
end
gg.addListItems(s)
end

function A_base_value()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_value")
return 0
end
tel = gg.getResults(count)
gg.addListItems(tel)
end

function A_base_accuracy()
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_accuracy")
return 0
end
kol = gg.getResults(count)
i = 1
h = {}
while (i-1) < count do
h[i] = {}
h[i].address = kol[i].value
h[i].flags = 32
i = i + 1
end
gg.addListItems(h)
end

function A_user_given_offset()
local old_save_list = gg.getListItems()
for i, v in ipairs(old_save_list) do
v.address = v.address + Get_user_input[2]
v.flags = Get_user_type
end
gg.clearResults()
gg.clearList()
gg.loadResults(old_save_list)
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix++")
return 0
end
end

function start()
user_input_taker()
O_initial_search()
O_dinitial_search()
if error > 0 then
return 0
end
CA_pointer_search()
if error > 0 then
return 0
end
CA_apply_offset()
if error > 0 then
return 0
end
A_base_value()
if error > 0 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 0 then
return 0
end
A_user_given_offset()
if error > 0 then
return 0
end
loopCheck()
if error > 0 then
return 0
end
end

function second_start()
gg.toast("😝รอระบบทำงาน!😝")
O_dinitial_search()
if error > 1 then
return 0
end
CA_pointer_search()
if error > 1 then
return 0
end
CA_apply_offset()
if error > 1 then
return 0
end
Q_apply_fix()
if error > 1 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 1 then
return 0
end
A_user_given_offset()
if error > 1 then
return 0
end
loopCheck()
if error > 1 then
return 0
end
end

function third_start()
gg.toast("Wait.🔑..")
O_dinitial_search()
if error > 2 then
return 0
end
CA_pointer_search()
if error > 2 then
return 0
end
if offst == 0 then
CA2_apply_offset()
end
if error > 2 then
return 0
end
A_base_value()
if error > 2 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 2 then
return 0
end
A_user_given_offset()
if error > 2 then
return 0
end
loopCheck()
if error > 2 then
return 0
end
end

function fourth_start()
gg.toast("🔒🔑.")
O_dinitial_search()
CA_pointer_search()
CA2_apply_offset()
Q_apply_fix()
if offst == 0 then
A_base_accuracy()
end
A_user_given_offset()
loopCheck()
end
----------‐--------------------


function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local tt = {}
tt[1]= {}
tt[1].address = address
tt[1].flags = flags
tt[1].value = value
gg.setValues(tt)
end

--------🔑🔑🔑🔑🔑🔑------



Username = "9999"
Password = "9999"
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
if os.date("%Y%m%d") > "20251030" then
gg.alert("iGodmod.Hacker ปิดระบบอัฟเดตปรับปรุงโค๊ดชั่วคราว\n_________________________________")
os.exit()
end

----------Wait Update!-----------------
gg.sleep(10)
gg.toast("iGodmod.Hacker")
gg.sleep(10)
gg.toast("เชิฟเวอร์ออนไลน์iGodmod.Hacker🟢")
gg.sleep(10)
gg.alert("️🟢 อัฟเดตเชิฟเวอร์แต่ง Online Server iGodmod.Hacker\n\n⭐️อัฟเดตเชิฟเวอร์แต่ง\n💚อัฟเดต สเต๊ป 717\n⭐อัฟ️เดตสเต๊ป 949\n","👉ล็อคอิน 📲 เข้าสู่ระบบเชิฟเวอร์")
gg.toast ("กด GG เพื่อเริ่มใช้งานได้ทุกครั้งครับ")
gg.sleep(10)
function main()
menu = gg.multiChoice({
"🥎 เติมทอง",--A1
"🥎 เติมเงิน M",--B2
"🥎 ทำสเต๊ป",--C3---V8.4.5
"🥎 สีGGแต่งรถ-ล้อ-สีกระจก",--D4
"🥎 ล้อบัคแต่งซิ่ง",--E5
"🔒 ปิดปรังปรุง",--F6
"🥎 ทำสเต๊ปรถ F½",--G7
"🥎 ปลดล็อคระบบในเกมส์",--i8
"🥎 ถอดกันชน",---J9
"🥎 เสกรถเติม",---K10
"🥎 เสกแลมโบกินี่",--L11
"🥎 ปรับแต่งชื่อสีๆ+ระบบแก้ไขไอดี",--M12
"🥎 ภารกิจเก็บแร้ง",--Mn13
"🥎 ตัวหนังสือติดยาง",------O14
"🥎 ทำสเต๊ปรถคันใหม่ๆ⚠️",------P15
"🔏ล็อคเอ้า",-----------End15
}, nil, (os.date([[
🟢 Online Server CPM iGodmod.Hacker
Copyright@iGodmod
Time: %H:%M:%S]])) )

if menu == nil then
gg.toast("iGodmod.Hacker@ลิขสิทธิ์ เป็นทรัพย์สินทางปัญญาประเภทหนึ่งที่มอบสิทธิทางกฎหมายที่มอบให้ผู้สร้างสรรค์งานแต่เพียงผู้เดียวในการเผยแพร่ ทำซ้ำ หรือดัดแปลงงานที่สร้างสรรค์ โดยทั่วไป")
else
if menu[1] == true then--เติมทอง
M1()
end
if menu[2] == true then--เติมเงิน
M2()
end
if menu[3] == true then--ทำสเต๊ป
M3()
end
if menu[4] == true then--สีGG
M4()
end

if menu[5] == true then--ล้อแร์
M5()
end

if menu[6] == true then--แกล้งคน
M6()
end
if menu[7] == true then--F1/Old/Newปรับแต่ง300HP
M7()
end

if menu[8] == true then---ปลดล็อค
Mn8()
end

if menu[9] == true then---ถอดกันชน
M9()
end

if menu[10] == true then---เสกรถเติม
M10()
end

if menu[11] == true then---เสกรถlam
M11()
end


if menu[12] == true then---CustomeID
M12()
end

if menu[13] == true then---Rank
Mn13()
end

if menu[14] == true then---สีตัวหนังสือยาง
M14()
end


if menu[15] == true then---Hp-----
M15()
end



if menu[16] == true then----ออกระบบ
gg.alert("กดที่โลโก้ GG 1 ครั้ง ยืนยันล็อคเอ้าครับ 😊")
EXIT()

Ad()
end
end
CPM = - 1
end

function M1()
menu1 = gg.multiChoice({
	"🪙ทอง 2 หมื่น🪙/อัฟเดต🔥",
	"🔑เติมทองท่าเต้น🔑️",
	"🪙ทอง 2 พันล้าน🪙อัฟเดต🔥",
	"🔥เติมทอง 3หมื่น🔥",
	
	"❤️เปิดตลาดโลกเชิฟปรับแต่ง\n✌❤️ใช้งานได้หลังกดใช้สคิปต์เท่านั้น รีเกมส์ระบบจะปิดตลาด",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu1 == nil then
main()
else
if menu1[1] == true then---20K
A1()
end
if menu1[2] == true then--30K
A2()
end

if menu1[3] == true then---2พันล้าน
A3()
end

if menu1[4] == true then-----30K
A4()
end

if menu1[5] == true then-----openWo
A5()
end

if menu1[6] == true then -----40K
A6()
end

if menu1[7] == true then
 main()
end
end 
end

function M2()
menu2 = gg.multiChoice({
	"💰เงินไม่จำกัด💰",
	"🔥ส่งเงิน 98ล้าน",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu2 == nil then
main()
else
if menu2[1] == true then
B1()
end
if menu2[2] == true then---sendm
B2()
end

if menu2[3] == true then
 main()
end
end 
end

function M3()
menu3 = gg.multiChoice({
"🔥HP 414+ชิพพ์ไทม์+เทอร์โบ 3",--C1
"🔥HP 300+ชิพไทม์+เทอร์โบ 3",---c2
"⭐️HP 636+ชิพไทม์+เทอร์โบ 3",---c3
"✅️HP 717(8000)\n2789(7998)",---c4. v63.5
"🔥HP 949(8000)\n2300(7998)",---c5
"🔥HP บัค 1695(1000)\n2254(1001)",----c6
"🔥HP บัค 999(1100)\n2233(1200)",----c7
"🔥HP ดริฟ 321(6773)\n1234(5678)",---C8
"🔥HP 2 ระบบบัค 1038(4538)\n1133(4533)",--c9
"🔥HP 414 ธรรมดา(8000)\n2300(7998)",---c10
"⛱HP บัค+เบรคแต่ง 888 (1928)\n2299(2048)",--C11
"⛱HP 2 ระบบบัค 933(6138)\n1033(6133)",--c12
"⭐️636HP+เครื่องเดิมเกมส์+Turbo 3🔥\nรองรับเฉพาะกะบะรีโว่",--c13
"🔥KMบัค 9999999",----c14
"⭐️สเต๊ป2355HP⭐️",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu3 == nil then
main()
else
if menu3[1] == true then
C1()
end
if menu3[2] == true then
C2()
end
if menu3[3] == true then
 C3()
 end
 if menu3[4] == true then
 C4()
 end
 if menu3[5] == true then
 C5()
 end
 if menu3[6] == true then
 C6()
 end
 if menu3[7] == true then
 C7()
 end
 if menu3[8] == true then
 C8()
 end
 if menu3[9] == true then
 C9()
 end
if menu3[10] == true then
C10()
end
if menu3[11] == true then
C11()
end
if menu3[12] == true then
C12()
 end
 
 if menu3[13] == true then
C13()
 end
 
  if menu3[14] == true then
C14()
 end
 
   if menu3[15] == true then
C15()
 end
 
 if menu3[15] == true then
 main()
end
end 
end


function M4()
menu4 = gg.multiChoice({
	"🍌สีไฟหน้ารถสีชมพู",---D1FIX
	"🍌สียูนิคอนเรนโบว์\n(เลือกทำได้ว่าจะทำรถ/หรือทำล้อ)",
	"🍌ล้อสีโครเมี่ยมเงิน",
	"🍌สีไฟหน้ารถสีแดง",---D4
	"🍌สีพิเศษไฟหน้ารถ ขาว+น้ำเงิน️️",--D5
	"👍️สีล้อดำเมทัลGG",--D6
	"🩴🍈ล้อสีสนิม",--D7
	"🍓ไฟหน้าสีขาว\nเปิดไฟเรืองแสงจะเปนฟ้า",---D8
	"🍥ไฟเรืองแสงสีขาว",--D9
	"🔥ไฟเรืองแสง 3สี ชมพุ+น้ำเงิน/แกมม่วง/สีCyberpunK",--D10
	"❤️ใหม่❤️️กระจกเรืองแสง",---D11
	"💛เบรคสีเขียว+ชมพู",
   "💛เบรคสีชมพู",
  "💛เบรคสีเขียวน้ำเงิน",
  "💛เบรคสีแดง",
  "💛เบรคสีเหลืองแดง",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu4 == nil then
main()
else
if menu4[1] == true then
D1()
end
if menu4[2] == true then
D2()
end

if menu4[3] == true then
D3()
end

if menu4[4] == true then---แดง
D4()
end

if menu4[5] == true then---ขาวน้ำเงิน
D5()
end

if menu4[6] == true then---ล้อดำเมทัลลล
D6()
end

if menu4[7] == true then --สีสนิม
D7()
end


if menu4[8] == true then --สีขาว/ฟ้าสลับสี
D8()
end

if menu4[9] == true then --สีขาว
D9()
end

if menu4[10] == true then --CyberpunK
D10()
end


if menu4[11] == true then --กระจกเรืองแสง01
D11()
end-------


if menu4[12] == true then --เบรค2สีเขียวชม
D12()
end


if menu4[13] == true then --CyberpunK
D13()
end




if menu4[14] == true then --CyberpunK
D14()
end



if menu4[15] == true then --CyberpunK
D15()
end
------

if menu4[16] == true then --CyberpunK
D16()
end


if menu4[17] == true then --CyberpunK
D17()
end


if menu4[18] == true then --CyberpunK
D18()
end
if menu4[19] == true then---
 main()
end
end 
end


function M5()
menu5 = gg.multiChoice({
	"🔥ล้อแร์ ",
	"🔥ล้อล้นครับจ่า",
	"🔥ล้อยัดชุ้มโหลดต่ำลง",
	"⭐️บัคล้อเห็บหมา",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu5 == nil then
main()
else
if menu5[1] == true then
E1()
end
if menu5[2] == true then
E2()
end

if menu5[3] == true then
E3()
end

if menu5[4] == true then
E4()
end

if menu5[5] == true then
 main()
end
end 
end

function M6()
menu6 = gg.multiChoice({
"เปิด 🔐 กุญแจผี ขึ้นรถได้ทุกคัน",--F1
"️เปิด ✅ ️แฮกขับรถคันไหนจะบัคทุกคัน",--F2
"ปิด  🚫 ระบบแฮกขึ้นรถจะเปนรถปกติ",--F3
"เปิด 👣 เกรียนพาวาปไปที่ไกลๆ",--F4
"เปิด ✅️ วิ่งเร็วขึ้น 100% ",--F5
"ปิด 🚫 วิ่งเร็ว ",--F6
"เปิด ✅️รถหมุนกลางอากาศ",--F7
"ปิด 🚫รถหมุน",--F8
"🤪รถโครงไก่บัค",--F9
"⭐️ทำHPเกินก็แข่งได้.",---F10
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")--F9
if menu6 == nil then
main()
else
if menu6[1] == true then
F1()
end
if menu6[2] == true then
F2()
end
if menu6[3] == true then
F3()
end
if menu6[4] == true then
F4()
end
if menu6[5] == true then
F5()
end
if menu6[6] == true then
F6()
end
if menu6[7] == true then
F7()
end
if menu6[8] == true then
F8()
end

if menu6[9] == true then
F9()
end

if menu6[10] == true then
F10()
end


if menu6[11] == true then
 main()
end
end 
end

function M7()
menu7 = gg.multiChoice({
	"⭐️F1 เก่า🔧/9999+HP",
	"⭐️F2 ใหม่🔧636HP",
	"🔥F2 ใหม่ 888HP",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu7 == nil then
main()
else
if menu7[1] == true then
G1()
end
if menu7[2] == true then
G2()
end
if menu7[3] == true then
G3()
end
if menu7[4] == true then
 main()
end
end 
end

function Mn8()
menu8 = gg.multiChoice({
	"🔐ปลดล็อคล้อเติม",
	"🚫กำลังทำระบบปลดล็อครถเติมแบบใหม่ \nHP เดิมโรงงาน",
	"ปลดล็อคหวอ(เทียม*เปิดไฟหวอไม่ได้)",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu8 == nil then
main()
else
if menu8[1] == true then
i1()
end
if menu8[2] == true then
i2()
end

if menu8[3] == true then
i3()
end

if menu8[4] == true then
 main()
end
end 
end

function M9()
menu9 = gg.multiChoice({
  "🔩ถอดกันชนกะบะรีโว่",
  "🔩ถอดกันชน EK",
  "🔩ถอดกันชน FK",
  "🔩ถอดกันชน R32",
  "🔩ถอดกันชน R34",
  "🔩ถอดกันชน R35",
  "🔩ถอดกันชน AE86",
  "🔩ถอดกันชน S14",
  "🔩ถอดกันชน S200",
  "🔩ถอดกันชน FD",---10
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu9 == nil then
main()
else
if menu9[1] == true then
J1()
end
if menu9[2] == true then
J2()
end

if menu9[3] == true then
J3()
end
if menu9[4] == true then
J4()
end

if menu9[5] == true then
J5()
end
if menu9[6] == true then
J6()
end

if menu9[7] == true then
J7()
end
if menu9[8] == true then
J8()
end

if menu9[9] == true then
J9()
end

if menu9[10] == true then
J10()
end

if menu9[11] == true then
 main()
end
end 
end
-------------------------

function M10()
menu10 = gg.multiChoice({
"DODGE RAM",
"NISSAN 350Z",
"NISSAN 240SX",
"TOYOTA CAMRY",
"NISSAN GTR32",
"BMW M2",
"BMW i8",
"BMW X6",
"BMW G82",
"BMW M5",
"BMW M8",
"MERCEDES BENZ E63",
"MERCEDES BENZ S63",
"MERCEDES BENZ GT63",
"DODGE VIPER SRT",
"LAMBORGHINI URUS",
"BUGGY ARIEL NOMAD",
"FORMULA-F1",
"NEW FORMULA FI",
"PORSCHE 911",
"MCLAREN 720S",
"CHEVROLET CORVETTE",
"BUGATTI CHIRON",
"FORD HOONITRUCK",
"HOONICORN MUSTANG",
"FORD F-150 RAPTOR",
"NEW BUS",
"NEW RAM TRX",
"NEW BMW M3 G81",
"SLR MCLAREN",
"NEW BUS 2",
"KOENIGSEGG JESKO",
"2006 CORVETTE C6",
"MERCEDES BENZ CLK",
"2021 DODGE DORANGO",
"PAGANI ZONDA",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
if menu10 == nil then
main()
else
if menu10[1] == true then
K1()
end
if menu10[2] == true then
K2()
end
if menu10[3] == true then
K3()
end
if menu10[4] == true then
K4()
end
if menu10[5] == true then
K5()
end
if menu10[6] == true then
K6()
end
if menu10[7] == true then
K7()
end
if menu10[8] == true then
K8()
end
   if menu10[9] == true then
   K9()
   end
  if menu10[10] == true then
  K10()
  end
  if menu10[11] == true then
  K11()
  end
  if menu10[12] == true then
  K12()
  end
  if menu10[13] == true then
  K13()
  end
  if menu10[14] == true then
  K14()
  end
  if menu10[15] == true then
  K15()
  end
 if menu10[16] == true then
 K16()
 end
 if menu10[17] == true then
 K17()
 end
 if menu10[18] == true then
 K18()
 end
 if menu10[19] == true then
 K19()
 end
if menu10[20] == true then
K20()
end
 if menu10[21] == true then
 K21()
 end
 if menu10[22] == true then
 K22()
 end
 if menu10[23] == true then
 K23()
 end
 if menu10[24] == true then
 K24()
 end
 if menu10[25] == true then
 K25()
 end
 if menu10[26] == true then
 K26() 
 end
 if menu10[27] == true then
K27()                                 
end
if menu10[28] == true then
K28()
end
if menu10[29] == true then
K29()
end
if menu10[30] == true then
K30()
end
if menu10[31] == true then
K31()
end
if menu10[32] == true then
K32()
end
if menu10[33] == true then
K33()
end
if menu10[34] == true then
K34()
end
if menu10[35] == true then
K35()
end
if menu10[36] == true then
K36()
end
if menu10[37] == true then
   main()
end
end 
end

-------
function M11()
menu11 = gg.multiChoice({
"🦬เสกแลมโบฮูราคาน",
"🦬เสกแลมโบอะเวนทาดอ",
" 🦬เสกแลมโบเวนีโน่",
" 🦬เสกแลมโบกัลลาโด",
" 🦬เสกแลมโบ SVJ",
"🦬เสกแลมโบ อูรุส",
"กลับเมนุหลัก",
},nil,"iGodmod")
	if menu11 == nil then
main()
else
if menu11[1] == true then
l1()
end
if menu11[2] == true then
l2()
end

if menu11[3] == true then
l3()
end
if menu11[4] == true then
l4()
end

if menu11[5] == true then
l5()
end


if menu11[6] == true then
l6()
end

if menu11[7] == true then
 main()
end
end 
end

function l1()
 gg.alert("🌱รออออ......ระบบทำงาน")
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("24", gg.TYPE_DWORD)
  gg.processResume()
  gg.toast("กดชื้อเลย")
end

function l2()
gg.alert("🌱รออออ......ระบบทำงาน")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("66", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.processResume()
  gg.alert("เลื่อนหารถกะป๋อง")
  gg.sleep(1000)
 gg.toast("กดชื้อเลย")
end

function l3()
gg.alert("🌱รออออ......ระบบทำงาน")
   gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("68", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.processResume()
  gg.alert("เลื่อนหารถกะป๋อง")
  gg.sleep(1000)
 gg.toast("กดชื้อเลย")
end

function l4()
gg.alert("🌱รออออ......ระบบทำงาน")
   gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("101", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.processResume()
  gg.alert("เลื่อนหารถกะป๋อง")
  gg.sleep(1000)
 gg.toast("กดชื้อเลย")
end

function l5()
gg.alert("🌱รออออ......ระบบทำงาน")
   gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("345", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.processResume()
  gg.alert("เลื่อนหารถกะป๋อง")
  gg.sleep(1000)
 gg.toast("กดชื้อเลย")
end

function l6()
gg.alert("🌱รออออ......ระบบทำงาน")
   gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("293", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.processResume()
  gg.alert("เลื่อนหารถกะป๋อง")
  gg.sleep(1000)
 gg.toast("กดชื้อเลย")
end




--------
function M12()
menu12 = gg.multiChoice({
"⭐️ชื่อยาวๆ🔥",
"🍋ชื่อสีเหลือง",
"🥬ชื่อสีเขียว",
"🍊ชื่อสีส้ม",
"🧊ชื่อสีฟ้า",
"🥎‍ชื่อสีดำ",
"🌸ชื่อสีชมพู",
"❤ชื่อสีแดง",
"กลับเมนุหลัก",},nil,"iGodmod")
	if menu12 == nil then
main()
else

if menu12[1] == true then
m1()
end

if menu12[2] == true then
m2()
end

if menu12[3] == true then
m3()
end
if menu12[4] == true then
m4()
end

if menu12[5] == true then
m5()
end

if menu12[6] == true then
m6()
end

if menu12[7] == true then
m7()
end
if menu12[8] == true then
m8()
end

if menu12[9] == true then
 main()
end
end
end

----------------


function m1()----ชื่อยาวๆๆๆ
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("ใส่เลข 1 ลงในช่องตั้งชื่อ")
  gg.sleep(5555)
  gg.searchNumber("12;1", gg.TYPE_DWORD)
  gg.alert("ใส่เลข 123 ลงในช่องตั้งชื่อ")
  gg.sleep(5555)
  gg.refineNumber("12;3", gg.TYPE_DWORD)
  gg.getResults(20)
  gg.editAll("5000", gg.TYPE_DWORD)
  gg.clearResults(20)
  gg.alert("คำเตือน! ถ้าทำไม่ใด้ ให้ทำบ่อยๆเดะก็เก่งครับ")
gg.alert("ใส่ชื่อที่ต้องการลงในช่องตั้งชื่อได้เลย/nไม่เกิน20ตัวอักษร")
gg.toast("iGodmod.Hacker")
gg.toast("สำเร็จ😝😝")
end


function m2()----ทอง
gg.copyText("[FFFF33]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m3()----เขียวมะนาว
gg.copyText("[f9fbe7]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m4()---ส้ม
gg.copyText("[ffe082]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m5()-----ฟ่าา
gg.copyText("[e1f5fe]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m6()--ดำ
gg.copyText("[330000]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m7()---ชม
gg.copyText("[FF33FF]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function m8()-----แดง
gg.copyText("[FF0000]")
gg.alert("1.กดค้าง แล้วกดวางระบบโค๊ดสี\n2.สามารถพิมชื้อตามได้เลย\n3.ใส่ชื่อได้ 1-4ตัวอักษรเท่านั้นห้ามเกิน")
gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end


function m9()
 main()
end
----


----------


function Mn13()---Rankup
menu13 = gg.multiChoice({
    "🔥ภารกิจตำรวจจับ",
    "🔥ภารกิจซ่อมรถ",
    "🔥ภารกิจส่งสติ๊กเกอร์",
    "🔥ภารกิจตุ้เก็บตัง",
    "🔥ภารกิจป้ายจับความเร็ว",
    "🔥ภารกิจแข่งแดร๊กชนะ",
    "🔥ภารกิจเผายาง",
    "🔥ภารกิจเติมน้ำมัน",
    "🔥ภารกิจล้างรถ",
    "🔥ภารกิจแฮกเวลาที่เล่นเกม",
    "🚛ภารกิจ DISTANCE/OFF-ROAD",--n11
	"🚫รีเช็ตระบบDISTANCE/OFF-ROAD",--12
	"🚚DRIFT MASTER/DRIFT KING",--13
    "🚫รีเซ็ตระบบ DRIFT MASTER/DRIFT KING",--14
    "🚜ภารกิจ LEVEL",--15
    "🚫รีเซ็ตระบบภารกิจ LEVEL",--16
    "🚸ภารกิจวิ่งไวX300%",
    "กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu13 == nil then
main()
else
if menu13[1] == true then
n1()
end
if menu13[2] == true then
n2()
end

if menu13[3] == true then
n3()
end
if menu13[4] == true then
n4()
end

if menu13[5] == true then
n5()
end
if menu13[6] == true then
n6()
end

if menu13[7] == true then
n7()
end
if menu13[8] == true then
n8()
end

if menu13[9] == true then
n9()
end

if menu13[10] == true then
n10()
end
if menu13[11] == true then
n11()
end

if menu13[12] == true then
n12()
end

if menu13[13] == true then
n13()
end


if menu13[14] == true then
n14()
end

if menu13[15] == true then
n15()
end

if menu13[16] == true then
n16()
end

if menu13[17] == true then
n17()
end


if menu13[18] == true then
 main()
end
end 
end


--------------O14----------------


function M14()
menu1 = gg.multiChoice({
	"⭐️โค๊ดยาง กวนๆ🐶4 แ***มึง สุด!",
	"⭐️โค๊ดยาง FuckYou",
    "⭐️โค๊ดยาง สีรุ้ง",
	"⭐️โค๊ดยาง iGodmod.Hacker ",
	"🏁❤️โค๊ดยาง 3 สี",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu1 == nil then
main()
else
if menu1[1] == true then
O1()
end
if menu1[2] == true then
O2()
end

if menu1[3] == true then
O3()
end

if menu1[4] == true then-----l
O4()
end

if menu1[5] == true then-----!!
O5()
end

if menu1[9] == true then
 main()
end
end 
end
---------------codetire------------

function O1()----
gg.alert("1.กดเข้าไปที่ปรับแต่งใส่ล้อ \n2.แล้วเตรียมตัวใส่ตัวหนังสือบนยางล้อรถ")
gg.copyText("<color=pink>ลูกกะXรี่</color><color=Red>หมา4แม่มึง!</color>  <color=pink>ลูกกะXรี่</color><color=Red>หมา4แม่มึง!</color>")
gg.alert("3.กดค้าง แล้วกดวางระบบโค๊ดได้เลย")
gg.sleep("3000")
gg.copyText("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0SDNcMgsFP6LYD221Toi6BdjvSHuxqvg7A&s")
gg.toast("สำเร็จ😝😝")
gg.clearResults(10)
gg.clearList(10)
gg.sleep("1")
end


function O2()----
gg.alert("1.กดเข้าไปที่ปรับแต่งใส่ล้อ \n2.แล้วเตรียมตัวใส่ตัวหนังสือบนยางล้อรถ")
gg.copyText("<color=pink>Fᶸᶜᵏᵧₒᵤ!</color><color=Red>Fᶸᶜᵏᵧₒᵤ!</color>")
gg.alert("3.กดค้าง แล้วกดวางระบบโค๊ดได้เลย")
gg.sleep("3000")
gg.copyText("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0SDNcMgsFP6LYD221Toi6BdjvSHuxqvg7A&s")
gg.toast("สำเร็จ😝😝")
gg.clearResults(10)
gg.clearList(10)
gg.sleep("1")
end


function O3()----
gg.alert("1.กดเข้าไปที่ปรับแต่งใส่ล้อ \n2.แล้วเตรียมตัวใส่ตัวหนังสือบนยางล้อรถ")
gg.copyText("<color=red>███</color><color=orange>███</color><color=yellow>███</color><color=lime>███</color><color=cyan>███</color><color=purple>███</color>")
gg.alert("3.กดค้าง แล้วกดวางระบบโค๊ดได้เลย")
gg.sleep("3000")
gg.copyText("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0SDNcMgsFP6LYD221Toi6BdjvSHuxqvg7A&s")
gg.toast("สำเร็จ😝😝")
gg.clearResults(10)
gg.clearList(10)
gg.sleep("1")
end

function O4()----
gg.alert("1.กดเข้าไปที่ปรับแต่งใส่ล้อ \n2.แล้วเตรียมตัวใส่ตัวหนังสือบนยางล้อรถ")
gg.copyText("<color=Yellow>iGodmod</color><color=Red>.Hacker</color>")
gg.alert("3.กดค้าง แล้วกดวางระบบโค๊ดได้เลย")
gg.sleep("3000")
gg.copyText("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0SDNcMgsFP6LYD221Toi6BdjvSHuxqvg7A&s")
gg.toast("สำเร็จ😝😝")
gg.clearResults(10)
gg.clearList(10)
gg.sleep("1")
end

function O5()----
gg.alert("1.กดเข้าไปที่ปรับแต่งใส่ล้อ \n2.แล้วเตรียมตัวใส่ตัวหนังสือบนยางล้อรถ")
------------wait-------
gg.alert("3.กดค้าง แล้วกดวางระบบโค๊ดได้เลย")
gg.sleep("3000")
gg.copyText("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL0SDNcMgsFP6LYD221Toi6BdjvSHuxqvg7A&s")
gg.toast("สำเร็จ😝😝")
gg.clearResults(10)
gg.clearList(10)
gg.sleep("1")
end


-----------

function M15()
menu1 = gg.multiChoice({
	"💙️414HP รถแคลน!",
	"💚300HP รถแคลน️",
    "❤️636HP รถแคลน️",
	"️🧡999บัค รถแคลน️",
	"💜414บัค รถแคลน️",
"กลับเมนูหลัก"},nil,"iGodmod.Hacker")
	if menu1 == nil then
main()
else
if menu1[1] == true then
p1()
end
if menu1[2] == true then
p2()
end

if menu1[3] == true then
p3()
end

if menu1[4] == true then-----l
p4()
end

if menu1[5] == true then-----!!
p5()
end

if menu1[9] == true then
 main()
end
end 
end
---------------codetire------------

function p1()
 gg.alert("เลื่อนหารถกะป๋องแล้วกดรอที่ใส่เครื่องยนต์")
 gg.sleep("500")
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("414", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(100000)

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)
gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่องL4 2.0")
 gg.sleep(10000)
gg.toast("iGodmod.Hacker")
gg.clearResults(100000000)
 gg.alert("กดไปที่ตรงใส่อะไหล่แต่งรถแล้วรอออระบบทำงาน️")
 gg.sleep(1000)
------Tranfer---J
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("89", gg.TYPE_DWORD)
gg.getResults(500)
gg.editAll("536", gg.TYPE_DWORD)
gg.clearResults(500)
gg.alert("1.กดกลับแล้วปิดเกมเปิดใหม /n2.เปิดเกมส์ใหม่แล้ว กด Save ไอดี \n3.แล้วไปล็อคอินในรหัสแท้จะเจอรถนั้นๆ")
gg.sleep(10)
 gg.toast("สำเร็จ /")
end

function p2()---300Hp
 gg.alert("เลื่อนหารถกะป๋องแล้วกดรอที่ใส่เครื่องยนต์")
 gg.sleep("500")
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("300", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(100000)

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)
gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่องL4 2.0")
 gg.sleep(10000)
gg.toast("iGodmod.Hacker")
gg.clearResults(100000000)
 gg.alert("กดไปที่ตรงใส่อะไหล่แต่งรถแล้วรอออระบบทำงาน️")
 gg.sleep(1000)
------Tranfer---J
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("89", gg.TYPE_DWORD)
gg.getResults(500)
gg.editAll("536", gg.TYPE_DWORD)
gg.clearResults(500)
gg.alert("1.กดกลับแล้วปิดเกมเปิดใหม /n2.เปิดเกมส์ใหม่แล้ว กด Save ไอดี \n3.แล้วไปล็อคอินในรหัสแท้จะเจอรถนั้นๆ")
gg.sleep(10)
 gg.toast("สำเร็จ /")
end

-------

function p3()---636
 gg.alert("เลื่อนหารถกะป๋องแล้วกดรอที่ใส่เครื่องยนต์")
 gg.sleep("500")
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("636", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults(100000)

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)
gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่องL4 2.0")
 gg.sleep(10000)
gg.toast("iGodmod.Hacker")
gg.clearResults(100000000)
 gg.alert("กดไปที่ตรงใส่อะไหล่แต่งรถแล้วรอออระบบทำงาน️")
 gg.sleep(1000)
------Tranfer---J
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("89", gg.TYPE_DWORD)
gg.getResults(500)
gg.editAll("536", gg.TYPE_DWORD)
gg.clearResults(500)
gg.alert("1.กดกลับแล้วปิดเกมเปิดใหม /n2.เปิดเกมส์ใหม่แล้ว กด Save ไอดี \n3.แล้วไปล็อคอินในรหัสแท้จะเจอรถนั้นๆ")
gg.sleep(10)
 gg.toast("สำเร็จ /")
end
-------
function p4()-----999บัค
 gg.alert("เลื่อนหารถกะป๋องแล้วกดรอที่ใส่เครื่องยนต์")
 gg.sleep("500")
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("999.99", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2233", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("1100", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1200", gg.TYPE_FLOAT)
gg.clearResults(100000)

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)
gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่องL4 2.0")
 gg.sleep(10000)
gg.toast("iGodmod.Hacker")
gg.clearResults(100000000)
 gg.alert("กดไปที่ตรงใส่อะไหล่แต่งรถแล้วรอออระบบทำงาน️")
 gg.sleep(1000)
------Tranfer---J
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("89", gg.TYPE_DWORD)
gg.getResults(500)
gg.editAll("536", gg.TYPE_DWORD)
gg.clearResults(500)
gg.alert("1.กดกลับแล้วปิดเกมเปิดใหม /n2.เปิดเกมส์ใหม่แล้ว กด Save ไอดี \n3.แล้วไปล็อคอินในรหัสแท้จะเจอรถนั้นๆ")
gg.sleep(10)
 gg.toast("สำเร็จ /")
end

---------
function p5()
 gg.alert("เลื่อนหารถกะป๋องแล้วกดรอที่ใส่เครื่องยนต์")
 gg.sleep("500")
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("414", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2299", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("1150", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1250", gg.TYPE_FLOAT)
gg.clearResults(100000)

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)
gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่องL4 2.0")
 gg.sleep(10000)
gg.toast("iGodmod.Hacker")
gg.clearResults(100000000)
 gg.alert("กดไปที่ตรงใส่อะไหล่แต่งรถแล้วรอออระบบทำงาน️")
 gg.sleep(1000)
------Tranfer---J
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("89", gg.TYPE_DWORD)
gg.getResults(500)
gg.editAll("536", gg.TYPE_DWORD)
gg.clearResults(500)
gg.alert("1.กดกลับแล้วปิดเกมเปิดใหม /n2.เปิดเกมส์ใหม่แล้ว กด Save ไอดี \n3.แล้วไปล็อคอินในรหัสแท้จะเจอรถนั้นๆ")
gg.sleep(10)
 gg.toast("สำเร็จ /")
end








--------Rank------------------
function n1()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xA4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n2()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xE4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n3()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xF4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n4()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0x74", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n5()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0x84", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n6()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0x94", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n7()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xB4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n8()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xC4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n9()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("DataBaseFreeDrive", "0xD4", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end

function n10()
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  search("AnaliticsWhere", "0x18", false, false, gg.TYPE_FLOAT)
  gg.getResults(9999)
  gg.editAll(99999, gg.TYPE_FLOAT)
  gg.toast("สำเร็จ😝😝")
  gg.clearResults()
  gg.clearList()
end



function n11()---offroad

 gg.sleep(3000)
 gg.alert("กดเล่นออนไลน์ทะเลทรายเท่านั้น")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.001", gg.TYPE_FLOAT)
gg.getResults(2000)
gg.editAll("0.99800002575",gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(2000)
gg.editAll("999999",gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ใช้ทำภารกิจสำเร็จ อย่าลืมรีเช็ตระบบแฮก")
end

function n12()

 gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.99800002575",  gg.TYPE_FLOAT)
gg.getResults(2000)
gg.editAll("0.001",  gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("999999",  gg.TYPE_FLOAT)
gg.getResults(2000)
gg.editAll("500",  gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("🚫")
gg.clearResults()
end

function n13()---driftking

 gg.sleep(3000)
gg.alert("กดเล่นขับรถ ยาวๆๆๆๆด่าน ออนไลน์ทะเลทรายเท่านั้น")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.001", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("9999", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ใช้ทำภารกิจสำเร็จ อย่าลืมรีเช็ตระบบแฮก")
end



function n14() 

 gg.sleep(30)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("9999", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.001", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("🚫")
gg.clearResults()
end


 
function n15()---Lv 
 
gg.sleep(30)
 gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-45", gg.TYPE_FLOAT)
gg.toast("ใช้ทำภารกิจสำเร็จ อย่าลืมรีเช็ตระบบแฮก")
gg.clearResults()
 end
 
 
function n16()  
 
gg.sleep(10)
 gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-45", gg.TYPE_FLOAT)
gg.toast("🚫🚫")
gg.clearResults()
 
end



function n17()  
gg.alert"(วิ่งในด่านดันโลทางยาง หรือทะเลทรายเท่านั้น!!)"
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1.0", gg.TYPE_DOUBLE)
gg.getResults(1000)
gg.editAll("300", gg.TYPE_DOUBLE)
gg.clearResults()
gg.alert"(วิ่งเลยยยย!!)"
end





-----------

function A1()
-- main code on
gg.toast("iGodmod.Hacker")
function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local iGodmod = {}
iGodmod[1]= {}
iGodmod[1].address = address
iGodmod[1].flags = flags
iGodmod[1].value = value
gg.setValues(iGodmod)
end
gg.toast("iGodmod.Hacker")
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA4 setvalue(Tester+Lua,16,-2.95849427e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA8 setvalue(Tester+Lua,16,-6.13017998e13)
gg.alert("เข้าห้องเล่นในแมพแล้วกดออก")
gg.toast("Youtube")
gg.sleep(5000)
gg.toast("iGodmod.Hacker")
end


function A2()
-- main code
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
gg.alert("กดออกจากท่าเต้น 3วิ แล้วกดเข้าใหมทันที่")
gg.sleep(5000)
gg.alert("กดชื้อ 1 ท่าเต้นอีกที")
gg.sleep(5000)
gg.clearResults(98)
gg.processResume()
gg.toast("สำเร็จ /!!⚡️️")
gg.sleep(5000)
end

function A3()------ทอง 2ล้าน+++++

gg.toast("iGodmod.Hacker")
function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local iGodmod = {}
iGodmod[1]= {}
iGodmod[1].address = address
iGodmod[1].flags = flags
iGodmod[1].value = value
gg.setValues(iGodmod)
end
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA4 setvalue(Tester+Lua,16,-3.77822904e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA8 setvalue(Tester+Lua,16,-6.13017998e13)
gg.alert("เข้าห้องเล่นในแมพแล้วกดออก")
gg.toast("Youtube")
gg.sleep(5000)
gg.toast("iGodmod.Hacker")
end

function A4()------ทอง 3หมื่น

gg.toast("iGodmod.Hacker")
function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local iGodmod = {}
iGodmod[1]= {}
iGodmod[1].address = address
iGodmod[1].flags = flags
iGodmod[1].value = value
gg.setValues(iGodmod)
end
gg.toast("iGodmod.Hacker")
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA4 setvalue(Tester+Lua,16,-3.06335187e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x2A6CEA8 setvalue(Tester+Lua,16,-6.13017998e13)
gg.alert("เข้าห้องเล่นในแมพแล้วกดออก")
gg.toast("Youtube")
gg.sleep(5000)
gg.toast("iGodmod.Hacker")
end
---A4

function A6()---2K Gold New
-- main code on
gg.toast("iGodmod.Hacker")
function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local iGodmod = {}
iGodmod[1]= {}
iGodmod[1].address = address
iGodmod[1].flags = flags
iGodmod[1].value = value
gg.setValues(iGodmod)
end
gg.toast("iGodmod.Hacker")
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x211EEB4 setvalue(Tester+Lua,16,-3.77822904e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x211EEB8 setvalue(Tester+Lua,16,-6.13017998e13)
gg.alert("เข้าห้องเล่นในแมพแล้วกดออก")
gg.toast("Youtube")
gg.sleep(5000)
gg.toast("iGodmod.Hacker")
end



function A5()---OpenWorld
gg.alert("รอระบบทำงาน")
Tester = gg.getRangesList("libil2cpp.so")[2].start
  Lua = 0x290CB90
  setvalue(Tester + Lua, 16, -274878956000)
  Tester = gg.getRangesList("libil2cpp.so")[2].start
  Lua = 0x290CB94
  setvalue(Tester + Lua, 16, -61301799800000)
gg.alert("ปลดตลาดโลกเรียบร้อย เข้าเล่นในแมพแล้วกดออกมาเมนูหลัก")
end
-------

function A6() -- 40K
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x211EEB4 setvalue(Tester+Lua,16,-3.16820947e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x211EEB8 setvalue(Tester+Lua,16,-6.13017998e13)
gg.alert("เข้าห้องเล่นในแมพแล้วกดออก")
end





----------⭐️⭐️⭐️⭐️⭐️⭐️⭐️-----------

function B1()
-- hacKM
gg.setVisible(false)
gg.alert ("กดไปที่ภารกิจที่ 3 แล้ว กดจีจี 1ครั้งระบบจะทำงานทันที")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end 
gg.setVisible(false) gg.clearResults()
gg.setRanges(32)
gg.searchNumber("40",gg.TYPE_FLOAT)
gg.setVisible(false)
gg.getResults(1000)
gg.editAll("50000000",gg.TYPE_FLOAT)
gg.clearResults()
gg.clearList()
gg.setRanges(16384)
gg.searchNumber("50000000",gg.TYPE_FLOAT)
gg.setVisible(false)
gg.getResults(100)
gg.editAll("1917191729192019001910",gg.TYPE_FLOAT)
gg.alert ("กดไปที่ภารกิจที่ 1")
gg.toast("ขับทำภารกิจให้เสร็จ")
gg.sleep(5000)
gg.clearResults(1000)
gg.toast("สำเร็จ /!!⚡️️")
gg.sleep(200)
end

function B2()
-- send M
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("16D;17D;18D;19D;20D;21D;22D; 23D;24D;25D;32D:41", gg.TYPE_DWORD)
gg.getResults(1000)

gg.toast("กำลังแฮกระบบ...")
gg.sleep("6000")
gg.refineNumber("16", gg.TYPE_DWORD)
  gg.getResults(1000)
  gg.alert("OK 😝รอระบบทำงาน!😝. ")
  gg.sleep(100)
gg.editAll("10,000,000", gg.TYPE_DWORD)
gg.clearResults(1000)
gg.alert"(สำเร็จ /กดส่ง 1000บ.รับ 98ล้าน!!)"
end


function C1()
gg.alert("iGodmod.Hacker⚡️")
gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1000000000)
  gg.editAll("319", gg.TYPE_FLOAT)
  gg.clearResults(10000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(200000)
  gg.editAll("1642", gg.TYPE_FLOAT)
  gg.clearResults(2000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(2)
gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(5000000)
  gg.editAll("7998", gg.TYPE_FLOAT)
  gg.clearResults(500000)
  gg.sleep(100)
gg.searchNumber("0.1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("9.999999E-09", gg.TYPE_FLOAT)
gg.clearResults(47)
gg.sleep(100)
  gg.alert("1.รีเช็ตHP\n2.กดชื้อเครื่องยนต์L4 2.5 และ Turbo 3\n3.และ กดชื้อ ฟาสเกียร์บล็อค ก็เสร็จครับ")
  gg.toast("iGodmod.Hacker")
  gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C2()
 gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(1000000000)
  gg.editAll("1643", gg.TYPE_FLOAT)
  gg.clearResults(10000000)
  gg.sleep(5000)
  gg.toast("รอ 4วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(200000)
  gg.editAll("231", gg.TYPE_FLOAT)
  gg.clearResults(2000000)
  gg.sleep(5000)
  gg.toast("รอ 3วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(5000)
  gg.toast("รอ 2วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(5000000)
  gg.editAll("7998", gg.TYPE_FLOAT)
  gg.clearResults(500000)
  gg.sleep(3000)
  gg.toast("รอ 1วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("50000", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.sleep(5000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("0.1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("9.999999E-09", gg.TYPE_FLOAT)
  gg.clearResults(47)
  gg.sleep(5000)
  gg.alert("1.กดชื้อ L4 2.5")
  sleep(100)
  gg.alert("2.กดชื้อ.Turbo 3")
  gg.sleep(100)
  gg.alert("3.และ กดชื้อ Fast GearBox ก็เสร็จครับ ")
  sleep(100)
  gg.toast("Thank You")
   gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C3()
 gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.toast("iGodmod.Hacker🔥")
  gg.searchNumber("415", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("530", gg.TYPE_FLOAT)
  gg.clearResults(10)
  gg.sleep(100)
  gg.toast("รอ 4วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("430", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("2146", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.toast("รอ 3วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("7000", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.toast("รอ 2วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4000", gg.TYPE_FLOAT)
  gg.getResults(5)
  gg.editAll("7998", gg.TYPE_FLOAT)
  gg.clearResults(5)
  gg.sleep(100)
  gg.toast("รอ 1วิ")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("50000", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("0.1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("9.949219e-44", gg.TYPE_FLOAT)
  gg.clearResults(47)
  gg.sleep(100)
  gg.alert("1.กดชื้อ V8.4.5")
  gg.alert("2.กดชื้อ.Turbo อันที่ 2")
  gg.alert("3.และ กดชื้อ Fast GearBox ก็เสร็จครับ ")
  gg.toast("Thank You")
   gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end


function C4()---V6.3.5
gg.toast("⚡️iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280", gg.TYPE_FLOAT)
gg.getResults(20000000)
gg.editAll("717", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("350", gg.TYPE_FLOAT)
gg.getResults(20000000)
gg.editAll("2789", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300", gg.TYPE_FLOAT)
gg.getResults(10000000)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700", gg.TYPE_FLOAT)
gg.getResults(100000000)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("กดชื้อ V.6 3.5 และชิพไทมม์")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C5()
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("360", gg.TYPE_FLOAT)
gg.getResults(15)
gg.editAll("949", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(9)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("3400", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults()
 gg.alert("กดชื้อ V.8 4.0 และชิพไทมม์")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
gg.toast("สำเร็จ /!⚡️")
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C6()
gg.alert("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("415", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("1695", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("430", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("2254", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("7000", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("1000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4000", gg.TYPE_FLOAT)
gg.getResults(5)
gg.editAll("1001", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("กดชื้อ V.8 4.5 และชิพไทมม์")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C7()---999บัค
 gg.alert("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(9)
gg.editAll("999", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("620", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("2233", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("7000", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("1100", gg.TYPE_FLOAT)
gg.clearResults(200000)
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5600", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1200", gg.TYPE_FLOAT)
gg.clearResults()
 gg.alert("กดชื้อ V.10 5.0 และชิพไทมม์")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C8()
-- HPดริฟ+
gg.alert("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("321", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("1234", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("6773", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("3456", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("กดชื้อ L.4 2.0 และชิพไทมม์")
gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end


function C9()----2ระบบ
 gg.alert("⚡️ iGodmod.Hacker⚡️")
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("150", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("1038", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("220", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("1133", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("4538", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("4533", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("กดชื้อ L.4 2.0 และชิพไทมม์")
gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C10()----414Hp
 gg.alert("⚡️ iGodmod.Hacker⚡️")
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("414", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("620", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2300", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("7000", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("8000", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5600", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("7998", gg.TYPE_FLOAT)
gg.clearResults()
 gg.alert("กดชื้อ V.10 5.0 และชิพไทมม์")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C11()---X
gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("888", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(1000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("620", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("2299.999", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("7000", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("1928", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5600", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("2048", gg.TYPE_FLOAT)
gg.clearResults()

gg.setVisible(false)
gg.searchNumber("1500",gg.TYPE_FLOAT)
gg.getResults(7)
gg.editAll("5999.999",gg.TYPE_FLOAT)
gg.clearResults(7)
gg.sleep(5000)

gg.alert("กดรีเช็ต HP \nจากนั้นกดชื้อ เครื่อง V.10 5.0 ")
 gg.sleep(10)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C12()

gg.toast("⚡️ iGodmod.Hacker⚡️")
gg.sleep(10)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("500", gg.TYPE_FLOAT)
gg.getResults(9000000000)
gg.editAll("933", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("620", gg.TYPE_FLOAT)
gg.getResults(2000000000000)
gg.editAll("1033", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("7000", gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("6138", gg.TYPE_FLOAT)
gg.clearResults()
gg.sleep(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5600", gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("6133", gg.TYPE_FLOAT)
gg.clearResults()
 gg.alert("กดชื้อ V.10 5.0 ")
 gg.sleep(100)
gg.toast("iGodmod.Hacker")
gg.clearResults()
 gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end




function C13()
--------------------
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.toast("New Update!🔥")
  gg.searchNumber("280", gg.TYPE_FLOAT)
  gg.getResults(1000000000)
  gg.editAll("489.23077392578", gg.TYPE_FLOAT)
  gg.clearResults(10000000)
  gg.sleep(10)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("340", gg.TYPE_FLOAT)
  gg.getResults(200000000000000)
  gg.editAll("1,642.85754394531", gg.TYPE_FLOAT)
  gg.clearResults(200000000000000)
  gg.sleep(10)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6700", gg.TYPE_FLOAT)
  gg.getResults(2000000000000000000)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(20000000000000000000)
  gg.sleep(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("2000", gg.TYPE_FLOAT)
  gg.getResults(500000000000000)
  gg.editAll("7998", gg.TYPE_FLOAT)
  gg.clearResults(50000000000000000)
  gg.sleep(3)
  gg.searchNumber("0.1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("9.999999E-09", gg.TYPE_FLOAT)
  gg.clearResults(47)
  gg.sleep(5)
  gg.alert("1.รีเช็ตHP")
  gg.alert("2.กดชื้อ.Turbo 3")
  gg.alert("3.และ กดชื้อ Fast GearBox ก็เสร็จครับ ")
  gg.toast("iGodmod.Hacker")
   gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end

function C14()----KM99999999
gg.alert("เข้าเล่นในแมพทะเลทราย")
gg.sleep(5000)
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("FB:iGodmod\n\nTiKtoK : iGodmod\n\nYoutube :iGodmod.Hacker","HacK ON!")
  gg.searchNumber("0.00100000005", gg.TYPE_FLOAT)
  gg.getResults(8)
  gg.editAll("-9.99999968e37", gg.TYPE_FLOAT)
  gg.clearResults(8)
  gg.sleep(1000)
  gg.alert("HacK ON!!","✅")
  gg.toast("iGodmod.Hacker!")
  gg.alert("แฮก.สำเร็จ //รีสตาทร์เกมส์")
  end

function C15()
gg.alert("iGodmod.Hacker⚡️")
gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1000000000)
  gg.editAll("2355", gg.TYPE_FLOAT)
  gg.clearResults(10000000)
  gg.sleep(100)
  -----‐⭐️
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("2000", gg.TYPE_FLOAT)
  gg.getResults(1000000000000)
  gg.editAll("2355", gg.TYPE_FLOAT)
  gg.clearResults(100000000000)
  gg.sleep(100)
  ------⭐️
  
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(200000)
  gg.editAll("3000", gg.TYPE_FLOAT)
  gg.clearResults(2000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(2)
gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(5000000)
  gg.editAll("7998", gg.TYPE_FLOAT)
  gg.clearResults(500000)
  gg.sleep(100)
gg.searchNumber("0.1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("9.999999E-09", gg.TYPE_FLOAT)
gg.clearResults(47)
gg.sleep(100)
  gg.alert("1.รีเช็ตHP\n2.กดชื้อเครื่องยนต์L4 2.5 \n3.และ กดชื้อ ฟาสเกียร์บล็อค ก็เสร็จครับ")
  gg.toast("iGodmod.Hacker")
  gg.alert("⚠️ทำ สเต๊ปไม่ติด หรือ จะทำสเต๊ปอื่นๆ ให้ปิด เกมเปิดใหม่ทุกครั้ง⚠️")
end






--------------------------------------------------
function D1()--ไฟหน้าชมพุ
gg.toast("iGodmod.Hacker")
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(1000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.getResults(882681)
gg.editAll("000000", gg.TYPE_FLOAT)
gg.getResults(882681)
gg.editAll("999999",gg.TYPE_FLOAT)
gg.getResults(882681)
gg.editAll("-55;55;55",gg.TYPE_FLOAT)
gg.toast("🔐🔐🔐🔐")
gg.sleep(999)
gg.clearResults(982681)
gg.toast("สำเร็จ /")
 gg.sleep(5000)
end

function D2()--สียูนิคอน
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(5000)
gg.toast("เลื่อนหาสีอันที่ 1 แล้ว ลากปรับสีไปบนสุด")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(999999999)
gg.editAll("3;3;-3",gg.TYPE_FLOAT)
gg.toast("OK")
gg.sleep(5000)
gg.clearResults(999999999)
gg.toast("สำเร็จ / 1")
gg.sleep(500)
 
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(5000)
gg.toast("เลื่อนหาสี อันที่ 2 แล้ว ลากปรับสีไปบนสุด")
gg.sleep(8000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(999999999)
gg.editAll("44;44;44",gg.TYPE_FLOAT)
gg.toast("iGodmod")
gg.sleep(500)
gg.clearResults(999999999)
gg.toast("สำเร็จ / 2")
gg.sleep(500)
 
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(5000)
gg.toast("เลื่อนหาสี อันที่ 3 แล้ว ลากปรับสีไปบนสุด")
gg.sleep(8000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(999999999)
gg.editAll("-55;55;55",gg.TYPE_FLOAT)
gg.toast("OK")
gg.sleep(5000)
gg.clearResults(999999999)
gg.toast("สำเร็จ / 3 เรียบร้อย")
gg.sleep(500)
gg.toast("iGodmod.Hacker")
gg.sleep(2000)
end

function D3()--สีเงินโครเมี่ยม
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีล้อรถ อันที่ 2 แล้ว ลากปรับสีไปล่างสุด"  ) 
gg.sleep(5000)
gg.sleep(300)
gg.toast("Y                                           ")
gg.sleep(300)
gg.toast("Yo                                   ")
gg.sleep(300)
gg.toast("You                                ")
gg.sleep(300)
gg.toast("Yout                        ")
gg.sleep(300)
gg.toast("Youtu                           ")
gg.sleep(300)
gg.toast("Youtub                          ")
gg.sleep(300)
gg.toast("Youtube                         ")
gg.sleep(300)
gg.toast("Youtube :                         ")
gg.sleep(300)
gg.toast("Youtube  : i                     ")
gg.sleep(300)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(300)
gg.toast("Youtube  : iGod                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(300)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("4", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("สำเร็จ /")
gg.sleep(10)
end

function D4()--สีแดง
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("173;255;47;255;0;0", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("ระบบสีชุดนี้ทำยาก/ถ้าไม้ขึ้นสีทำกำหนดให้รีแอพทำใหม่ครับ ")
end

function D5()--สีขาว+น้ำเงิน
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("255,255,0", gg.TYPE_FLOAT)
  gg.clearResults(100000000000000000000)
gg.alert("ระบบสีชุดนี้ทำยาก/ถ้าไม้ขึ้นสีทำกำหนดให้รีแอพทำใหม่ครับ ")
end

function D6()--เมทัลล้อ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีล้อรถ อันที่ 2 แล้ว ลากปรับสีไปล่าสุด")
gg.sleep(500)
gg.sleep(100)
gg.toast("Y                                           ")
gg.sleep(100)
gg.toast("Yo                                   ")
gg.sleep(100)
gg.toast("You                                ")
gg.sleep(100)
gg.toast("Yout                        ")
gg.sleep(100)
gg.toast("Youtu                           ")
gg.sleep(100)
gg.toast("Youtub                          ")
gg.sleep(100)
gg.toast("Youtube                         ")
gg.sleep(100)
gg.toast("Youtube :                         ")
gg.sleep(100)
gg.toast("Youtube  : i                     ")
gg.sleep(100)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(100)
gg.toast("Youtube  : iGod                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(100)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
   gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
  gg.sleep(5000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(1000000)
  gg.editAll("-2", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("สำเร็จ /")
  gg.sleep(888)
  gg.alert("รอออขั้นตอนต่อไป....")
  
  
gg.sleep(450)


  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  
gg.alert(" เลื่อนหาสีล้อรถ อันที่ 3 แล้ว ลากปรับสีไปล่างสุด")

  gg.sleep(450)
   gg.sleep(99)
gg.toast("Y                                           ")
gg.sleep(100)
gg.toast("Yo                                   ")
gg.sleep(100)
gg.toast("You                                ")
gg.sleep(100)
gg.toast("Yout                        ")
gg.sleep(100)
gg.toast("Youtu                           ")
gg.sleep(100)
gg.toast("Youtub                          ")
gg.sleep(100)
gg.toast("Youtube                         ")
gg.sleep(100)
gg.toast("Youtube :                         ")
gg.sleep(100)
gg.toast("Youtube  : i                     ")
gg.sleep(100)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(100)
gg.toast("Youtube  : iGod                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(100)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(100)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปล่างสุด 🔴")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปบนสุด 🟢")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(1000000)
gg.editAll("-3", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("สำเร็จ /")
gg.sleep(5000)
gg.alert("iGodmod.Hacker!")
gg.sleep(100)
end

function D7()---D7
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert(" เลื่อนหาสีล้อรถ อันที่ 2 แล้ว ลากปรับสีไปล่างสุด"  ) 

  gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(5000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("-50", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("สลับรถแล้วกลับมาคันเดิม !!!เสด")
end



--------------------------------------------------
function D8()--ไฟหน้าสีขาว/เปิดไฟเรืองแสงจะเปนฟ้า
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(500)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.getResults(882681)
gg.editAll("0", gg.TYPE_FLOAT)
gg.getResults(882681)
gg.editAll("1",gg.TYPE_FLOAT)
gg.getResults(882681)
gg.toast("รอระบบกำลังทำงาน")
gg.sleep(5000)
gg.copyText("#47FF30")
gg.alert("วางโค๊ดสี /ใส่ตรงช่องตั้งค่าสี")
gg.sleep(8000)
gg.toast("iGodmod.Hacker")
gg.editAll("8.9",gg.TYPE_FLOAT)
gg.toast("สำเร็จ /!!!")
gg.sleep(1000)
gg.clearResults(982681)
gg.toast("สำเร็จ /")
 gg.sleep(99)
end


function D9()--ไฟหน้าเขียว
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.getResults(882681)
gg.editAll("0", gg.TYPE_FLOAT)
gg.getResults(882681)
gg.editAll("1",gg.TYPE_FLOAT)
gg.getResults(882681)
gg.toast("รอระบบกำลังทำงาน")
gg.sleep(300)
gg.copyText("#47FF30")
gg.alert("วางโค๊ดสี /ใส่ตรงช่องตั้งค่าสี")
gg.sleep(8000)
gg.toast("iGodmod.Hacker")
gg.editAll("10",gg.TYPE_FLOAT)
gg.toast("สำเร็จ /!!!")
gg.sleep(1000)
gg.clearResults(982681)
gg.toast("สำเร็จ /")
 gg.sleep(99)
end


function D10()-----cyberpunK
-- main code on
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(1000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.sleep(3000)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.sleep(3000)
  gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(882681)
  gg.editAll("000000", gg.TYPE_FLOAT)
  gg.getResults(882681)
  gg.editAll("999999",gg.TYPE_FLOAT)
  gg.getResults(882681)
  gg.editAll("00000001;-9999;7367888323;-136873334",gg.TYPE_FLOAT)
  gg.toast("ระบบสีทำยากมากๆๆ ทำไม่ให้ให้รีเกมก่อนทำวนๆ")
  gg.sleep(999)
  gg.clearResults(982681)
  gg.toast("สำเร็จ /")
 gg.sleep(500)
end



function D11()-----cyberpunK
gg.alert"(รอระบบทำงาน)"
gg.clearResults()
gg.clearList()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.3", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("10", gg.TYPE_FLOAT)
gg.clearResults()
gg.clearList()
gg.toast("สำเร็จ เปลื่ยนสีได้เลย!")
end

function D12()-----cyberpunK
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีเบรครถ แล้วลากปรับสีไปบนสุด"  ) 
gg.sleep(5000)
gg.sleep(300)
gg.toast("Y                                           ")
gg.sleep(300)
gg.toast("Yo                                   ")
gg.sleep(300)
gg.toast("You                                ")
gg.sleep(300)
gg.toast("Yout                        ")
gg.sleep(300)
gg.toast("Youtu                           ")
gg.sleep(300)
gg.toast("Youtub                          ")
gg.sleep(300)
gg.toast("Youtube                         ")
gg.sleep(300)
gg.toast("Youtube :                         ")
gg.sleep(300)
gg.toast("Youtube  : i                     ")
gg.sleep(300)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(300)
gg.toast("Youtube  : iGod                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(300)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hack                  ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hacker                    ")
gg.sleep(300)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.alert("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.alert("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("100;-9", gg.TYPE_FLOAT)
gg.clearResults(1000000000000)
gg.alert("สำเร็จ")
gg.sleep(10)
end
  


function D13()--------ดำเขียว
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีเบรครถ แล้วลากปรับสีไปบนสุด"  ) 
gg.sleep(5000)
gg.sleep(10)
gg.toast("Y                                           ")
gg.sleep(10)
gg.toast("Yo                                   ")
gg.sleep(10)
gg.toast("You                                ")
gg.sleep(10)
gg.toast("Yout                        ")
gg.sleep(10)
gg.toast("Youtu                           ")
gg.sleep(10)
gg.toast("Youtub                          ")
gg.sleep(10)
gg.toast("Youtube                         ")
gg.sleep(10)
gg.toast("Youtube :                         ")
gg.sleep(10)
gg.toast("Youtube  : i                     ")
gg.sleep(10)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(10)
gg.toast("Youtube  : iGod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hack                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)--ชมพุ
gg.editAll("40000;111100;-900005555", gg.TYPE_FLOAT)
gg.clearResults(1000000000000)
gg.toast("สำเร็จ")
gg.sleep(10)
end

 
  function D14()------เขียวน้ำเงิน
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีเบรครถ แล้วลากปรับสีไปบนสุด"  ) 
gg.sleep(5000)
gg.sleep(10)
gg.toast("Y                                           ")
gg.sleep(10)
gg.toast("Yo                                   ")
gg.sleep(10)
gg.toast("You                                ")
gg.sleep(10)
gg.toast("Yout                        ")
gg.sleep(10)
gg.toast("Youtu                           ")
gg.sleep(10)
gg.toast("Youtub                          ")
gg.sleep(10)
gg.toast("Youtube                         ")
gg.sleep(10)
gg.toast("Youtube :                         ")
gg.sleep(10)
gg.toast("Youtube  : i                     ")
gg.sleep(10)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(10)
gg.toast("Youtube  : iGod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hack                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("-99999;-88888;99999;-15000", gg.TYPE_FLOAT)
gg.clearResults(10000)---
gg.toast("สำเร็จ")
gg.sleep(10)
end


  function D15()------แดง
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีเบรครถ แล้วลากปรับสีไปบนสุด"  ) 
gg.sleep(5000)
gg.sleep(10)
gg.toast("Y                                           ")
gg.sleep(10)
gg.toast("Yo                                   ")
gg.sleep(10)
gg.toast("You                                ")
gg.sleep(10)
gg.toast("Yout                        ")
gg.sleep(10)
gg.toast("Youtu                           ")
gg.sleep(10)
gg.toast("Youtub                          ")
gg.sleep(10)
gg.toast("Youtube                         ")
gg.sleep(10)
gg.toast("Youtube :                         ")
gg.sleep(10)
gg.toast("Youtube  : i                     ")
gg.sleep(10)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(10)
gg.toast("Youtube  : iGod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hack                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("-40000;111100;-900005555", gg.TYPE_FLOAT)
gg.clearResults(10000)---
gg.toast("สำเร็จ")
gg.sleep(10)
end




  function D16()------ฟ้า
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.alert(" เลื่อนหาสีเบรครถ แล้วลากปรับสีไปบนสุด"  ) 
gg.sleep(5000)
gg.sleep(10)
gg.toast("Y                                           ")
gg.sleep(10)
gg.toast("Yo                                   ")
gg.sleep(10)
gg.toast("You                                ")
gg.sleep(10)
gg.toast("Yout                        ")
gg.sleep(10)
gg.toast("Youtu                           ")
gg.sleep(10)
gg.toast("Youtub                          ")
gg.sleep(10)
gg.toast("Youtube                         ")
gg.sleep(10)
gg.toast("Youtube :                         ")
gg.sleep(10)
gg.toast("Youtube  : i                     ")
gg.sleep(10)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(10)
gg.toast("Youtube  : iGod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hack                  ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                    ")
gg.sleep(10)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.toast("🟢 ลากปรับสีไปล่างสุด 🟢")
gg.sleep(5000)
gg.refineNumber("0", gg.TYPE_FLOAT)
gg.toast("🔴 ลากปรับสีไปบนสุด 🔴")
gg.sleep(5000)
gg.refineNumber("1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("11111111;7777797777;-1118888881;-99999999", gg.TYPE_FLOAT)---เหลืองแดง
gg.clearResults(10000000)--
gg.toast("สำเร็จ")
gg.sleep(10)
end
------


function E1()--ล้อแร์
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.alert"(กดเข้าไปที่ใส่ล้อ)"
gg.sleep(2000)
gg.toast("รอระบบทำงาน")
gg.sleep(500)
gg.searchNumber("190", gg.TYPE_QWORD)
gg.setVisible(false)
gg.getResults(100)
gg.editAll("15", gg.TYPE_QWORD)
gg.clearResults(5000)
gg.sleep(2000)
gg.toast("iGodmod.Hacker")
gg.sleep(300)
gg.toast("รอระบบทำงาน ⭐️")
gg.sleep(300)
gg.toast("iGodmod")
gg.sleep(300)
 gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("189", gg.TYPE_QWORD)
  gg.getResults(100)
  gg.editAll("16", gg.TYPE_QWORD)
  gg.clearResults(5000)
  gg.sleep(1000)
gg.alert"(สำเร็จใส่ล้อ รีเกมเปิดใหม่)"
end

function E2()--ล้อล้นครัชจ่า
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.alert("iGodmod.Hacker🔥")
gg.searchNumber("0.15", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("99999999", gg.TYPE_FLOAT)
gg.clearResults(1000)
gg.sleep(5000)
gg.alert("สลับรถแล้วกลับมาคันเดิม")
gg.alert("ดึงล้อรถออกให้สุดแถบเลื่อน!")
gg.alert("รอ 3วิจากนั้นกดออกเกมเข้าใหม่ เสด!")
gg.toast("iGodmod.Hacker")
end

function E3()--ล้อยัดชุ้ม
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.toast("iGodmod.Hacker🔥")
gg.alert("กดเข้าไปที่ ปรับตั้งค่าล้อ")
gg.sleep(5000)
gg.searchNumber("0.15", gg.TYPE_FLOAT)
gg.getResults(100)
gg.alert("รอระบบทำงาน")
gg.editAll("-999999999", gg.TYPE_FLOAT)
gg.clearResults(1000)
gg.sleep(4000)
gg.alert("สลับรถแล้วกลับมาคันเดิม")
gg.sleep(5000)
gg.alert("กด Save 3 ครั้ง")
gg.sleep(5000)

-----Reset-----
gg.alert("รอระบบรีเช็ต")
gg.searchNumber("-999999999", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.alert("รอระบบทำงาน")
gg.editAll("0.15", gg.TYPE_FLOAT)
gg.clearResults(1000)
gg.sleep(5000)
gg.alert("รอ 3วิจากนั้น สลับรถแล้วกลับมาคันเดิม")
gg.toast("iGodmod.Hacker")
gg.toast("😊😊😊")
end

 function E4()----ล้อเห็บหมา
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(1000)
  gg.searchNumber("-10", gg.TYPE_FLOAT)
  gg.toast("👈 ลาก INClINE ลงให้หมด👈")
  gg.sleep(5000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("👉 ลาก INClINE เพิ่มให้สุด 👉")
  gg.sleep(5000)
  gg.refineNumber("-10", gg.TYPE_FLOAT)
  gg.toast("👈 ลาก INClINE ลงให้หมด👈")
  gg.sleep(5000)
  gg.toast("รอระบบทำงาน.....")
  gg.sleep(2000)
  gg.getResults(2000)
  gg.editAll("9999999999999999999", gg.TYPE_FLOAT)
  gg.getResults(2000)
  gg.toast("iGodmod.Hacker")
  gg.sleep(999)
  gg.toast("กด SAVE 3 ครั้ง แล้วกด สลับรถแล้วกลับมาคันเดิม.....")
  gg.sleep(3000)
  gg.clearResults(2000)
  gg.toast("สำเร็จ!!!")
 gg.sleep(500)
end


function F1()--แกล้งคน🔥××รอแก้

Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x20463B0 setvalue(Tester+Lua,16,-2.74878956e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x20463B4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast('Update!!⭐️แฮกสำเร็จ / ขึ้นรถใครก็ได้')
end
--------------------
function F2()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("ขับรถคันไหนจะบัคทุกคัน")
  gg.alert("FB:iGodmod\n\nTiKtoK : iGodmod\n\nYoutube :iGodmod.Hacker","HacK ON!")
  gg.searchNumber("0.0020000000", gg.TYPE_FLOAT)
  gg.getResults(3)
  gg.editAll("999", gg.TYPE_FLOAT)
  gg.clearResults(10)
  gg.sleep(100)
  gg.alert("HacK ON!!","✅")
  gg.toast("iGodmod.Hacker!")
  end
function F3()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.alert("FB:iGodmod\n\nTiKtoK : iGodmod\n\nYoutube :iGodmod.Hacker","HacK OFF!")
gg.searchNumber("999", gg.TYPE_FLOAT)
gg.getResults(4)
gg.editAll("0.0020000000", gg.TYPE_FLOAT)
gg.clearResults(10)
gg.sleep(100)
gg.alert("HacK OFF!!","✅")
gg.toast("iGodmod.Hacker!")
end
function F4()--
gg.clearResults()
gg.clearList()
-- main code on
  gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1000", gg.TYPE_FLOAT)
gg.clearResults(500)
gg.sleep(100)
  gg.toast('แฮกระบบสำเร็จ /!')
end

function F5()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1.0", gg.TYPE_DOUBLE)
gg.getResults(1000)
gg.editAll("5", gg.TYPE_DOUBLE)
gg.clearResults(1000)
gg.sleep(100)
gg.toast("เปิดระบบวิ่งเร็วขึ้น100%")
end

function F6()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("5", gg.TYPE_DOUBLE)
gg.getResults(1000)
gg.editAll("1.0", gg.TYPE_DOUBLE)
gg.clearResults(1000)
gg.sleep(100)
gg.toast("ปิดระบบวิ่งเร็ว")
end

function F7()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("ขับรถคันไหนจะ หมุนกลางอากาศทุกคัน")
  gg.alert("FB:iGodmod\n\nTiKtoK : iGodmod\n\nYoutube :iGodmod.Hacker","HacK ON!")
  gg.searchNumber("10000000", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("-9", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.alert("HacK ON!!","✅")
  gg.toast("iGodmod.Hacker!")
  end
  
function F8()--
gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("ขับรถคันไหนจะ หมุนกลางอากาศทุกคัน")
  gg.alert("FB:iGodmod\n\nTiKtoK : iGodmod\n\nYoutube :iGodmod.Hacker","HacK ON!")
  gg.searchNumber("-9", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("10000000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.alert("HacK Off!!","✅")
  gg.toast("iGodmod.Hacker!")
  end
  
  
  function F9()--chicKed
gg.clearResults()
gg.clearList()
-- รถโครงไก่
gg.alert("กดใช้สคิป ตอนอยุ่ล๊อบบี้นะจ๊ะ!!","✅")
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("0.1", gg.TYPE_FLOAT)
  gg.getResults(99)
  gg.editAll("3.39999995e38", gg.TYPE_FLOAT)
  gg.clearResults(99)
  gg.sleep(10)
  gg.alert("iGodmod HacKed")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("3.39999995e38", gg.TYPE_FLOAT)
  gg.getResults(999)
  gg.editAll("0.1", gg.TYPE_FLOAT)
  gg.clearResults(99)
  gg.sleep(1)
  gg.toast("iGodmod.Hacker")
end
-------

  function F10()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("7855443137181910015;-504354825169525783;4126060769370573523:25", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("7855443137181910015;-504354825169525783:25", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2999674700105252864;-6268359818359143488", gg.TYPE_QWORD)
gg.alert("แฮกสำเร็จ!กดท้าแข่งได้เลย")
gg.processResume()
end



------
  
  
function G1()--F1/OLD/300HP
gg.clearResults()
gg.clearList()
-- main code on
gg.alert("ไม่สามารถทำ F1 & F2 พร้อมกันได้\nหลังทำ F1 จะทำ F2 ต้องรีแอพโคลนเท่านั้น")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("9888.88", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.sleep(100)
  --------$$$$$$$$$$---------
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("9999.99", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.sleep(100)
  
  ---------$$$$-----
    --------$$$$$$$$$$---------
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("2000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("9999999999", gg.TYPE_FLOAT)
  gg.clearResults(100000000)
  gg.sleep(10)
  
  ---------⚠️⚠️⚠️-----
  
    gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("3000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("99999999999", gg.TYPE_FLOAT)
  gg.clearResults(100000000)
  gg.sleep(10)
  ----⚠️⚠️⚠️⚠️---
    gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("0.1", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1e-38", gg.TYPE_FLOAT)
  gg.clearResults(100000000)
  gg.sleep(100)
  -------######
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(200000000000)
  gg.editAll("15000", gg.TYPE_FLOAT)
  gg.clearResults(20000000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(200000000000000)
  gg.editAll("14000", gg.TYPE_FLOAT)
  gg.clearResults(30)
 gg.alert("กดชื้อเครื่องยนต์ L4 2.5")
  gg.toast("iGodmod.Hacker")
gg.sleep(9000)
gg.alert("กดกลับ ชือชิพไทม")
gg.sleep(8000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("รอระบบทำงาน")
  gg.setVisible(false)
  gg.sleep(800)
 gg.searchNumber("19",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("341",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert(" สลับรถสำเร็จ /!!!")
gg.sleep(5000)
gg.alert("กดเข้าไปที่ปรับแต่งเครื่องยนต์รถ")
gg.sleep(5000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("กดชื้อL4 2.5")
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดชื้อชิพไทมม")
  gg.sleep(5000)
 gg.searchNumber("341",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("19",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert("สำเร็จ /กดกลับไปรถ EK แล้วเลื่อนรถหา F1 💚💚!!!")
gg.sleep(2000)  
end

function G2()--F1/New/696HP
-- main code on
gg.alert("ไม่สามารถทำF1 & F2 พร้อมกันได้\nหลังทำF1 จะทำ F2 ต้องรีแอพโคลนเท่านั้น")
 gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(200000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(10000000000000)
  gg.editAll("696", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(20000000000)
  gg.editAll("15000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(2000000000000)
  gg.editAll("12000", gg.TYPE_FLOAT)
  gg.clearResults(300)
 gg.alert("กดชื้อเครื่องยนต์ L4 2.5")
  gg.toast("iGodmod.Hacker")
gg.sleep(5000)
gg.alert("กดกลับ รอสลับระบบรถ")
gg.sleep(5000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.toast("รอระบบทำงาน")
  gg.setVisible(false)
  gg.sleep(100)
 gg.searchNumber("19",gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("357",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert(" สลับรถสำเร็จ /!!!")
gg.sleep(5000)
gg.alert("กดเข้าไปที่ปรับแต่งเครื่องยนต์รถ")
gg.sleep(5000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.toast("รอระบบทำงาน")
  gg.setVisible(false)
  gg.sleep(100)
 gg.searchNumber("357",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("19",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert("สำเร็จ /กดกลับไปรถ EK แล้วเลื่อนรถหา F2⭐️!!!")
gg.sleep(2000)  
end
-------
function G3()--F1/New/696HP
-- main code on
gg.alert("ไม่สามารถทำF1 & F2 พร้อมกันได้\nหลังทำF1 จะทำ F2 ต้องรีแอพโคลนเท่านั้น")
 gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("iGodmod.Hacker🔥")
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(200000000)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(10000000000000)
  gg.editAll("888", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(20000000000)
  gg.editAll("15000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.sleep(100)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(2000000000000)
  gg.editAll("12000", gg.TYPE_FLOAT)
  gg.clearResults(300)
 gg.alert("กดชื้อเครื่องยนต์ L4 2.5")
  gg.toast("iGodmod.Hacker")
gg.sleep(5000)
gg.alert("กดกลับ รอสลับระบบรถ")
gg.sleep(5000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.toast("รอระบบทำงาน")
  gg.setVisible(false)
  gg.sleep(100)
 gg.searchNumber("19",gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("357",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert(" สลับรถสำเร็จ /!!!")
gg.sleep(5000)
gg.alert("กดเข้าไปที่ปรับแต่งเครื่องยนต์รถ")
gg.sleep(5000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.toast("รอระบบทำงาน")
  gg.setVisible(false)
  gg.sleep(100)
 gg.searchNumber("357",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("19",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(100)
 gg.alert("สำเร็จ /กดกลับไปรถ EK แล้วเลื่อนรถหา F2⭐️!!!")
gg.sleep(2000)  
end



-------
function i1()--ปลดล้อเติม
gg.alert("รอระบบทำงาน")
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x1FE95CC setvalue(Tester+Lua,16,-2.74878956e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x1FE95D0 setvalue(Tester+Lua,16,-6.13017998e13)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x1FE9508 setvalue(Tester+Lua,16,-2.74878956e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x1FE950C setvalue(Tester+Lua,16,-6.13017998e13)
 gg.toast("ปลดล็อคเรียบร้อย /กดชื้อล้อเติมให้ครบทุกล้อ")
 gg.sleep(1000)
 gg.toast("iGodmod.Hacker")
 gg.sleep(1000)
end


function i2()--ปลดล็อครถเติม

gg.setVisible(false)
gg.alert("1.เปิดร้านชื้อรถ แล้วเลื่อนไปที่รถ EK \nจากนั้นกดแอพ GG 1 ครั้งครับ")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x27092F0 setvalue(Tester+Lua,16,-2.74887344e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x27092F4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("สำเร็จ")
gg.alert("เข้าร้านขายรถ แล้วเลื่อนหารถเติม")
end

function i3()--\n🔥ปลดล็อดหวอเทีย
gg.toast("iGodmod.Hacker")
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x208CEB0 setvalue(Tester+Lua,16,-2.74878956e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x208CEB4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("สำเร็จ/สลับรถ")
end







-------------------------------------------
function J1()----ถอดกันชนรีโว่
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("340",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
---------------------------------------------------🔥🔥🔥🔥-------------------------


-------------------------------------------
function J2()----ถอดกันชนEK
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("19",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
---------------------------------------------------🔥🔥🔥🔥-------------------------


-------------------------------------------
function J3()----ถอดกันชนFK
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("327",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
---------------------------------------------------🔥🔥🔥🔥-------------------------


function J4()----ถอดกันชนR32
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("342",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
----------------------------------------R32-----------🔥🔥🔥🔥-------------------------


function J5()----ถอดกันชนR32
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("17",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
----------------------------------------R34----------🔥🔥🔥🔥------------------------


function J6()----ถอดกันชนR35
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("20",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
----------------------------------------R35----------🔥🔥🔥🔥------------------------



function J7()----ถอดกันชนAE86
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("320",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
----------------------------------------AE86-J7------🔥🔥🔥🔥------------------------



function J8()----ถอดกันชนs14
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("375",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
----------------------------------------s14-J8---------🔥🔥🔥🔥------------------------



function J9()----ถอดกันชนs2000
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("305",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
--------------------------------s2000--------J9----------🔥🔥🔥🔥------------------------


function J10()----ถอดกันชนFD
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
  gg.alert("iGodmod.Hacker /CPM ")
  gg.setVisible(false)
  gg.sleep(5000)
 gg.searchNumber("73",gg.TYPE_DWORD)
gg.getResults(1000)
gg.editAll("311",gg.TYPE_DWORD)
gg.clearResults(1000)
gg.sleep(500)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("กดเข้าไปที่ใสอะไหล่แต่งรถ")
  gg.sleep(5000)
  
  gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")
  
  
  
  gg.alert("เลือกบันไดข้างชิ้นที่ 2✅️")
  gg.sleep(5000)
gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")


  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 3✅️")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")



  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("เลือกบันไดข้างชิ้นที่ 4✅️")
  gg.sleep(5000)

gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(200000000000000)
  gg.sleep(5000)
  gg.alert(" 🏆กดเลือกฝากระโปรงหน้า🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อฝากระโปรงหน้า")
  gg.sleep(5000)
  
  
  
  
  gg.alert(" 🏆กดเลือกกันชนหลัง🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อกันชนหลัง")
  gg.sleep(5000)
  
  gg.alert(" 🏆กดเลือกกันชนข้าง ใหม🏆 ")
  gg.sleep(5000)


gg.sleep(50)
gg.toast("Y                                           ")
gg.sleep(50)
gg.toast("Yo                                   ")
gg.sleep(50)
gg.toast("You                                ")
gg.sleep(50)
gg.toast("Yout                        ")
gg.sleep(50)
gg.toast("Youtu                           ")
gg.sleep(50)
gg.toast("Youtub                          ")
gg.sleep(50)
gg.toast("Youtube                         ")
gg.sleep(50)
gg.toast("Youtube :                         ")
gg.sleep(50)
gg.toast("Youtube  : i                     ")
gg.sleep(50)
gg.toast("Youtube  : iG                      ")
gg.toast("Youtube  : iGo                   ")
gg.sleep(50)
gg.toast("Youtube  : iGod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodm                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmo               ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.                   ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.H                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Ha                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hac                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacK                  ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.HacKe                    ")
gg.sleep(50)
gg.toast("Youtube  : iGodmod.Hacker                   ")
print("Youtube :  iGodmod.Hacker")

  gg.editAll("-15", gg.TYPE_DWORD)
  gg.alert("กดชื้อบันไดข้าง")
  gg.sleep(5000)
  gg.clearResults(100000000000)
  gg.alert("กดออกรีเกม แล้วกดไปที้รถคันที่ถอดกันชน")
  gg.toast("สำเร็จ / 🎊📣")
end
--------------------------------FD--------J10----------🔥🔥🔥🔥------------------------


function K1()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("359", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  gg.sleep(3000)
  gg.alert("สำเร็จ /")
end

function K2()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("325", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  gg.sleep(100)
  gg.toast("สำเร็จ /")
end

function K3()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("305", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K4()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("288", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K5()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("342", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K6()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("295", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K7()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("312", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K8()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("280", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K9()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("339", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K10()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("260", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
 gg.toast("สำเร็จ /")
end

function K11()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("324", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K12()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("276", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K13()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("310", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ️")
end

function K14()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("322", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K15()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("321", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K16()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("293", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K17()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("356", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K18()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("341", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K19()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("357", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K20()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("392", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K21()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("354", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K22()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("358", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K23()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("376", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K24()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("386", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K25()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("387", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K26()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("393", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end
function K27()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("401", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K28()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("402", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K29()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("403", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K30()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("404", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K31()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("405", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  gg.sleep(1234)
  gg.toast("สำเร็จ /")
end

function K32()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("408", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K33()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("409", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K34()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("512", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K35()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("513", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end

function K36()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("73", gg.TYPE_DWORD)
  gg.getResults(212)
  gg.editAll("514", gg.TYPE_DWORD)
  gg.clearResults(212)
  gg.alert("เลื่อนไปที่รถชูป้า! แล้วกดชื้อ")
  
  gg.sleep(3000)
  gg.toast("สำเร็จ /")
end



---------end----
function EXIT()
gg.toast("iGodmod.Hacker")
print("👑 iGodmod.Hacker 👑")
os.exit()
main()
end

while true do
 if gg.isVisible(true) then
 CPM = 1
 gg.setVisible(false)
 end
 
 if CPM == 1 then
 main()
 end
end

--------------------------------------------------------------------------------------------------------

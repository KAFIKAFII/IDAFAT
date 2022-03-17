local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Aek(msg.chat_id_,msg.id_, 1, "♕︙تم تفعيل جلب نسخة الكروبات التلقائيه\n♕︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAek:del(AEK.."Aek:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Aek(msg.chat_id_,msg.id_, 1, "♕︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAek:set(AEK.."Aek:Lock:AutoFile",true) 
end 
end

if (text and not DevAek:get(AEK.."Aek:Lock:AutoFile")) then
Time = DevAek:get(AEK.."Aek:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAek:smembers(AEK..'Aek:Groups') 
local BotName = (DevAek:get(AEK.."Aek:NameBot") or 'لايون')
local GetJson = '{"BotId": '..AEK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAek:get(AEK.."Aek:Groups:Links"..v)
Welcomes = DevAek:get(AEK..'Aek:Groups:Welcomes'..v) or ''
AekConstructors = DevAek:smembers(AEK..'Aek:AekConstructor:'..v)
BasicConstructors = DevAek:smembers(AEK..'Aek:BasicConstructor:'..v)
Constructors = DevAek:smembers(AEK..'Aek:Constructor:'..v)
Managers = DevAek:smembers(AEK..'Aek:Managers:'..v)
Admis = DevAek:smembers(AEK..'Aek:Admins:'..v)
Vips = DevAek:smembers(AEK..'Aek:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AekConstructors ~= 0 then
GetJson = GetJson..'"AekConstructors":['
for k,v in pairs(AekConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..AEK..'.json', "w")
File:write(GetJson)
File:close()
local Aekan = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Aekan .. '" -F "chat_id='..DevId..'" -F "document=@'..AEK..'.json' .. '" -F "caption=♕︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..AEK..'.json')
DevAek:set(AEK.."Aek:AutoFile:Time",os.date("%x"))
end
else 
DevAek:set(AEK.."Aek:AutoFile:Time",os.date("%x"))
end
end

end
return {
AEK = AutoFile
}
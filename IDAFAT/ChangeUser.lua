local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local aeek = DevAek:get("DevAekTEAM:User"..result.id_)
if not result.username_ then 
if aeek then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..aeek.."", 1, 'html')
DevAek:del("DevAekTEAM:User"..result.id_) 
end
end
if result.username_ then 
if aeek and aeek ~= result.username_ then 
local abs_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لا ينخمط، 😹♥️",
}
aeeks = math.random(#abs_text)
Dev_Aek(msg.chat_id_, msg.id_, 1, abs_text[aeeks], 1, 'html')
end  
DevAek:set("DevAekTEAM:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
AEK = ChangeUser
}
local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local aeek = DevAek:get("DevAekTEAM:Photo"..result.id_)
if not result.profile_photo_ then 
if aeek then 
Dev_Aek(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevAek:del("DevAekTEAM:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if aeek and aeek ~= result.profile_photo_.big_.persistent_id_ then 
local aeek_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
aeek3 = math.random(#aeek_text)
Dev_Aek(msg.chat_id_, msg.id_, 1, aeek_text[aeek3], 1, 'html')
end  
DevAek:set("DevAekTEAM:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
AEK = ChangePhoto
}
local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local aeek = DevAek:get("DevAekTEAM:Name"..result.id_)
if not result.first_name_ then 
if aeek then 
DevAek:del("DevAekTEAM:Name"..result.id_) 
end
end
if result.first_name_ then 
if aeek and aeek ~= result.first_name_ then 
local aek_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
aekan = math.random(#aek_text)
Dev_aek(msg.chat_id_, msg.id_, 1, aek_text[aekan], 1, 'html')
end  
DevAek:set("DevAekTEAM:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
AEK = ChangeName
}
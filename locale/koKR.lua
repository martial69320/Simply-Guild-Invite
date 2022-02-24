local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("koKR") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "koKR"

L["NOT_IN_REALM"] = "는 연결된 왕국에서 온 것이 아닙니다!"
L["IS_IN_GUILD"] = "는 이미 길드에 있습니다!"
L["IS_IN_OTHER_GUILD"] = "는 이미 길드에 있습니다!"
L["BUTTON_TEXT"] = "길드에 초대"

	ns.L = L
end
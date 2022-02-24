local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("ruRU") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "ruRU"

L["NOT_IN_REALM"] = "не из связанного королевства!"
L["IS_IN_GUILD"] = "уже в вашей гильдии!"
L["IS_IN_OTHER_GUILD"] = "уже в гильдии!"
L["BUTTON_TEXT"] = "Пригласить в гильдию"

	ns.L = L
end
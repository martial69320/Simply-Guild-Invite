local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("deDE") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "deDE"

L["NOT_IN_REALM"] = "stammt nicht aus einem verbundenen Königreich!"
L["IS_IN_GUILD"] = "ist bereits in deiner Gilde!"
L["IS_IN_OTHER_GUILD"] = "ist bereits in einer Gilde!"
L["BUTTON_TEXT"] = "In die Gilde einladen"

	ns.L = L
end

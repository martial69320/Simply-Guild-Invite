local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("itIT") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "itIT"

L["NOT_IN_REALM"] = "non proviene da un regno collegato!"
L["IS_IN_GUILD"] = "è già nella tua gilda!"
L["IS_IN_OTHER_GUILD"] = "è già in una gilda!"
L["BUTTON_TEXT"] = "Invita alla gilda"

	ns.L = L
end
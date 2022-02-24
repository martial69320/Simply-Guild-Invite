local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("frFR") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "frFR"

L["NOT_IN_REALM"] = "n'est pas d'un royaume lié!"
L["IS_IN_GUILD"] = "est déjà dans votre guilde!"
L["IS_IN_OTHER_GUILD"] = "est déjà dans une guilde!"
L["BUTTON_TEXT"] = "Inviter en guilde"

	ns.L = L
end

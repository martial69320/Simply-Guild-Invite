local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("esES") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "esES"

L["NOT_IN_REALM"] = "no es de un reino vinculado!"
L["IS_IN_GUILD"] = "ya está en tu gremio!"
L["IS_IN_OTHER_GUILD"] = "ya está en un gremio!"
L["BUTTON_TEXT"] = "Invitar al gremio"

	ns.L = L
end
local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("ptBR") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "ptBR"

L["NOT_IN_REALM"] = "não é de um reino ligado!"
L["IS_IN_GUILD"] = "já está na sua guilda!"
L["IS_IN_OTHER_GUILD"] = "já está em uma guilda!"
L["BUTTON_TEXT"] = "Convidar para a guilda"

	ns.L = L
end
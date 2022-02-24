local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("zhCN") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "zhCN"

L["NOT_IN_REALM"] = "不是来自一个有联系的王国！"
L["IS_IN_GUILD"] = "已经在你的公会里了！"
L["IS_IN_OTHER_GUILD"] = "已经加入公会了！"
L["BUTTON_TEXT"] = "邀请加入公会"

	ns.L = L
end
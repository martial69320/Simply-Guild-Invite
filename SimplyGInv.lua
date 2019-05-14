

local SimplyGInv = CreateFrame("Frame","SimplyGInvFrame")
SimplyGInv:SetScript("OnEvent", function() hooksecurefunc("UnitPopup_OnClick", SimplyGuildInvite) end)
SimplyGInv:RegisterEvent("PLAYER_LOGIN")

--old:  local PopupUnits = {"PARTY", "PLAYER", "RAID_PLAYER", "RAID", "FRIEND", "TEAM", "CHAT_ROSTER", "TARGET", "FOCUS", }
--Test: local PopupUnits = {"SELF", }
local PopupUnits = {}
-- now all with "WHISPER" 

UnitPopupButtons["GUILDINVITE"] = { text = "Simply Guild Invite", }

table.insert( UnitPopupMenus["SELF"] ,1 , "GUILDINVITE" )

--for i=1, #PopupUnits do
--  table.insert( UnitPopupMenus[PopupUnits[i]] ,1 , "GUILDINVITE" )
--end

for i,UPMenus in pairs(UnitPopupMenus) do
  for j=1, #UPMenus do
    if UPMenus[j] == "WHISPER" then
--      print ("-- i,j: "..i.." "..j)
      PopupUnits[#PopupUnits + 1] = i
      pos = j + 0
      table.insert( UnitPopupMenus[i] ,pos , "GUILDINVITE" )
      break
    end
  end
end

--      print ("-- i,j: "..i.." "..j)   -- Output 8.0.1 (27144) x64  BfA Pre-Patch 
-- i,j: PARTY 10
-- i,j: PLAYER 11
-- i,j: COMMUNITIES_GUILD_MEMBER 8
-- i,j: CHAT_ROSTER 7
-- i,j: RAID_PLAYER 11
-- i,j: GUILD 7
-- i,j: FRIEND 8
-- i,j: COMMUNITIES_WOW_MEMBER 10
-- i,j: BN_FRIEND 9

-- print ("SimplyGInv:PopupUnits:");
-- print (PopupUnits);




function SimplyGuildInvite (self)
 local button = self.value;
 if ( button == "GUILDINVITE" ) then
  local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
  local unit = dropdownFrame.unit;
  local name = dropdownFrame.name;
  local server = dropdownFrame.server;
  local fullname = name;
 -- local clubInfo = dropdownFrame.clubInfo;
 -- local clubMemberInfo = dropdownFrame.clubMemberInfo;

  if ( server and ((not unit and GetNormalizedRealmName() ~= server) or (unit and UnitRealmRelationship(unit) ~= LE_REALM_RELATION_SAME)) ) then
   fullname = name.."-"..server;
  end

  print("Simply /ginvite",fullname);
--  GuildInvite(unit);
  GuildInvite(fullname);
 end

-- PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON);
end



-- Tests:

--  /run print(#UnitPopupMenus);
--  /run print(UnitPopupMenus["SELF"]);
--  /run local a=0;for i in pairs(UnitPopupMenus) do a = a + 1; end;print("counter: ",a);
--  /run local a,b=0,'';for i,men in pairs(UnitPopupMenus) do a=a+1;b=b..'|'..i;end;print('counter: ',a,'  indices: ',b);




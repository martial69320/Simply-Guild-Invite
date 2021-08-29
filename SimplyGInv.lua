

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
  --  print ("-- i,j: "..i.." "..j)   -- Output 8.0.1 (27144) x64  BfA Pre-Patch 
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
    local status = true
    if ( button == "GUILDINVITE" ) then
      if (FriendsFrame:IsShown(1)) then
        
        local acc = C_BattleNet.GetFriendAccountInfo(BNGetSelectedFriend())
		local game = acc.gameAccountInfo
        -- print(characterName)
		selfFaction = UnitFactionGroup("player")
		name = game.characterName
		server = game.realmName
		targetFaction = game.factionName
		fullname = name.."-"..server;
			if(selfFaction == targetFaction)
			then
				if ( server and ((not unit and GetNormalizedRealmName() ~= server) or (unit and UnitRealmRelationship(unit) ~= LE_REALM_RELATION_SAME) or (unit and UnitRealmRelationship(unit) ~= LE_REALM_RELATION_VIRTUAL)) ) then
				fullname = name.."-"..server;
				SendSystemMessage(fullname.."is in unlinked realm");
				else
				
					if (UnitIsInMyGuild(fullname) == true) 
					then
						SendSystemMessage(name.." is in your guild");
						PlaySound(810, Master, forceNoDuplicate);

					elseif (unit and GetGuildInfo(unit) ~= nil) --< C'est cette fonction IsInGuild()
					then
						SendSystemMessage(name.."is in another guild");
						PlaySound(810, Master, forceNoDuplicate);

					else
					-- local clubInfo = dropdownFrame.clubInfo;
					-- local clubMemberInfo = dropdownFrame.clubMemberInfo;
					-- print("Simply /ginvite",fullname);

					--  GuildInvite(unit);
					PlaySound(810, Master, forceNoDuplicate);
					GuildInvite(fullname);
				  end
					
				end

			--print("Close your friend frame");
			else
			
				SendSystemMessage(name.." is in "..targetFaction.." on "..server);
				PlaySound(810, Master, forceNoDuplicate);
				
				
		  end
	  
	  else

      local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
      local unit = dropdownFrame.unit;

      local name = dropdownFrame.name;
      local guild = GetGuildInfo(name);
      local server = dropdownFrame.server;
      local fullname = name;
      -- https://wow.gamepedia.com/API_UnitRealmRelationship
      
      -- local realmRelation = UnitRealmRelationship(fullname) -------<

      --  GetUnitName("unit", showServerName) 
      -- UnitRealmRelationship("target")
      -- https://wowwiki.fandom.com/wiki/World_of_Warcraft_API
      if ( server and ((not unit and GetNormalizedRealmName() ~= server) or (unit and UnitRealmRelationship(unit) ~= LE_REALM_RELATION_SAME) or (unit and UnitRealmRelationship(unit) ~= LE_REALM_RELATION_VIRTUAL)) ) then
				fullname = name.."-"..server;
				SendSystemMessage(fullname.."is in unlinked realm");
				else
					if (UnitIsInMyGuild(fullname) == true) 
					then
						SendSystemMessage(name.." is in your guild");
						PlaySound(810, Master, forceNoDuplicate);

					elseif (unit and GetGuildInfo(unit) ~= nil) --< C'est cette fonction IsInGuild()
					then
						SendSystemMessage(name.."is in another guild");
						PlaySound(810, Master, forceNoDuplicate);

					else
					-- local clubInfo = dropdownFrame.clubInfo;
					-- local clubMemberInfo = dropdownFrame.clubMemberInfo;
					-- print("Simply /ginvite",fullname);

					--  GuildInvite(unit);
					PlaySound(810, Master, forceNoDuplicate);
					GuildInvite(fullname);
				  end
					
				end
        end
		
		end

      end

      return status


    






    -- Tests:

    --  /run print(#UnitPopupMenus);
    --  /run print(UnitPopupMenus["SELF"]);
    --  /run local a=0;for i in pairs(UnitPopupMenus) do a = a + 1; end;print("counter: ",a);
    --  /run local a,b=0,'';for i,men in pairs(UnitPopupMenus) do a=a+1;b=b..'|'..i;end;print('counter: ',a,'  indices: ',b);




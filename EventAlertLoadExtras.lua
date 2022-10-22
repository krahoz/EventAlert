function EventAlert_LoadExtras()
	Alt_Alerts_Frame:SetWidth(325);
	Alt_Alerts_Frame:SetHeight(675);

--[[
From the original addon author:
I have no idea why this code doesn't work here.
It's annoying and I'll fix it eventually, but I need to actually PLAY the game for now and stop messing with this.  ha!

   for i,v in pairs(EA_AltItems[EA_playerClass]) do

      local name, rank = GetSpellInfo(i);
      local link = GetSpellLink(name, "");
         
      local _, _, spellString = string.find(link, "^|c%x+|Hspell:(.+)|h%[.*%]")
            
      if (EA_PreLoadAlts[name] == nil) then 
         EA_PreLoadAlts[name] = spellString;
      elseif (EA_PreLoadAlts[name] < spellString) then
         EA_PreLoadAlts[name] = spellString;
      elseif (EA_PreLoadAlts[name] >= spellString) then
         -- Do Nothing
      end

   end
 ]]--  
end
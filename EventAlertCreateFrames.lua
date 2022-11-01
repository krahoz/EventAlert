function EventAlert_CreateFrames()
	
-- Create anchor frames used for mod customization.
		
		local anchorFrameName = "EA_Anchor_Frame";
		
		if (EA_Config.AllowESC == true) then
			tinsert(UISpecialFrames,anchorFrameName);
		end
		local eaaf = CreateFrame("FRAME", anchorFrameName, UIParent);

		eaaf:SetFrameStrata("DIALOG");
		eaaf:ClearAllPoints();
		eaaf:SetPoint(EA_Position.Anchor, UIParent, EA_Position.xLoc, EA_Position.yLoc);

		eaaf.spellName = eaaf:CreateFontString(anchorFrameName.."_Name","OVERLAY");
		eaaf.spellName:SetFontObject(ChatFontNormal);
		eaaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaaf.spellTimer = eaaf:CreateFontString(anchorFrameName.."_Timer","OVERLAY");
		eaaf.spellTimer:SetFontObject(ChatFontNormal);
		eaaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaaf.spellCounter = eaaf:CreateFontString(anchorFrameName.."_Counter","OVERLAY");
		eaaf.spellCounter:SetFontObject(ChatFontNormal);
		eaaf.spellCounter:SetPoint("RIGHT", 20, 0);

		eaaf:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

		eaaf:SetMovable(true)
		eaaf:EnableMouse(true)
		eaaf:SetScript("OnMouseDown",function()
			if (EA_Config.LockFrame == true) then
				DEFAULT_CHAT_FRAME:AddMessage("EventAlert: You must unlock the alert frame in order to move it or reset it's position.")
			else
				eaaf:StartMoving();
			end
		end)
		eaaf:SetScript("OnMouseUp",function()
			eaaf:StopMovingOrSizing();

			local EA_point, _, EA_relativePoint, EA_xOfs, EA_yOfs = EA_Anchor_Frame:GetPoint();

			EA_Position.Anchor = EA_point;
			EA_Position.relativePoint = EA_relativePoint;
			EA_Position.xLoc = EA_xOfs;
			EA_Position.yLoc = EA_yOfs;
		end)

		local eaaf2 = CreateFrame("FRAME", anchorFrameName.."2", UIParent);
		eaaf2:SetFrameStrata("DIALOG");
		eaaf2:ClearAllPoints();
		eaaf2:SetPoint("CENTER", EA_Anchor_Frame, 100+EA_Position.xOffset, 0+EA_Position.yOffset);
		eaaf2:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

		eaaf2.spellName = eaaf2:CreateFontString(anchorFrameName.."2_Name","OVERLAY");
		eaaf2.spellName:SetFontObject(ChatFontNormal);
		eaaf2.spellName:SetPoint("BOTTOM", 0, -15);

		eaaf2.spellTimer = eaaf2:CreateFontString(anchorFrameName.."2_Timer","OVERLAY");
		eaaf2.spellTimer:SetFontObject(ChatFontNormal);
		eaaf2.spellTimer:SetPoint("TOP", 0, 20);
		
		eaaf2.spellCounter = eaaf2:CreateFontString(anchorFrameName.."2_Counter","OVERLAY");
		eaaf2.spellCounter:SetFontObject(ChatFontNormal);
		eaaf2.spellCounter:SetPoint("RIGHT", 20, 0);

		local eaaf3 = CreateFrame("FRAME", anchorFrameName.."3", UIParent);
		eaaf3:SetFrameStrata("DIALOG");
		eaaf3:ClearAllPoints();
		eaaf3:SetPoint("CENTER", EA_Anchor_Frame2, 100+EA_Position.xOffset, 0+EA_Position.yOffset);
		eaaf3:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

		eaaf3.spellName = eaaf3:CreateFontString(anchorFrameName.."3_Name","OVERLAY");
		eaaf3.spellName:SetFontObject(ChatFontNormal);
		eaaf3.spellName:SetPoint("BOTTOM", 0, -15);

		eaaf3.spellTimer = eaaf3:CreateFontString(anchorFrameName.."3_Timer","OVERLAY");
		eaaf3.spellTimer:SetFontObject(ChatFontNormal);
		eaaf3.spellTimer:SetPoint("TOP", 0, 20);
		
		eaaf3.spellCounter = eaaf3:CreateFontString(anchorFrameName.."3_Counter","OVERLAY");
		eaaf3.spellCounter:SetFontObject(ChatFontNormal);
		eaaf3.spellCounter:SetPoint("RIGHT", 20, 0);

-- Create primary alert frames

	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
        -- eaf:SetScript("OnUpdate", EventAlert_OnUpdate);
    end


-- Create alternate alert frames

	for index,value in pairs(EA_AltItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
        -- eaf:SetScript("OnUpdate", EventAlert_OnUpdate);
    end


-- Create other alert frames. (Mostly trinket procs)

	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
        -- eaf:SetScript("OnUpdate", EventAlert_OnUpdate);
    end


-- Create Class Alert menu buttons, etc

	local buttonPositionY = -50;

	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

    	local EA_name, EA_rank = GetSpellInfo(index);

        --[[
        	Blizzard isn't consistent with the names and ranks of the procs in relation to the names/ranks of the talents.
	        So, we have to add the code below to make the options menu understandable for certain items.
            And because of localization, I have to go back and re-call the original talent ID.
            Which is, honestly, damned annoying.  But... oh well!  QQ, right?
        --]]

        if (EA_name == "Death Trance!") then
	        local EA_name2 = GetSpellInfo(49018);
    	    EA_name = EA_name2;
        end
        if (EA_name == "Fireball!") then
	        local EA_name2 = GetSpellInfo(44549);
    	    EA_name = EA_name2;
        end
        if (index == 12536) then
	        local EA_name3 = GetSpellInfo(11213);
    	    EA_name = EA_name3;
        end
        if (index == 16870) then
			local EA_name4 = GetSpellInfo(16864);
	        EA_name = EA_name4;
        end
        if (index == 48517) then
        	local EA_name5 = GetSpellInfo(5176);
	        EA_rank = EA_name5;
        end
        if (index == 48518) then
	        local EA_name6 = GetSpellInfo(2912);
    	    EA_rank = EA_name6;
        end
        if (index == 34754) then
	        local EA_name7 = GetSpellInfo(34753);
    	    EA_name = EA_name7;
        end
        if (index == 14743 or index == 27828) then
			local EA_name8 = GetSpellInfo(14531);
    	    EA_name = EA_name8;
        end
        if (index == 33151) then EA_rank = "" end;
        if (index == 16246) then
			local EA_name9 = GetSpellInfo(16164);
	        EA_name = EA_name9;
        end
        if (index == 17941) then
	        local EA_name10 = GetSpellInfo(18094);
    	    EA_name = EA_name10;
        end
        if (index == 46916) then
	        local EA_name11 = GetSpellInfo(46913);
    	    EA_name = EA_name11;
        end


        local ClassEventCheckButton = CreateFrame("CheckButton", index, Class_Events_Frame, "OptionsCheckButtonTemplate");
		ClassEventCheckButton:SetPoint("TOPLEFT",20,buttonPositionY);

        if (EA_rank == "") then
            getglobal(ClassEventCheckButton:GetName().."Text"):SetText(EA_name.."   ["..index.."]");
        else
            getglobal(ClassEventCheckButton:GetName().."Text"):SetText(EA_name.." ("..EA_rank..")   ["..index.."]");
        end

        ClassEventCheckButton:SetChecked(EA_Items[index]);
        ClassEventCheckButton:SetChecked(EA_Items[index]);

		local function ClassEventButtonGetChecked()
        	if (ClassEventCheckButton:GetChecked()) then
           		EA_Items[index] = true
			else
		   		EA_Items[index] = false
			end
        end
        ClassEventCheckButton:RegisterForClicks("AnyUp");
		ClassEventCheckButton:SetScript("OnClick", ClassEventButtonGetChecked)

        buttonPositionY = buttonPositionY - 25;
	end


	-- Alternate Alerts
	local buttonPositionY = -50;
	for index,value in pairs(EA_AltItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

    	local EA_name, EA_rank = GetSpellInfo(index);


        local AltAlertCheckButton = CreateFrame("CheckButton", index, Alt_Alerts_Frame, "OptionsCheckButtonTemplate");
		AltAlertCheckButton:SetPoint("TOPLEFT",20,buttonPositionY);

        if (EA_rank == "") then
            getglobal(AltAlertCheckButton:GetName().."Text"):SetText(EA_name.."   ["..index.."]");
        else
            getglobal(AltAlertCheckButton:GetName().."Text"):SetText(EA_name.." ("..EA_rank..")   ["..index.."]");
        end

        AltAlertCheckButton:SetChecked(EA_AltItems[index]);
        AltAlertCheckButton:SetChecked(EA_AltItems[index]);

		local function AltAlertButtonGetChecked()
        	if (AltAlertCheckButton:GetChecked()) then
           		EA_AltItems[index] = true
			else
		   		EA_AltItems[index] = false
			end
        end
        AltAlertCheckButton:RegisterForClicks("AnyUp");
		AltAlertCheckButton:SetScript("OnClick", AltAlertButtonGetChecked)

        buttonPositionY = buttonPositionY - 25;
	end
	
	return eeaf
end



function EventAlert_CreateCustomFrames()
-- Create custom alert frames

	for index,value in pairs(EA_CustomItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
        -- eaf:SetScript("OnUpdate", EventAlert_OnUpdate);
    end
end

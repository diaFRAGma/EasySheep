SLASH_EASYSHEEP1, SLASH_EASYSHEEP2 = "/es", "/easysheep"

SlashCmdList["EASYSHEEP"] = function(msg, editBox)
	if msg == "" then
		if EasySheepTarget == nil then
			DEFAULT_CHAT_FRAME:AddMessage("Aktuelles Ziel = stern")
		else
			local myTarget = "stern"
			if EasySheepTarget == 1 then myTarget = "stern" end
			if EasySheepTarget == 2 then myTarget = "kreis" end
			if EasySheepTarget == 3 then myTarget = "diamant" end
			if EasySheepTarget == 4 then myTarget = "dreieck" end
			if EasySheepTarget == 5 then myTarget = "mond" end
			if EasySheepTarget == 6 then myTarget = "viereck" end
			if EasySheepTarget == 7 then myTarget = "kreuz" end
			if EasySheepTarget == 8 then myTarget = "kopf" end
			DEFAULT_CHAT_FRAME:AddMessage("Aktuelles Ziel = "..myTarget)
		end
		DEFAULT_CHAT_FRAME:AddMessage("/es stern, /es kreis, /es diamant, /es dreieck, /es mond, /es viereck, /es kreuz, /es kopf")
	else
		if msg == "stern" then EasySheepTarget = 1 end
		if msg == "kreis" then EasySheepTarget = 2 end
		if msg == "diamant" then EasySheepTarget = 3 end
		if msg == "dreieck" then EasySheepTarget = 4 end
		if msg == "mond" then EasySheepTarget = 5 end
		if msg == "viereck" then EasySheepTarget = 6 end
		if msg == "kreuz" then EasySheepTarget = 7 end
		if msg == "kopf" then EasySheepTarget = 8 end
		if msg ~= "stern" and msg ~= "kreis" and msg ~= "diamant" and msg ~= "dreieck" and msg ~= "mond" and msg ~= "viereck" and msg ~= "kreuz" and msg ~= "kopf" then
			DEFAULT_CHAT_FRAME:AddMessage("Falsches Ziel angegeben. Bitte versuche es mit einem der folgenden:")
			DEFAULT_CHAT_FRAME:AddMessage("/es stern, /es kreis, /es diamant, /es dreieck, /es mond, /es viereck, /es kreuz, /es kopf")
		else
			DEFAULT_CHAT_FRAME:AddMessage("Es wird nun "..msg.." verwandelt.")
		end
	end
end

function EasySheep()
	myTarget = EasySheepTarget
	if myTarget == nil then myTarget = 1 end
	-- Es wird 10 mal Tab gedrückt und überprüft ob das Target das gesuchte ist.
	for i = 1, 10 do
		if GetRaidTargetIndex("target") == myTarget then
			CastSpellByName("Verwandlung")
			return
		else
			TargetNearestEnemy()
		end	
	end
end
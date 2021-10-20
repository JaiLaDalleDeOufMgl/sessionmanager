local playerCount = 0
local list = {}

RegisterServerEvent('hardcap:playerActivated')

AddEventHandler('hardcap:playerActivated', function()
  if not list[source] then
    playerCount = playerCount + 1
    list[source] = true
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    playerCount = playerCount - 1
    list[source] = nil
  end
end)

-- BanList            = {}
-- function ActualizebanList()
--     MySQL.Async.fetchAll('SELECT * FROM blacklist', {},
-- 	function (data)
-- 		if #data ~= #BanList then
-- 		  BanList = {}
-- 		  for i=1, #data, 1 do
-- 			table.insert(BanList, {
-- 				license    = data[i].GameLicense,
-- 				liveid     = data[i].live,
-- 				xblid      = data[i].xbl,
-- 				discord    = data[i].DiscordUID,
-- 				playerip   = data[i].ip,
-- 				reason     = data[i].Reason,
--                 ID         = data[i].Id
-- 			  })
-- 		  end
-- 		end
-- 	end)
-- end

-- CreateThread(function()
-- 	while true do
-- 		Wait(10 * 1000)
-- 		ActualizebanList()
--         Wait(50 * 1000)
-- 	end
-- end)


-- AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
--     local cv = GetConvarInt('sv_maxclients', 32)
--     deferrals.defer()
--     deferrals.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://i.imgur.com/Zo1BkMX.png","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Los V","weight":"Bolder","size":"Medium"},{"type":"TextBlock","text":"Proxy"}]}]},{"type":"TextBlock","text":"Initialisation de la connexion au proxy..","size":"Medium","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
--     end)
-- 	local playerId = source
--     local steamid = nil
--     local license = nil
--     local discord = nil
--     local ip = nil
--     local xbl = nil
--     local live = nil
-- 	Citizen.Wait(100)

--     for i = 0, GetNumPlayerIdentifiers(playerId) - 1 do -- Get tous les identifiers du joueur
--         local id = GetPlayerIdentifier(playerId, i)
--         if string.find(id, "ip") then
--             ip = id
--         elseif string.find(id, "discord") then
--             discord = id
--         elseif string.find(id, "license") then
--             license = id
--         elseif string.find(id, "xbl") then
--             xbl = id
--         elseif string.find(id, "live") then
--             live = id
--         end
--     end
--     Citizen.Wait(2500)

--     if discord == nil or discord == "" then 
--         deferrals.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://i.imgur.com/Zo1BkMX.png","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Los V","weight":"Bolder","size":"Medium"},{"type":"TextBlock","text":"Proxy"}]}]},{"type":"TextBlock","text":"Veuillez relier votre discord.","size":"Medium","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
--         end)	
--         CancelEvent()
--         return
--     end

--     if Banlist == {} then 
--         while Banlist == {} do 
--             ActualizebanList() --Actualisation de la blacklist
--             Citizen.Wait(1000)
--         end
-- 	end

--     if playerCount >= cv then -- Serveur complet
--         deferrals.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://i.imgur.com/Zo1BkMX.png","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Los V","weight":"Bolder","size":"Medium"},{"type":"TextBlock","text":"Proxy"}]}]},{"type":"TextBlock","text":"Le serveur est complet.","size":"Medium","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
--         end)	
--         CancelEvent()
--         return
--     end

-- 	if discord ~= nil or discord ~= "" then -- Aucun identifier
-- 		if rCore.GetPlayerFromIdentifier(identifier) then
-- 			deferrals.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://i.imgur.com/Zo1BkMX.png","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Los V","weight":"Bolder","size":"Medium"},{"type":"TextBlock","text":"Proxy"}]}]},{"type":"TextBlock","text":"Un joueur possède déja le même discord que vous.","size":"Medium","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
--             end)	
--             CancelEvent()
--             return
-- 		else
--             for k, n in pairs(ConfigAC.BlacklistedCaracters) do
--                 if string.match(name:lower(), n:lower()) then -- Nom steam avec des caractères spéciaux (faisant bug la blacklist)
--                     deferrals.done("\nVotre nom steam est inapproprié. \nCaractère: "..n:lower())
--                     CancelEvent()
--                     return
--                 end
--             end

--             Wait(500)
--             for i = 1, #BanList, 1 do
--                 if ((tostring(BanList[i].license)) == tostring(license) or (tostring(BanList[i].liveid)) == tostring(live) or (tostring(BanList[i].xblid)) == tostring(xbl) or (tostring(BanList[i].discord)) == tostring(discord) or (tostring(BanList[i].playerip)) == tostring(ip)) then
--                     deferrals.done("\nVous êtes banni du serveur.\nRaison: "..BanList[i].reason.."\nId: "..BanList[i].ID) -- Joueur ban
--                     CancelEvent()
--                     return
--                 else
--                     deferrals.presentCard([==[{"type":"AdaptiveCard","version":"1.0","body":[{"type":"ColumnSet","columns":[{"type":"Column","width":"auto","items":[{"type":"Image","altText":"","url":"https://i.imgur.com/Zo1BkMX.png","size":"Medium"}]},{"type":"Column","width":"stretch","items":[{"type":"TextBlock","text":"Los V","weight":"Bolder","size":"Medium"},{"type":"TextBlock","text":"Proxy"}]}]},{"type":"TextBlock","text":"Connexion en cours..","size":"Medium","weight":"Lighter"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}]==], function(data, rawData)
--                     end)	
--                     Wait(1250)
--                     deferrals.done() -- Connexion du joueur
--                 end
--             end
-- 		end
--     end
-- end)
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function getPlayerByName(playername)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil and xPlayer.getName() == playername then
            xPlayer.addMoney(100)
            return xPlayer
        end
    end
    return nil
end
RegisterServerEvent('onPlayerVote')
AddEventHandler('onPlayerVote', function (playername, ip, date)
    local player = getPlayerByName(playername)
    if player then
		TriggerClientEvent("pNotify:SendNotification", -1, {
		    text = ""..playername.. " a voté pour le serveur</br>Il a gagné <b style='color:green'>100$</b>",
		    type = "info",
		    timeout = 15000,
		    layout = "centerRight"
	    })
    else
		TriggerClientEvent("pNotify:SendNotification", -1, {
		    text = "Un inconnu a voté pour le serveur !",
		 	type = "info",
		 	timeout = 15000,
			layout = "centerRight"
	    })
    end
end)
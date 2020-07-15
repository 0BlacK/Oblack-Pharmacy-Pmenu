ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Dylanshop:buy')
AddEventHandler('Dylanshop:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, 1)

        TriggerClientEvent('esx:showNotification', source, "Merci de votre ~o~Visite !", "", 1)
     else
          TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d'argent sur vous !")    end
end)
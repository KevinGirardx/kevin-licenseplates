local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('licenseplate', function(source, item)
	TriggerClientEvent('kevin-licenseplates:client:applyplate', source, true)
end)

RegisterNetEvent('kevin-licenseplates:server:checkplateinfo', function (closevehicle, OriginalPlate)
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
	local Plate = Player.Functions.GetItemByName('licenseplate')
	if Plate then
		local NewPlate = Plate.info.plate
		MySQL.Sync.fetchAll('SELECT citizenid FROM player_vehicles WHERE plate = ?', {OriginalPlate})
		TriggerClientEvent('kevin-licenseplates:client:setvehicleplate',PlayerID, closevehicle, NewPlate, OriginalPlate)
		Player.Functions.RemoveItem('licenseplate', 1, false)
		TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['licenseplate'], 'remove')
	end
end)

RegisterNetEvent('kevin-licenseplates:giveoldlicenseplate', function (OriginalPlate, NewPlate)
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
	local info = {}
    info.plate = OriginalPlate
    Player.Functions.AddItem('licenseplate', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['licenseplate'], 'add')
	MySQL.update('UPDATE player_vehicles SET plate = ? WHERE plate = ?', {NewPlate, OriginalPlate})
	MySQL.update('UPDATE trunkitems SET plate = ? WHERE plate = ?', {NewPlate, OriginalPlate})
	MySQL.update('UPDATE gloveboxitems SET plate = ? WHERE plate = ?', {NewPlate, OriginalPlate})
end)

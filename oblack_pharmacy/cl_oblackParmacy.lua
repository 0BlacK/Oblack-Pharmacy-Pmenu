ESX = nil
local inAnim = false

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end 


print("^1======================================================================^1")
print("^2[^4Pharmacy By ^2] ^7: ^2 Oblack#0001^2")
print("^1======================================================================^1")
print("^8======================================================================^8")
print("^5[^5Discord^5] ^1: ^1 https://discord.gg/UfFbWQ7^1")
print("^8======================================================================^8")

local blips = {
    {title="Pharmacy", colour=34, id=51, x = 317.993, y = -1076.646, z = 28.479},

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

local obkPhar = {

    Base = { Title = "Pharmacy" },
    Data = { currentMenu = "obkPhar" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Medikit" then
                    TriggerServerEvent('Dylanshop:buy', 10, "medikit", "Medikit")
                    ESX.ShowNotification('Vous avez ~g~achetez ~w~un Kit de soin')
              elseif btn.name == "Bandage" then
                    TriggerServerEvent('Dylanshop:buy', 15, "bandage", "Bandage")
                    ESX.ShowNotification('Vous avez ~g~achetez ~w~un Bandage')
              elseif btn.name == "~r~Fermer le menu" then
                CloseMenu(true)




              end
        end,
    },

    Menu = {
        ["obkPhar"] = {
            b = {
                {name = "Voir ce qu'il propose", ask = "→", askX = true},
                {name = "~r~Fermer le menu", ask = "→", askX = true},
            }
        },

        ["voir ce qu'il propose"] = {
            b = {
                {name = "Medikit", ask = "~g~10$", askX = true},
                {name = "Bandage", ask = "~g~15$", askX = true},
            }
        },


    }
}

local oPhar = {
    { x = 318.0297, y = -1077.0555, z = 29.47}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(oPhar) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, oPhar[k].x, oPhar[k].y, oPhar[k].z)
            DrawMarker(29, v.x, v.y, 44.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 238, 13,  155, false, true, 2, true, nil, nil, false)
            if dist <= 1.5 then
				ESX.ShowHelpNotification("Appuyez sur ~g~~INPUT_CONTEXT~~w~ pour parler au ~r~Pharmacien")
                if IsControlJustPressed(1,51) then
                    DrawSub('~w~[~g~Le Pharmacien~w~] : Bonjour, Voici ce que je ~g~propose ~w~:', 9996)
                    CreateMenu(obkPhar)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_doctor_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_doctor_01", 318.016, -1078.428, 28.479, 349.337, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)

--by Oblack#0001
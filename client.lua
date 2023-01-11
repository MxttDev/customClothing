menuOpened = false
RegisterNetEvent("SetPedSkin")

function createMenu()
    WarMenu.CreateMenu('cloth', 'SUBURBAN', 'Store')

    WarMenu.SetMenuTitleBackgroundColor('cloth', 0, 0, 0, 200)
    WarMenu.SetMenuTitleColor('cloth', 240, 240, 240, 1000)
    WarMenu.SetMenuBackgroundColor('cloth', 0, 0, 0, 150)

    WarMenu.SetMenuX('cloth', 0.75)
    WarMenu.SetMenuY('cloth', 0.05)


    WarMenu.CreateSubMenu('cloth_outfit', 'cloth', 'Outfits')
    WarMenu.CreateSubMenu('cloth_mask', 'cloth', 'Masks')
    WarMenu.CreateSubMenu('cloth_jacket', 'cloth', 'Jackets')
    WarMenu.CreateSubMenu('cloth_undershirt', 'cloth', 'Undershirt')
    WarMenu.CreateSubMenu('cloth_shoes', 'cloth', 'Shoes')
    WarMenu.CreateSubMenu('cloth_accessory', 'cloth', 'Accessory')
    WarMenu.CreateSubMenu('cloth_parachute', 'cloth', 'Parachute / Bags')
    WarMenu.CreateSubMenu('cloth_bodyarmor', 'cloth', 'Body armor')
    
    getMaxValues()
    

end

function getMaxValues()
    local ped = PlayerPedId()
    
    local maxModelValues = {
        ["mask"]     = {type = "character", item = 0, texture = 0}
    }

    maxModelValues["mask"].item = GetNumberOfPedDrawableVariations(ped, 1)
    print(maxModelValues["mask"].item)

    for i=i, maxModelValues["mask"].item, 1 do 

        local list = maxModelValues["mask"].item[i]
        print(list)
        Citizen.Wait(1)
    end

    

end

function openMenu()
    
    menuOpened = true
    if WarMenu.IsAnyMenuOpened() then
        return
    end

    WarMenu.OpenMenu('cloth')

    local ped = PlayerPedId()

    while menuOpened do 
        if WarMenu.Begin('cloth') then 
            if WarMenu.Button('Outfits') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_outfit')

    
                WarMenu.End()
            elseif WarMenu.Button('Masks') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_mask')
                WarMenu.End()
            elseif WarMenu.Button('Jackets') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_jacket') 
                WarMenu.End()
            elseif WarMenu.Button('Undershirt') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_undershirt')
                WarMenu.End()
            elseif WarMenu.Button('Pants') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_pants')  
                WarMenu.End()
            elseif WarMenu.Button('Shoes') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_shoes')   
                WarMenu.End() 
            elseif WarMenu.Button('Accessories') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_accessory')
                WarMenu.End()
            elseif WarMenu.Button('Parachute / Bag') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_parachute')
                WarMenu.End()
            elseif WarMenu.Button('Body Armor') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_bodyarmor')
                WarMenu.End()
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_outfit') then --Finish and connect to db
            if WarMenu.Button("-Save Outfit") then 
                local model = 'mp_m_freemode_01'
                RequestModel(model)
                while not HasModelLoaded(model) do 
                    Citizen.Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetPedComponentVariation(GetPlayerPed(-1), 1, 20, 0, 0)
                SetModelAsNoLongerNeeded(model)

                WarMenu.End()
            end
            WarMenu.Button("-Delete Outfit")
            WarMenu.Button("TrooperUniform")
            WarMenu.Button("Suit")
            WarMenu.Button("GangOutfit")
            WarMenu.End()
        elseif WarMenu.Begin("cloth_mask") then 
            getMaxValues()
            WarMenu.End()
        else menuOpened = false end

        
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    createMenu()

    loc = {
        x = 124.9118,
        y = -220.6218,
        z = 54.55782
    }

    while true do 
        
        local playerCoord = GetEntityCoords(PlayerPedId())
        local locVector = vector3(loc.x, loc.y, loc.z)

        if Vdist2(playerCoord, locVector) <= 30 and GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
            if menuOpened then 
            else openMenu() end
            
        end
        
        Citizen.Wait(1000)
    end

end)

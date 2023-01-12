menuOpened = false
RegisterNetEvent("SetPedSkin")
--3 arms
--4 legs
--5 parachute
--6 shoes
--7 scarfs
--8 torso
--9 bodyArmor
--10 decals?
--11 Jackets / hoodies
maskItemsList = {}
JacketItemsList = {}
UShirtItemList = {}
PantsItemList = {}
ShoesItemList = {}
ArmsItemList = {}
AccessoryItemList = {}
ParachuteItemList = {}
BodyArmorItemList = {}

local FiveMMaskID = 1
local FiveMJacketID = 11
local FiveMUShirtID = 8
local FiveMPantsID = 4
local FiveMShoesID = 6
local FiveMArmsID = 3
local FiveMAccessoryID = 7
local FiveMParachuteID = 5
local FiveMBodyArmorID = 9

local _currentMaskIndex = GetPedDrawableVariation(PlayerPedId(), FiveMMaskID) + 1
local selMaskIndex = GetPedDrawableVariation(PlayerPedId(), FiveMMaskID) + 1

local _currentJacketIndex = GetPedDrawableVariation(PlayerPedId(), FiveMJacketID) + 1
local selJacketIndex = GetPedDrawableVariation(PlayerPedId(), FiveMJacketID) + 1

local _currentUShirtIndex = GetPedDrawableVariation(PlayerPedId(), FiveMUShirtID) + 1
local selUShirtIndex = GetPedDrawableVariation(PlayerPedId(), FiveMUShirtID) + 1

local _currentPantsIndex = GetPedDrawableVariation(PlayerPedId(), FiveMPantsID) + 1
local selPantsIndex = GetPedDrawableVariation(PlayerPedId(), FiveMPantsID) + 1
--
local _currentShoesIndex = GetPedDrawableVariation(PlayerPedId(), FiveMShoesID) + 1
local selShoesIndex = GetPedDrawableVariation(PlayerPedId(), FiveMShoesID) + 1

local _currentArmsIndex = GetPedDrawableVariation(PlayerPedId(), FiveMArmsID) + 1
local selArmsIndex = GetPedDrawableVariation(PlayerPedId(), FiveMArmsID) + 1

local _currentAccessoryIndex = GetPedDrawableVariation(PlayerPedId(), FiveMAccessoryID ) + 1
local selAccessoryIndex = GetPedDrawableVariation(PlayerPedId(), FiveMAccessoryID ) + 1

local _currentParachuteIndex = GetPedDrawableVariation(PlayerPedId(), FiveMParachuteID) + 1
local selParachuteIndex = GetPedDrawableVariation(PlayerPedId(), FiveMParachuteID) + 1

local _currentBodyArmorIndex = GetPedDrawableVariation(PlayerPedId(), FiveMBodyArmorID ) + 1
local selBodyArmorIndex = GetPedDrawableVariation(PlayerPedId(), FiveMBodyArmorID ) + 1

function createMenu()
    WarMenu.CreateMenu('cloth', 'SUBURBAN', 'Store')

    WarMenu.SetMenuTitleBackgroundColor('cloth', 365, 105, 22, 200)
    WarMenu.SetMenuTitleColor('cloth', 240, 240, 240, 1000)
    WarMenu.SetMenuBackgroundColor('cloth', 0, 0, 0, 150)

    WarMenu.SetMenuX('cloth', 0.75)
    WarMenu.SetMenuY('cloth', 0.05)


    WarMenu.CreateSubMenu('cloth_outfit', 'cloth', 'Outfits')
    WarMenu.CreateSubMenu('cloth_mask', 'cloth', 'Masks')
    WarMenu.CreateSubMenu('cloth_jacket', 'cloth', 'Jackets')
    WarMenu.CreateSubMenu('cloth_pants', 'cloth', 'Pants')
    WarMenu.CreateSubMenu('cloth_undershirt', 'cloth', 'Undershirt')
    WarMenu.CreateSubMenu('cloth_shoes', 'cloth', 'Shoes')
    WarMenu.CreateSubMenu('cloth_accessory', 'cloth', 'Accessory')
    WarMenu.CreateSubMenu('cloth_parachute', 'cloth', 'Parachute / Bags')
    WarMenu.CreateSubMenu('cloth_bodyarmor', 'cloth', 'Body armor')
    WarMenu.CreateSubMenu('cloth_arms', 'cloth', 'Arms')
    
    

end

function getMaskItems()
    local maskItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMMaskID)
    local maskItemsList = {}
    for i = 1, maskItems do
        maskItemsList[i] = i
    end
	return maskItemsList
end

function getJacketItems()
    local jacketItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMJacketID)
    local JacketItemsList = {}
    for i = 1, jacketItems do
        JacketItemsList[i] = i
    end
    return JacketItemsList
end

function getUShirt()
    local UShirtItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMUShirtID)
    local UShirtItemList = {}
    for i = 1, UShirtItems do
        UShirtItemList[i] = i
    end
    return UShirtItemList
end

function getPants()
    local PantsItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMPantsID)
    local PantsItemList = {}
    for i = 1, PantsItems do
        PantsItemList[i] = i
    end
    return PantsItemList
end

function getShoes()
    local ShoesItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMShoesID)
    local ShoesItemList = {}
    for i = 1, ShoesItems do
        ShoesItemList[i] = i
    end
    return ShoesItemList
end

function getArms()
    local ArmsItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMArmsID)
    local ArmsItemList = {}
    for i = 1, ArmsItems do
        ArmsItemList[i] = i
    end
    return ArmsItemList
end

function getAccessory()
    local AccessoryItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMAccessoryID)
    local AccessoryItemList = {}
    for i = 1, AccessoryItems do
        AccessoryItemList[i] = i
    end
    return AccessoryItemList
end

function getParachute()
    local ParachuteItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMParachuteID)
    local ParachuteItemList = {}
    for i = 1, ParachuteItems do
        ParachuteItemList[i] = i
    end
    return ParachuteItemList
end

function getBodyArmor()
    local BodyArmorItems = GetNumberOfPedDrawableVariations(PlayerPedId(), FiveMBodyArmorID)
    local BodyArmorItemList = {}
    for i = 1, BodyArmorItems do
        BodyArmorItemList[i] = i
    end
    return BodyArmorItemList
end


function openMenu()
    menuOpened = true
    if WarMenu.IsAnyMenuOpened() then
        return
    end

    _maskItemsList = getMaskItems()
    _JacketItemsList = getJacketItems()
    _UShirtItemsList = getUShirt()
    _PantsItemsList = getPants()  
    _ShoesItemsList = getShoes()
    _ArmsItemsList = getArms()
    _AccessoryItemsList = getAccessory()
    _ParachuteItemsList = getParachute()
    _BodyArmorItemsList = getBodyArmor()

    WarMenu.OpenMenu('cloth')

    local ped = PlayerPedId()

    while menuOpened do 
        if WarMenu.Begin('cloth') then 
            if WarMenu.Button('Outfits') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_outfit')
                WarMenu.End()
            elseif WarMenu.Button('Jackets') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_jacket') 
                WarMenu.End()
            elseif WarMenu.Button('Pants') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_pants')  
                WarMenu.End()
            elseif WarMenu.Button('Undershirt') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_undershirt')
                WarMenu.End()

            elseif WarMenu.Button('Shoes') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_shoes')   
                WarMenu.End() 
            elseif WarMenu.Button('Masks') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_mask')    
                WarMenu.End()
            elseif WarMenu.Button('Arms') then 
                WarMenu.CloseMenu()
                WarMenu.OpenMenu('cloth_arms')
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
            WarMenu.Button("-Save Outfit")
            WarMenu.Button("-Delete Outfit")
            WarMenu.Button("TrooperUniform")
            WarMenu.Button("Suit")
            if WarMenu.Button("GangOutfit") then 
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
            WarMenu.End()
        elseif WarMenu.Begin("cloth_mask") then 
            local _, currentMaskIndex = WarMenu.ComboBox("Mask", _maskItemsList, _currentMaskIndex)
            if _currentMaskIndex ~= maskItemsList then 
                _currentMaskIndex = currentMaskIndex
                SetPedComponentVariation(PlayerPedId(), FiveMMaskID, maskItemsList[currentMaskIndex]-1, 0, 0)
            end
          
            WarMenu.End()
        elseif WarMenu.Begin('cloth_jacket') then 
            local _, currentJacketIndex = WarMenu.ComboBox("Jackets", _JacketItemsList, _currentJacketIndex)
            if _currentJacketIndex ~= JacketItemsList then 
                _currentJacketIndex = currentJacketIndex
                SetPedComponentVariation(PlayerPedId(), FiveMJacketID, _JacketItemsList[currentJacketIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_pants') then 
            local _, currentPantsIndex = WarMenu.ComboBox("Pants", _PantsItemsList, _currentPantsIndex)
            if _currentPantsIndex ~= PantsItemsList then 
                _currentPantsIndex = currentPantsIndex
                SetPedComponentVariation(PlayerPedId(), FiveMPantsID, _PantsItemsList[currentPantsIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_undershirt') then 
            local _, currentUShirtIndex = WarMenu.ComboBox("Jackets", _UShirtItemsList, _currentUShirtIndex)
            if _currentUShirtIndex ~= currentUShirtIndex then 
                _currentUShirtIndex = currentUShirtIndex
                SetPedComponentVariation(PlayerPedId(), FiveMUShirtID, _UShirtItemsList[currentUShirtIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_shoes') then 
            local _, currentShoesIndex = WarMenu.ComboBox("Shoes", _ShoesItemsList, _currentShoesIndex)
            if _currentShoesIndex ~= currentShoesIndex then 
                _currentShoesIndex = currentShoesIndex
                SetPedComponentVariation(PlayerPedId(), FiveMShoesID, _ShoesItemsList[currentShoesIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_arms') then 
            local _, currentArmsIndex = WarMenu.ComboBox("Arms", _ArmsItemsList, _currentArmsIndex)
            if _currentArmsIndex ~= currentArmsIndex then 
                _currentArmsIndex = currentArmsIndex
                SetPedComponentVariation(PlayerPedId(), FiveMArmsID, _ArmsItemsList[currentArmsIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_accessory') then 
            local _, currentAccessoryIndex = WarMenu.ComboBox("Accessory", _AccessoryItemsList, _currentAccessoryIndex)
            if _currentAccessoryIndex ~= currentAccessoryIndex then 
                _currentAccessoryIndex = currentAccessoryIndex
                SetPedComponentVariation(PlayerPedId(), FiveMAccessoryID, _AccessoryItemsList[currentAccessoryIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_parachute') then 
            local _, currentParachuteIndex = WarMenu.ComboBox("Parachute / Bag", _ParachuteItemsList, _currentParachuteIndex)
            if _currentParachuteIndex ~= currentParachuteIndex then 
                _currentParachuteIndex = currentParachuteIndex
                SetPedComponentVariation(PlayerPedId(), FiveMParachuteID, _ParachuteItemsList[currentParachuteIndex]-1, 0, 0)
            end
            WarMenu.End()
        elseif WarMenu.Begin('cloth_bodyarmor') then 
            local _, currentBodyArmorIndex = WarMenu.ComboBox("Body Armor", _BodyArmorItemsList, _currentBodyArmorIndex)
            if _currentBodyArmorIndex ~= currentBodyArmorIndex then 
                _currentBodyArmorIndex = currentBodyArmorIndex
                SetPedComponentVariation(PlayerPedId(), FiveMBodyArmorID, _BodyArmorItemsList[currentBodyArmorIndex]-1, 0, 0)
            end
            WarMenu.End()
        else menuOpened = false end

        
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    createMenu()
    maskItemsList = getMaskItems()

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

local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

local function HasAttachment(component, attachments)
    local retval = false
    local key = nil
    for k, v in pairs(attachments) do
        if v.component == component then
            key = k
            retval = true
        end
    end
    return retval, key
end

local function GetAttachmentType(attachments)
    local attype = nil
    for _, v in pairs(attachments) do
        attype = v.type
    end
    return attype
end

-- Callback

QBCore.Functions.CreateCallback("weapons:server:GetConfig", function(_, cb)
    cb(Config.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            local ItemData = Player.Functions.GetItemBySlot(WeaponData.slot)
            if ItemData then
                retval = ItemData.info.ammo and ItemData.info.ammo or 0
            end
        end
    end
    cb(retval, WeaponData.name)
end)

QBCore.Functions.CreateCallback('weapons:server:RemoveAttachment', function(source, cb, AttachmentData, ItemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local AttachmentComponent = WeaponAttachments[ItemData.name:upper()][AttachmentData.attachment]
    if Inventory[ItemData.slot] then
        if Inventory[ItemData.slot].info.attachments and next(Inventory[ItemData.slot].info.attachments) then
            local HasAttach, key = HasAttachment(AttachmentComponent.component, Inventory[ItemData.slot].info.attachments)
            if HasAttach then
                table.remove(Inventory[ItemData.slot].info.attachments, key)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.AddItem(AttachmentComponent.item, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[AttachmentComponent.item], "add")
                TriggerClientEvent("QBCore:Notify", src, Lang:t('info.removed_attachment', { value = QBCore.Shared.Items[AttachmentComponent.item].label }), "error")
                cb(Inventory[ItemData.slot].info.attachments)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    if Player.PlayerData.items[data.slot] then
        if Player.PlayerData.items[data.slot].info.quality then
            if Player.PlayerData.items[data.slot].info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Config.WeaponRepairCosts[WeaponClass]) then
                    Config.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    Config.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = Player.PlayerData.items[data.slot],
                        Ready = false,
                    }
                    if not Player.Functions.RemoveItem(data.name, 1, data.slot) then
                        return Player.Functions.AddMoney('cash', Config.WeaponRepairCosts[WeaponClass])
                    end
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], "remove")
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data.name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                        exports['qb-phone']:sendNewMailToOffline(Player.PlayerData.citizenid, {
                            sender = Lang:t('mail.sender'),
                            subject = Lang:t('mail.subject'),
                            message = Lang:t('mail.message', { value = WeaponData.label })
                        })
                        SetTimeout(7 * 60000, function()
                            if Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                Config.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), "error")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prison:server:checkThrowable', function(source, cb, weapon)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return cb(false) end
    local throwable = false
    for _,v in pairs(Config.Throwables) do
        if QBCore.Shared.Weapons[weapon].name == 'weapon_'..v then
            if not Player.Functions.RemoveItem('weapon_'..v, 1) then return cb(false) end
            throwable = true
            break
        end
    end
    cb(throwable)
end)

-- Events

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    amount = tonumber(amount)
    if CurrentWeaponData then
        if Player.PlayerData.items[CurrentWeaponData.slot] then
            Player.PlayerData.items[CurrentWeaponData.slot].info.ammo = amount
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemdata = Config.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata.name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemdata.name], "add")
    Config.WeaponRepairPoints[k].IsRepairing = false
    Config.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(data, hp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.quality = hp
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponSlot = Player.PlayerData.items[data.slot]
    local DecreaseAmount = Config.DurabilityMultiplier[data.name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData.name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent("weapons:server:EquipAttachment", function(ItemData, CurrentWeaponData, AttachmentData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local GiveBackItem = nil
    if Inventory[CurrentWeaponData.slot] then
        if Inventory[CurrentWeaponData.slot].info.attachments and next(Inventory[CurrentWeaponData.slot].info.attachments) then
            local currenttype = GetAttachmentType(Inventory[CurrentWeaponData.slot].info.attachments)
            local HasAttach, key = HasAttachment(AttachmentData.component, Inventory[CurrentWeaponData.slot].info.attachments)
            if not HasAttach then
                if AttachmentData.type ~=nil and currenttype == AttachmentData.type then
                    for _, v in pairs(Inventory[CurrentWeaponData.slot].info.attachments) do
                        if v.type and v.type == currenttype then
                            GiveBackItem = tostring(v.item):lower()
                            table.remove(Inventory[CurrentWeaponData.slot].info.attachments, key)
                            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[GiveBackItem], "add")
                        end
                    end
                end
                Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                    component = AttachmentData.component,
                    label = QBCore.Shared.Items[AttachmentData.item].label,
                    item = AttachmentData.item,
                    type = AttachmentData.type,
                }
                TriggerClientEvent("addAttachment", src, AttachmentData.component)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.RemoveItem(ItemData.name, 1)
                SetTimeout(1000, function()
                    TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
                end)
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.attachment_already_on_weapon' , { value = QBCore.Shared.Items[AttachmentData.item].label }), "error", 3500)
            end
        else
            Inventory[CurrentWeaponData.slot].info.attachments = {}
            Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                component = AttachmentData.component,
                label = QBCore.Shared.Items[AttachmentData.item].label,
                item = AttachmentData.item,
                type = AttachmentData.type,
            }
            TriggerClientEvent("addAttachment", src, AttachmentData.component)
            Player.Functions.SetInventory(Player.PlayerData.items, true)
            Player.Functions.RemoveItem(ItemData.name, 1)
            SetTimeout(1000, function()
                TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
            end)
        end
    end
    if GiveBackItem then
        Player.Functions.AddItem(GiveBackItem, 1, false)
    end
end)

RegisterNetEvent('weapons:server:removeWeaponAmmoItem', function(item)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player or type(item) ~= 'table' or not item.name or not item.slot then return end

    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

--Removes Tint Item
--[[RegisterNetEvent('weapons:server:removeWeaponTintItem', function(tint)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player or not tint then return end

    Player.Functions.RemoveItem(tint, 1)
end)]]

--Sets Tint
RegisterNetEvent('weapons:server:ApplyTint', function(data, tint)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.tint = tint
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

-- Commands

QBCore.Commands.Add("repairweapon", "Repair Weapon (God Only)", {{name="hp", help=Lang:t('info.hp_of_weapon')}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, "god")

-- Items

-- AMMO
--[[QBCore.Functions.CreateUseableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

QBCore.Functions.CreateUseableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

QBCore.Functions.CreateUseableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

QBCore.Functions.CreateUseableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

QBCore.Functions.CreateUseableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

QBCore.Functions.CreateUseableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

QBCore.Functions.CreateUseableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)]]


--███╗░░░███╗███████╗██╗░░░░░███████╗███████╗
--████╗░████║██╔════╝██║░░░░░██╔════╝██╔════╝
--██╔████╔██║█████╗░░██║░░░░░█████╗░░█████╗░░
--██║╚██╔╝██║██╔══╝░░██║░░░░░██╔══╝░░██╔══╝░░
--██║░╚═╝░██║███████╗███████╗███████╗███████╗
--╚═╝░░░░░╚═╝╚══════╝╚══════╝╚══════╝╚══════╝

--██████╗░██╗░██████╗████████╗░█████╗░██╗░░░░░░██████╗
--██╔══██╗██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██╔════╝
--██████╔╝██║╚█████╗░░░░██║░░░██║░░██║██║░░░░░╚█████╗░
--██╔═══╝░██║░╚═══██╗░░░██║░░░██║░░██║██║░░░░░░╚═══██╗
--██║░░░░░██║██████╔╝░░░██║░░░╚█████╔╝███████╗██████╔╝
--╚═╝░░░░░╚═╝╚═════╝░░░░╚═╝░░░░╚════╝░╚══════╝╚═════╝░

QBCore.Functions.CreateUseableItem('pistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('pistol_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('pistol_scope_1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

--[[QBCore.Functions.CreateUseableItem('pistol_scope_2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)]]


--░██████╗███╗░░░███╗░██████╗░░██████╗
--██╔════╝████╗░████║██╔════╝░██╔════╝
--╚█████╗░██╔████╔██║██║░░██╗░╚█████╗░
--░╚═══██╗██║╚██╔╝██║██║░░╚██╗░╚═══██╗
--██████╔╝██║░╚═╝░██║╚██████╔╝██████╔╝
--╚═════╝░╚═╝░░░░░╚═╝░╚═════╝░╚═════╝░

QBCore.Functions.CreateUseableItem('smg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('smg_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('smg_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('smg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('smg_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('smg_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

--░██████╗██╗░░██╗░█████╗░████████╗░██████╗░██╗░░░██╗███╗░░██╗░██████╗
--██╔════╝██║░░██║██╔══██╗╚══██╔══╝██╔════╝░██║░░░██║████╗░██║██╔════╝
--╚█████╗░███████║██║░░██║░░░██║░░░██║░░██╗░██║░░░██║██╔██╗██║╚█████╗░
--░╚═══██╗██╔══██║██║░░██║░░░██║░░░██║░░╚██╗██║░░░██║██║╚████║░╚═══██╗
--██████╔╝██║░░██║╚█████╔╝░░░██║░░░╚██████╔╝╚██████╔╝██║░╚███║██████╔╝
--╚═════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░╚═════╝░░╚═════╝░╚═╝░░╚══╝╚═════╝░

QBCore.Functions.CreateUseableItem('shotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('shotgun_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('shotgun_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('shotgun_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('shotgun_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

--░█████╗░░██████╗░██████╗░█████╗░██╗░░░██╗██╗░░░░░████████╗  ██████╗░██╗███████╗██╗░░░░░███████╗
--██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██║░░░░░╚══██╔══╝  ██╔══██╗██║██╔════╝██║░░░░░██╔════╝
--███████║╚█████╗░╚█████╗░███████║██║░░░██║██║░░░░░░░░██║░░░  ██████╔╝██║█████╗░░██║░░░░░█████╗░░
--██╔══██║░╚═══██╗░╚═══██╗██╔══██║██║░░░██║██║░░░░░░░░██║░░░  ██╔══██╗██║██╔══╝░░██║░░░░░██╔══╝░░
--██║░░██║██████╔╝██████╔╝██║░░██║╚██████╔╝███████╗░░░██║░░░  ██║░░██║██║██║░░░░░███████╗███████╗
--╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░  ╚═╝░░╚═╝╚═╝╚═╝░░░░░╚══════╝╚══════╝

QBCore.Functions.CreateUseableItem('rifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('rifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('rifle_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('rifle_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('rifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('rifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)


--███╗░░░███╗░█████╗░░█████╗░██╗░░██╗██╗███╗░░██╗███████╗  ░██████╗░██╗░░░██╗███╗░░██╗░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░██║██║████╗░██║██╔════╝  ██╔════╝░██║░░░██║████╗░██║██╔════╝
--██╔████╔██║███████║██║░░╚═╝███████║██║██╔██╗██║█████╗░░  ██║░░██╗░██║░░░██║██╔██╗██║╚█████╗░
--██║╚██╔╝██║██╔══██║██║░░██╗██╔══██║██║██║╚████║██╔══╝░░  ██║░░╚██╗██║░░░██║██║╚████║░╚═══██╗
--██║░╚═╝░██║██║░░██║╚█████╔╝██║░░██║██║██║░╚███║███████╗  ╚██████╔╝╚██████╔╝██║░╚███║██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚══════╝  ░╚═════╝░░╚═════╝░╚═╝░░╚══╝╚═════╝░

QBCore.Functions.CreateUseableItem('mg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('mg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('mg_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

--░██████╗███╗░░██╗██╗██████╗░███████╗██████╗░░██████╗
--██╔════╝████╗░██║██║██╔══██╗██╔════╝██╔══██╗██╔════╝
--╚█████╗░██╔██╗██║██║██████╔╝█████╗░░██████╔╝╚█████╗░
--░╚═══██╗██║╚████║██║██╔═══╝░██╔══╝░░██╔══██╗░╚═══██╗
--██████╔╝██║░╚███║██║██║░░░░░███████╗██║░░██║██████╔╝
--╚═════╝░╚═╝░░╚══╝╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░

QBCore.Functions.CreateUseableItem('sniper_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('sniper_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('sniper_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('sniper_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('sniper_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

--██╗░░██╗███████╗░█████╗░██╗░░░██╗██╗░░░██╗
--██║░░██║██╔════╝██╔══██╗██║░░░██║╚██╗░██╔╝
--███████║█████╗░░███████║╚██╗░██╔╝░╚████╔╝░
--██╔══██║██╔══╝░░██╔══██║░╚████╔╝░░░╚██╔╝░░
--██║░░██║███████╗██║░░██║░░╚██╔╝░░░░░██║░░░
--╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░░
QBCore.Functions.CreateUseableItem('launcher_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('launcher_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('launcher_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)


--░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║
--███████║██║░░██║██║░░██║██║░░██║██╔██╗██║
--██╔══██║██║░░██║██║░░██║██║░░██║██║╚████║
--██║░░██║██████╔╝██████╔╝╚█████╔╝██║░╚███║
--╚═╝░░╚═╝╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚══╝

--████████╗██╗███╗░░██╗██╗████████╗░██████╗
--╚══██╔══╝██║████╗░██║██║╚══██╔══╝██╔════╝
--░░░██║░░░██║██╔██╗██║██║░░░██║░░░╚█████╗░
--░░░██║░░░██║██║╚████║██║░░░██║░░░░╚═══██╗
--░░░██║░░░██║██║░╚███║██║░░░██║░░░██████╔╝
--░░░╚═╝░░░╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═════╝░

--Knuckle
QBCore.Functions.CreateUseableItem('knuckle_style_1', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_2', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_3', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_4', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_5', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_6', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_7', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_8', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 8)
end)

QBCore.Functions.CreateUseableItem('knuckle_style_9', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 9)
end)

--Blade
QBCore.Functions.CreateUseableItem('blade_style_1', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 0)
end)

QBCore.Functions.CreateUseableItem('blade_style_2', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

--Weapons
QBCore.Functions.CreateUseableItem('luxury', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)





QBCore.Functions.CreateUseableItem('weapontint_1', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('weapontint_2', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('weapontint_3', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('weapontint_4', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('weapontint_5', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('weapontint_6', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('weapontint_7', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

--MK2
QBCore.Functions.CreateUseableItem('weapontintmk2_1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'tint')
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'tint')
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_0', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 0)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_1', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_2', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_3', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_4', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_5', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_6', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_7', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_8', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 8)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_9', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 9)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_10', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 10)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_11', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 11)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_12', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 12)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_13', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 13)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_14', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 14)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_15', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 15)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_16', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 16)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_17', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 17)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_18', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 18)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_19', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 19)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_20', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 20)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_21', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 21)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_22', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 22)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_23', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 23)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_24', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 24)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_25', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 25)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_26', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 26)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_27', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 27)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_28', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 28)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_29', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 29)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_30', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 30)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_31', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 31)
end)

QBCore.Functions.CreateUseableItem('weapontintmk2_32', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 32)
end)

function CreateExtendedPlayer(player, accounts, inventory, job, loadout, name, lastPosition)
	local self = {}

	self.player       = player
	self.accounts     = accounts
	self.inventory    = inventory
	self.job          = job
	self.loadout      = loadout
	self.name         = name
	self.lastPosition = lastPosition

	self.source     = self.player.get('source')
	self.identifier = self.player.get('identifier')

	self.setMoney = function(money, hook)
		money = ESX.Math.Round(money)

		local moneyDiff = money - self.getMoney()
		if moneyDiff >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (cash) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, moneyDiff)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif moneyDiff >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (cash) (possible exploit)'):format(tostring(hook), self.identifier, moneyDiff)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		if money >= 0 then
			self.player.setMoney(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried setting -1 cash balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.getMoney = function()
		return self.player.get('money')
	end

	self.setBankBalance = function(money, hook)
		money = ESX.Math.Round(money)

		local moneyDiff = money - self.getBank()
		if moneyDiff >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his bankaccount (bank) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, moneyDiff)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif moneyDiff >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his bankaccount (bank) (possible exploit)'):format(tostring(hook), self.identifier, moneyDiff)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		if money >= 0 then
			self.player.setBankBalance(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried setting -1 bank balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.getBank = function()
		return self.player.get('bank')
	end

	self.getCoords = function()
		return self.player.get('coords')
	end

	self.setCoords = function(x, y, z)
		self.player.coords = {x = x, y = y, z = z}
	end

	self.kick = function(reason)
		self.player.kick(reason)
	end

	self.addMoney = function(money, hook)
		money = ESX.Math.Round(money)

		if money >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (cash) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif money >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (cash) (possible exploit)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		if money >= 0 then
			self.player.addMoney(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried adding -1 cash balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.removeMoney = function(money, hook)
		money = ESX.Math.Round(money)

		if money >= 100000 then
			local message = ('es_extended [%s]: %s removed €%.2f from his account (cash)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif money >= 10000 then
			local message = ('es_extended [%s]: %s removed €%.2f from his account (cash)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		if money >= 0 then
			self.player.removeMoney(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried removing -1 cash balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.addBank = function(money, hook)
		money = ESX.Math.Round(money)

		if money >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his bankaccount (bank) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif money >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his bankaccount (bank) (possible exploit)'):format(tostring(hook), self.identifier, money)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		if money >= 0 then
			self.player.addBank(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried adding -1 bank balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.removeBank = function(money)
		money = ESX.Math.Round(money)

		if money >= 0 then
			self.player.removeBank(money)
		else
			local message = ('es_extended: %s attempted exploiting! (reason: player tried removing -1 bank balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end
	end

	self.displayMoney = function(money)
		self.player.displayMoney(money)
	end

	self.displayBank = function(money)
		self.player.displayBank(money)
	end

	self.setSessionVar = function(key, value)
		self.player.setSessionVar(key, value)
	end

	self.getSessionVar = function(k)
		return self.player.getSessionVar(k)
	end

	self.getPermissions = function()
		return self.player.getPermissions()
	end

	self.setPermissions = function(p)
		self.player.setPermissions(p)
	end

	self.getIdentifier = function()
		return self.player.getIdentifier()
	end

	self.getGroup = function()
		return self.player.getGroup()
	end

	self.set = function(k, v)
		self.player.set(k, v)
	end

	self.get = function(k)
		return self.player.get(k)
	end

	self.getPlayer = function()
		return self.player
	end

	self.getAccounts = function()
		local accounts = {}

		for i=1, #Config.Accounts do
			if Config.Accounts[i] == 'bank' then

				table.insert(accounts, {
					name  = 'bank',
					money = self.get('bank'),
					label = Config.AccountLabels.bank
				})

			else

				for i2=1, #self.accounts do
					if self.accounts[i2].name == Config.Accounts[i] then
						table.insert(accounts, self.accounts[i2])
					end
				end

			end
		end

		return accounts
	end

	self.getAccount = function(a)
		if a == 'bank' then
			return {
				name  = 'bank',
				money = self.get('bank'),
				label = Config.AccountLabels['bank']
			}
		end

		for i=1, #self.accounts, 1 do
			if self.accounts[i].name == a then
				return self.accounts[i]
			end
		end
	end

	self.getInventory = function()
		return self.inventory
	end

	self.getJob = function()
		return self.job
	end

	self.getLoadout = function()
		return self.loadout
	end

	self.getName = function()
		return self.name
	end

	self.setName = function(newName)
		self.name = newName
	end

	self.getLastPosition = function()
		if self.lastPosition and self.lastPosition.x and self.lastPosition.y and self.lastPosition.z then
			self.lastPosition.x = ESX.Math.Round(self.lastPosition.x, 1)
			self.lastPosition.y = ESX.Math.Round(self.lastPosition.y, 1)
			self.lastPosition.z = ESX.Math.Round(self.lastPosition.z, 1)
		end

		return self.lastPosition
	end

	self.setLastPosition = function(position)
		self.lastPosition = position
	end

	self.getMissingAccounts = function(cb)
		MySQL.Async.fetchAll('SELECT * FROM `user_accounts` WHERE `identifier` = @identifier', {
			['@identifier'] = self.getIdentifier()
		}, function(result)
			local missingAccounts = {}

			for i=1, #Config.Accounts do
				if Config.Accounts[i] ~= 'bank' then
					local found = false

					for i2=1, #result do
						if Config.Accounts[i] == result[i2].name then
							found = true
							break
						end
					end

					if not found then
						table.insert(missingAccounts, Config.Accounts[i])
					end
				end
			end

			cb(missingAccounts)
		end)
	end

	self.createAccounts = function(missingAccounts, cb)
		for i=1, #missingAccounts do
			MySQL.Async.execute('INSERT INTO user_accounts (identifier, name) VALUES (@identifier, @name)', {
				['@identifier'] = self.getIdentifier(),
				['@name']       = missingAccounts[i]
			}, function()
				if cb then
					cb()
				end
			end)
		end
	end

	self.setAccountMoney = function(acc, money, hook)
		if money < 0 then
			print(('es_extended: %s attempted exploiting! (reason: player tried setting -1 account balance)'):format(self.identifier))
			return
		end

		local account   = self.getAccount(acc)
		local prevMoney = account.money
		local newMoney  = ESX.Math.Round(money)
		local diffMoney = math.abs(newMoney - prevMoney)

		if diffMoney >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (%s) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, diffMoney, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif diffMoney >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (%s) (possible exploit)'):format(tostring(hook), self.identifier, diffMoney, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end


		account.money = newMoney

		if acc == 'bank' then
			self.set('bank', newMoney)
		end

		TriggerClientEvent('esx:setAccountMoney', self.source, account)
	end

	self.addAccountMoney = function(acc, money, hook)
		if money < 0 then
			local message = ('es_extended: %s attempted exploiting! (reason: player tried adding -1 account balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
			return
		end

		if money >= 100000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (%s) (HIGHLY LIKELY EXPLOIT)'):format(tostring(hook), self.identifier, money, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif money >= 10000 then
			local message = ('es_extended [%s]: %s added €%.2f to his account (%s) (possible exploit)'):format(tostring(hook), self.identifier, money, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		local account  = self.getAccount(acc)
		local newMoney = account.money + ESX.Math.Round(money)

		account.money = newMoney

		if acc == 'bank' then
			self.set('bank', newMoney)
		end

		TriggerClientEvent('esx:setAccountMoney', self.source, account)
	end

	self.removeAccountMoney = function(acc, money, hook)
		if money < 0 then
			local message = ('es_extended: %s attempted exploiting! (reason: player tried removing -1 account balance)'):format(self.identifier)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
			return
		end

		if money >= 100000 then
			local message = ('es_extended [%s]: %s removed €%.2f from his account (%s)'):format(tostring(hook), self.identifier, money, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		elseif money >= 10000 then
			local message = ('es_extended [%s]: %s removed €%.2f from his account (%s)'):format(tostring(hook), self.identifier, money, acc)
			print(message)
			TriggerEvent('DiscordBot:ToDiscord', 'exploit', self.name .. ' [ID: ' .. self.source .. ']', message, 'user', true, self.source, false)
		end

		local account  = self.getAccount(acc)
		local newMoney = account.money - ESX.Math.Round(money)

		account.money = newMoney

		if acc == 'bank' then
			self.set('bank', newMoney)
		end

		TriggerClientEvent('esx:setAccountMoney', self.source, account)
	end

	self.getInventoryItem = function(name)
		for i=1, #self.inventory, 1 do
			if self.inventory[i].name == name then
				return self.inventory[i]
			end
		end
	end

	self.addInventoryItem = function(name, count)
		local item     = self.getInventoryItem(name)
		local newCount = item.count + count
		item.count     = newCount

		TriggerEvent('esx:onAddInventoryItem', self.source, item, count)
		TriggerClientEvent('esx:addInventoryItem', self.source, item, count)
	end

	self.removeInventoryItem = function(name, count)
		local item     = self.getInventoryItem(name)
		local newCount = item.count - count
		item.count     = newCount

		TriggerEvent('esx:onRemoveInventoryItem', self.source, item, count)
		TriggerClientEvent('esx:removeInventoryItem', self.source, item, count)
	end

	self.setInventoryItem = function(name, count)
		local item     = self.getInventoryItem(name)
		local oldCount = item.count
		item.count     = count

		if oldCount > item.count  then
			TriggerEvent('esx:onRemoveInventoryItem', self.source, item, oldCount - item.count)
			TriggerClientEvent('esx:removeInventoryItem', self.source, item, oldCount - item.count)
		else
			TriggerEvent('esx:onAddInventoryItem', self.source, item, item.count - oldCount)
			TriggerClientEvent('esx:addInventoryItem', self.source, item, item.count - oldCount)
		end
	end

	self.setJob = function(job, grade)
		grade = tostring(grade)
		local lastJob = json.decode(json.encode(self.job))

		if ESX.DoesJobExist(job, grade) then
			local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

			self.job.id    = jobObject.id
			self.job.name  = jobObject.name
			self.job.label = jobObject.label

			self.job.grade        = tonumber(grade)
			self.job.grade_name   = gradeObject.name
			self.job.grade_label  = gradeObject.label
			self.job.grade_salary = gradeObject.salary

			self.job.skin_male    = {}
			self.job.skin_female  = {}

			if gradeObject.skin_male then
				self.job.skin_male = json.decode(gradeObject.skin_male)
			end

			if gradeObject.skin_female then
				self.job.skin_female = json.decode(gradeObject.skin_female)
			end

			TriggerEvent('esx:setJob', self.source, self.job, lastJob)
			TriggerClientEvent('esx:setJob', self.source, self.job)
		else
			print(('es_extended: ignoring setJob for %s due to job not found!'):format(self.source))
		end
	end

	self.addWeapon = function(weaponName, ammo)
		local weaponLabel = ESX.GetWeaponLabel(weaponName)

		if not self.hasWeapon(weaponName) then
			table.insert(self.loadout, {
				name = weaponName,
				ammo = ammo,
				label = weaponLabel,
				components = {}
			})
		else
			for k,v in pairs(self.loadout) do
				if v.name == weaponName then
					v.ammo = ammo
				end
			end
		end

		TriggerClientEvent('esx:addWeapon', self.source, weaponName, ammo)
		TriggerClientEvent('esx:addInventoryItem', self.source, {label = weaponLabel}, 1)
	end

	self.addWeaponComponent = function(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if self.hasWeaponComponent(weaponName, weaponComponent) then
			return
		end

		table.insert(self.loadout[loadoutNum].components, weaponComponent)

		TriggerClientEvent('esx:addWeaponComponent', self.source, weaponName, weaponComponent)
	end

	self.removeWeapon = function(weaponName, ammo)
		local weaponLabel

		for i=1, #self.loadout do
			if self.loadout[i].name == weaponName then
				weaponLabel = self.loadout[i].label

				for i2=1, #self.loadout[i].components do
					TriggerClientEvent('esx:removeWeaponComponent', self.source, weaponName, self.loadout[i].components[i2])
				end

				table.remove(self.loadout, i)
				break
			end
		end

		if weaponLabel then
			TriggerClientEvent('esx:removeWeapon', self.source, weaponName, ammo)
			TriggerClientEvent('esx:removeInventoryItem', self.source, {label = weaponLabel}, 1)
		end
	end

	self.removeWeaponComponent = function(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if not weapon then
			return
		end

		for i=1, #self.loadout[loadoutNum].components do
			if self.loadout[loadoutNum].components.name == weaponComponent then
				table.remove(self.loadout[loadoutNum].components, i)
				break
			end
		end

		TriggerClientEvent('esx:removeWeaponComponent', self.source, weaponName, weaponComponent)
	end

	self.hasWeaponComponent = function(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if not weapon then
			return false
		end

		for i=1, #weapon.components do
			if weapon.components[i] == weaponComponent then
				return true
			end
		end

		return false
	end

	self.hasWeapon = function(weaponName)
		for i=1, #self.loadout do
			if self.loadout[i].name == weaponName then
				return true
			end
		end

		return false
	end

	self.getWeapon = function(weaponName)
		for i=1, #self.loadout do
			if self.loadout[i].name == weaponName then
				return i, self.loadout[i]
			end
		end

		return nil
	end

	return self
end

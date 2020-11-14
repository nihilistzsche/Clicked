local AceGUI = LibStub("AceGUI-3.0")

local driver
local frame
local editbox

local data

local function GetBasicinfoString()
	local lines = {}

	table.insert(lines, "Version: " .. Clicked.VERSION)
	table.insert(lines, "Race: " .. select(2, UnitRace("player")))
	table.insert(lines, "Level: " .. UnitLevel("player"))
	table.insert(lines, "Class: " .. select(2, UnitClass("player")))

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		do
			local id = GetSpecializationInfo(GetSpecialization())
			table.insert(lines, "Specialization: " .. id)
		end

		do
			local talents = {}

			for tier = 1, MAX_TALENT_TIERS do
				for column = 1, NUM_TALENT_COLUMNS do
					local _, _, _, selected, _, _, _, _, _, _, known = GetTalentInfo(tier, column, 1)

					if selected or known then
						table.insert(talents, tier .. "/" .. column)
					end
				end
			end

			table.insert(lines, "Talents: " .. table.concat(talents, " "))
		end
	end

	table.insert(lines, "Mode: " .. (Clicked.db.profile.options.onKeyDown and "AnyDown" or "AnyUp"))
	table.insert(lines, "")

	table.insert(lines, "Possess Bar: " .. driver:GetAttribute("state-possessbar"))

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		table.insert(lines, "Vehicle: " .. driver:GetAttribute("state-vehicle"))
		table.insert(lines, "Vehicle UI: " .. driver:GetAttribute("state-vehicleui"))
		table.insert(lines, "Pet Battle: " .. driver:GetAttribute("state-petbattle"))
	end

	return table.concat(lines, "\n")
end

local function GetParsedDataString()
	local lines = {}

	for i, command in ipairs(data) do
		if i > 1 then
			table.insert(lines, "")
		end

		table.insert(lines, "----- Loaded binding " .. i .. " -----")
		table.insert(lines, "Keybind: " .. command.keybind)
		table.insert(lines, "Hovercast: " .. tostring(command.hovercast))
		table.insert(lines, "Virtual: " .. tostring(command.virtual))
		table.insert(lines, "Action: " .. command.action)

		if command.identifier ~= nil then
			table.insert(lines, "Identifier: " .. command.identifier)
		end

		if command.data ~= nil then
			local split = { strsplit("\n", command.data) }

			if #split > 0 then
				table.insert(lines, "")
			end

			for _, line in ipairs(split) do
				table.insert(lines, line)
			end
		end
	end

	do
		local first = true

		for _, command in ipairs(data) do
			if not command.hovercast then
				if data[command] ~= nil then
					if first then
						table.insert(lines, "")
						table.insert(lines, "----- Macro Frame Handler attributes -----")
						first = false
					end

					for attribute, value in pairs(data[command]) do
						local split = { strsplit("\n", value) }

						for _, line in ipairs(split) do
							table.insert(lines, attribute .. ": " .. line)
						end
					end
				end
			end
		end
	end

	if data.hovercast ~= nil then
		local first = true

		for attribute, value in pairs(data.hovercast.attributes) do
			if first then
				table.insert(lines, "")
				table.insert(lines, "----- Hovercast attributes -----")
				first = false
			end

			local split = { strsplit("\n", value) }

			for _, line in ipairs(split) do
				table.insert(lines, attribute .. ": " .. line)
			end
		end
	end

	return table.concat(lines, "\n")
end

local function GetRegisteredClickCastFrames()
	local lines = {}

	for _, clickCastFrame in Clicked:IterateClickCastFrames() do
		if clickCastFrame ~= nil and clickCastFrame.GetName ~= nil then
			local name = clickCastFrame:GetName()
			local blacklisted = Clicked:IsFrameBlacklisted(clickCastFrame)

			table.insert(lines, name .. (blacklisted and " (blacklisted)" or ""))
		end
	end

	if #lines > 0 then
		table.insert(lines, 1, "----- Registered unit frames -----")
	end

	return table.concat(lines, "\n")
end

local function UpdateStatusOutputText()
	if frame == nil or not frame:IsVisible() or editbox == nil then
		return
	end

	local text = {}
	table.insert(text, GetBasicinfoString())
	table.insert(text, GetParsedDataString())
	table.insert(text, GetRegisteredClickCastFrames())

	editbox:SetText(table.concat(text, "\n\n"))
end

local function OpenStatusOutput()
	if frame ~= nil and frame:IsVisible() then
		return
	end

	frame = AceGUI:Create("Frame")
	frame:SetTitle("Clicked Data Dump")
	frame:SetLayout("Fill")

	editbox = AceGUI:Create("ClickedReadOnlyMultilineEditBox")
	editbox:SetLabel("")
	frame:AddChild(editbox)

	frame:SetCallback("OnClose", function(widget)
		AceGUI:Release(widget)
	end)

	UpdateStatusOutputText()
end

local function OnBindingProcessorComplete(event, commands)
	data = {}

	for i, command in ipairs(commands) do
		data[i] = command
	end

	if frame ~= nil and frame:IsVisible() then
		UpdateStatusOutputText()
	end
end

local function OnMacroAttributesCreated(event, command, attributes)
	data[command] = attributes

	if frame ~= nil and frame:IsVisible() then
		UpdateStatusOutputText()
	end
end

local function OnHovercastAttributesCreated(event, keybindings, attributes)
	data.hovercast = {
		keybindings = keybindings,
		attributes = attributes
	}

	if frame ~= nil and frame:IsVisible() then
		UpdateStatusOutputText()
	end
end

local function CreateStateDriver(state, condition)
	RegisterStateDriver(driver, state, condition)
	driver:SetAttribute("_onstate-" .. state, [[ self:CallMethod("UpdateStatusOutputText") ]])
end

local module = {
	["Initialize"] = function(self)
		driver = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
		driver:Show()

		CreateStateDriver("possessbar", "[possessbar] enabled; disabled")

		if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
			CreateStateDriver("vehicle", "[@vehicle,exists] enabled; disabled")
			CreateStateDriver("vehicleui", "[vehicleui] enabled; disabled")
			CreateStateDriver("petbattle", "[petbattle] enabled; disabled")
		end

		driver.UpdateStatusOutputText = UpdateStatusOutputText
	end,

	["Register"] = function(self)
		Clicked:RegisterMessage(Clicked.EVENT_BINDING_PROCESSOR_COMPLETE, OnBindingProcessorComplete)
		Clicked:RegisterMessage(Clicked.EVENT_MACRO_ATTRIBUTES_CREATED, OnMacroAttributesCreated)
		Clicked:RegisterMessage(Clicked.EVENT_HOVERCAST_ATTRIBUTES_CREATED, OnHovercastAttributesCreated)
	end,

	["Unregister"] = function(self)
		Clicked:UnregisterMessage(Clicked.EVENT_BINDING_PROCESSOR_COMPLETE)
		Clicked:UnregisterMessage(Clicked.EVENT_MACRO_ATTRIBUTES_CREATED)
		Clicked:UnregisterMessage(Clicked.EVENT_HOVERCAST_ATTRIBUTES_CREATED)
	end,

	["OnChatCommandReceived"] = function(self, args)
		for _, arg in ipairs(args) do
			if arg == "dump" then
				OpenStatusOutput()
				break
			end
		end
	end
}

Clicked:RegisterModule("StatusOutput", module)

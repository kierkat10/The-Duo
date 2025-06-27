--[[
function theduo.pluralize(str, vars)
	local inside = str:match("<(.-)>")
	local _table = {}
	if inside then
		for v in inside:gmatch("[^,]+") do
			table.insert(_table, v)
		end
		local num = vars[tonumber(string.match(str, ">(%d+)") )]
		if type(num) == "string" then
			num = tonumber(num) or 0
		end
		if not num then
			num = 1
		end
		local plural = _table[1]
		local checks = { [1] = "=" }
		local checks1mod = false
		if #_table > 1 then
			for i = 2, #_table do
				local isnum = tonumber(_table[i])
				if isnum then
					if not checks1mod then
						checks[1] = nil
					end
					checks[isnum] = "<" .. (_table[i + 1] or "")
					if isnum == 1 then
						checks1mod = true
					end
					i = i + 1
				elseif i == 2 then
					checks[1] = "=" .. _table[i]
				end
			end
		end
		local function fch(str, c)
			return string.sub(str, 1, 1) == c
		end
		local keys = {}
		for k in pairs(checks) do
			table.insert(keys, k)
		end
		table.sort(keys, function(a, b)
			return a < b
		end)
		for _, k in ipairs(keys) do
			if fch(checks[k], "=") then
				if math.abs(math.abs(num) - k) < 0.001 then
					return string.sub(checks[k], 2, -1)
				end
			elseif fch(checks[k], "<") then
				if math.abs(num) < k - 0.001 then
					return string.sub(checks[k], 2, -1)
				end
			end
		end
		return plural
	end
end
]]--
--[[
Detect out-dated version of Ivanti Connect Secure
Based on the check function from the msf module:
exploit/linux/http/ivanti_connect_secure_rce_cve_2024_21893
--]]

local http = require("http")
local nmap = require("nmap")

portrule = function(host, port)
	local auth_port = { number = 443, protocol = "tcp" }
	local identd = nmap.get_port_state(host, auth_port)

	return identd ~= nil and identd.state == "open" and port.protocol == "tcp" and port.state == "open"
end

function is_ivanti_unpatched(host, port)
	local response = http.get(host.ip, port.number, "/status")

	return string.find(response.body, "Pulse Secure")
end

action = function(host, port)
	if is_ivanti_unpatched(host, port) then
		return "Unpatched"
	else
		return "Unknown"
	end
end

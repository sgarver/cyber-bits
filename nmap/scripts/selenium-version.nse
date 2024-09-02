local http = require("http")
local json = require("json")
local nmap = require("nmap")
local oops = require("oops")
local shortport = require("shortport")
local stdnse = require("stdnse")
local table = require("table")

portrule = function(host, port)
  local auth_port = { number = 4444, protocol = "tcp" }
  local identd = nmap.get_port_state(host, auth_port)

  return identd ~= nil and identd.state == "open" and port.protocol == "tcp" and port.state == "open"
end

function get_selenium_version(host, port)
  local response = http.get(host.ip, port.number, "/status")
  local status, body = json.parse(response.body)

  for key, val in pairs(body.value.nodes) do
    return val.version
  end

  return status
end

action = function(host, port)
  local version = get_selenium_version(host, port)

  if version then
    return version
  end

  return nil
end

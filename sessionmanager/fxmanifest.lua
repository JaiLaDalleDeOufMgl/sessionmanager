fx_version 'adamant'
games { 'gta5', 'rdr3' }

server_script 'MySQL/mysql-async.js'
client_script 'MySQL/mysql-async-client.lua'

client_scripts {
    'base/shared/*.lua',
    'base/client/*.lua',
}

server_scripts {
    'MySQL/lib/MySQL.lua',
    'base/shared/*.lua',
    'base/server/*.lua',
}

exports {
	'GetCore'
}

server_exports {
    'GetCore',
    "getCurrentGameType",
    "getCurrentMap",
    "changeGameType",
    "changeMap",
    "doesMapSupportGameType",
    "getMaps",
    "roundEnded"
}

resource_type 'gametype' { name = 'SN Framework' }
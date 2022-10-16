
fx_version 'cerulean'

author 'KevinGirardx'

game 'gta5'

shared_script {
	'config.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
}

lua54 'yes'

escrow_ignore { 
    'client/*.lua',
    'server/*.lua',
    'config.lua',
}
fx_version 'adamant'
games { 'gta5' }

author 'Musiker15'
description 'ESX Armor'
version '1.0'

shared_script {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
}

client_scripts {
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

dependencies {
	'mysql-async',
	'es_extended'
}
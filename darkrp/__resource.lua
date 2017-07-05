-- Manifest
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'DarkRP by Zuqaa'

ui_page 'ui/ui.html'

-- NUI Files
files {
	'ui/ui.html',
	'ui/pdown.ttf'
}

-- Server
server_script 'config/config.lua'
server_script 'server/classes/player.lua'
server_script 'server/classes/groups.lua'
server_script 'server/player/login.lua'
server_script 'server/load_gamemode.lua'
server_script 'server/server.lua'
server_script 'server/main.lua'
server_script 'server/util.lua'
server_script 'server/name.lua'

-- Modules Script
client_script 'modules/carwash/carwash_server.lua'
client_script 'modules/jobs/police/police-menu.lua'
client_script "modules/jobs/jobs-legal/jobslegal_client.lua"
client_script "modules/jobs/jobs-legal/pooljob_client.lua"
client_script "modules/jobs/jobs-legal/trashjob_client.lua"
client_script "modules/jobs/jobs-legal/trucker_client.lua"
client_script "modules/jobs/jobs-legal/mine_jobs.lua"
client_script "modules/jobs/jobs-legal/morg_client.lua"
client_script "modules/jobs/jobs-legal/org_client.lua"
server_script "modules/jobs/sv_jobs.lua"
server_script "modules/jobs/jobs-legal/jobslegal_server.lua"
server_script "modules/jobs/jobs-legal/morg_server.lua"

-- Client
client_script 'config/config.lua'
client_script 'modules/carwash/carwash_client.lua'
client_script 'client/main.lua'
client_script 'client/client.lua'
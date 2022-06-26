local M = {}

function M.install_missing(servers)
	local lspi_servers = require("nvim-lsp-installer.servers")

	for server, _ in pairs(servers) do
		local ok, s = lspi_servers.get_server(server)
		if ok then
			if not s:is_installed() then
				s:install()
			end
		else
			log("Server " .. server .. "not found")
		end
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
function M.setup(servers, options)
	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(function(server)
		local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})

		server:setup(opts)
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
	M.install_missing(servers)
end

return M

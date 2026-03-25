-- universal lsp configs
-- vim.lsp.config("*", {
--   on_attach = function(_, _)
--     vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
--     vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--     vim.keymap.set("n", "<leader>hi", vim.lsp.buf.hover, {})
--     vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--     vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
--   end,
-- })

-- enabling lsps

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local telescope = require('telescope.builtin')

  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, opts)
  vim.keymap.set("n", "<leader>hi", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rf", telescope.lsp_references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    on_attach(client, ev.buf)
  end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")


local servers = require("user.servers")
for _, server in ipairs(servers) do
  vim.lsp.enable(server, true)
  lspconfig[server].setup({ capabilities = capabilities })
end


local schema_status_ok, schemastore = pcall(require, "schemastore")
if not schema_status_ok then
	return
end

-- https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
return {
	settings = {
		json = {
			schemas = schemastore.json.schemas({
				select = {
					"dependabot-v2.json",
					"docker-compose.yml",
					".eslintrc",
					"GitHub Workflow",
					-- "GitHub Action",
					"Helm Chart.yaml",
					"Packer",
					"package.json",
					"prettierrc.json",
					"Swagger API 2.0",
					"tsconfig.json",
				},
			}),
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}

local function safe_require(module)
    local success, err = pcall(require, module)
    if not success then
        vim.notify("Error loading " .. module .. "\n" .. err, vim.log.levels.ERROR)
    end
end

safe_require("config.lazy")
safe_require("config.options")
safe_require("config.keymaps")
safe_require("config.autocmds")

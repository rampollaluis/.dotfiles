-- ~/.config/nvim/lua/myplugin/init.lua
local M = {}

local debug_on = false
local function debug(message)
    if (debug_on) then
        print(message)
    end
end

local function getFileType(buffPath)
    local html = ".component.html"
    local isHtml = buffPath:sub(- #html) == html

    local css = ".component.scss"
    local isCss = buffPath:sub(- #css) == css

    local ts = ".component.ts"
    local isTs = buffPath:sub(- #ts) == ts

    local spec = ".component.spec.ts"
    local isSpec = buffPath:sub(- #spec) == spec

    -- Check if buffer_name ends with the specific string
    if isHtml then
        debug("In html of angular component. Moving to .ts")
        return html
    elseif isCss then
        debug("In css of angular component. Moving to .ts")
        return css
    elseif isTs then
        debug("In ts of angular component. Moving to .ts")
        return ts
    elseif isSpec then
        debug("In spec of angular component. Moving to .ts")
        return spec
    else
        print("You don't seem to be in an angular component")
        return ""
    end
end

local function attachOrOpenBuffer(buffPath)
    -- Find the buffer number for the file path
    local buf_num = vim.fn.bufnr(buffPath)

    -- Check if the buffer exists
    if buf_num ~= -1 then
        -- Set the buffer as the current one
        debug("attaching to buffer")
        vim.api.nvim_set_current_buf(buf_num)
    else
        -- If the buffer is not loaded, use :edit to load it
        debug("opening buffer")
        vim.api.nvim_command('edit ' .. buffPath)
    end
end

local function jumpToExt(ext)
    local fileName = vim.api.nvim_buf_get_name(0)
    debug("Current file name: " .. fileName)

    local fileType = getFileType(fileName)

    if (fileType == "") then
        return
    end

    local target = string.sub(fileName, 0, #fileName - #fileType) .. ext
    debug(target)

    attachOrOpenBuffer(target)
end

M.jump_to_html = function()
    jumpToExt(".component.html")
end

M.jump_to_css = function()
    jumpToExt(".component.scss")
end

M.jump_to_ts = function()
    jumpToExt(".component.ts")
end

M.jump_to_spec = function()
    jumpToExt(".component.spec.ts")
end

return M

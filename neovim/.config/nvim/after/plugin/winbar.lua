if vim.fn.has("nvim-0.8.0") == 1 then

    local get_file_name = function()
        local filename, extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
        local icon, color = require('nvim-web-devicons').get_icon_color(filename, extension)
        return '%m ' ..  icon .. ' %f' 
    end

    local get_location = function()
        local navic = require'nvim-navic'
        if (navic.is_available())
        then
            return " " .. navic.get_location()
        else
            return ""
        end

    end

    function win_bar()
        return table.concat {
            '%#Underlined#',
            '%=',
            get_file_name(),
            get_location(),
        }
    end

    vim.o.winbar = "%!luaeval('win_bar()')"
end

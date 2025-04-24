require("bufferline").setup{
    options = {
        close_command = function(bufnum)
            require('mini.bufremove').delete(bufnum, false)
        end,
    }
}

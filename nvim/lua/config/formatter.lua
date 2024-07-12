local formatter = require("formatter")

formatter.setup {
    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
    }
}


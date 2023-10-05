return {
  'ThePrimeagen/harpoon',
  keys = {
    { "<leader>jm", function() require("harpoon.mark").add_file() end, desc = "Mark file in Harpoon" },
    { "<leader>j<space>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Open Harpoon quick menu" },
    { "<leader>jp", function() require("harpoon.ui").nav_prev() end, desc = "Navigate to previous Harpoon mark" },
    { "<leader>jn", function() require("harpoon.ui").nav_next() end, desc = "Navigate to next Harpoon mark" },
    { "<leader>jf", function() require("harpoon.ui").nav_file(1) end, desc = "Navigate to Harpoon file 1" },
    { "<leader>jg", function() require("harpoon.ui").nav_file(2) end, desc = "Navigate to Harpoon file 2" },
    { "<leader>jh", function() require("harpoon.ui").nav_file(3) end, desc = "Navigate to Harpoon file 3" },
    { "<leader>jj", function() require("harpoon.ui").nav_file(4) end, desc = "Navigate to Harpoon file 4" },
  }
}


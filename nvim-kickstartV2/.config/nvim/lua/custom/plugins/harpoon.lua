return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "harpoon add file",
		},
		{
			"<leader>hs",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "harpoon show menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "harpoon file 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "harpoon file 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "harpoon file 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "harpoon file 4",
		},
		{
			"<leader>h5",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "harpoon file 5",
		},
	},
}

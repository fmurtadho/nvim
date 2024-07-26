return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
  config = function ()
    require("bufferline").setup{
      options = {
        offsets = {
          separator = true,
          highlight = 'Directory',
          text = 'File Explorer',
          filetype = 'Neotree'
        }
      }
    }
  end
}

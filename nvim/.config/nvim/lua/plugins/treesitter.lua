return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    config = function()
      require'nvim-treesitter'.setup {
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true }
      }
      require'nvim-treesitter'.install { 'lua', 'tsx', 'vim', 'typescript', 'python', 'javascript' }
    end
  }
}

return {
    'nvim-tree/nvim-web-devicons',
    config = function()
        require('nvim-web-devicons').setup({
            default = true, -- Garante que um ícone padrão apareça se o arquivo for desconhecido
        })
    end
}


{ pkgs, config, ... }:
let
  plugins = {
    neo-tree = import ./plugins/neo-tree.nix { inherit pkgs; };
    alpha-nvim = import ./plugins/alpha-nvim.nix { inherit pkgs; };
    plenary-nvim = import ./plugins/plenary-nvim.nix { inherit pkgs; };
    telescope-nvim = import ./plugins/telescope-nvim.nix { inherit pkgs; };
    vim-fugitive = import ./plugins/vim-fugitive.nix { inherit pkgs; };
    null-ls = import ./plugins/null-ls.nix { inherit pkgs; };
  };
in
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
            set notermguicolors
            colorscheme default
            set number

            nnoremap <C-n> :Neotree toggle<CR>

            autocmd BufWritePre *.nix,*.rs,*.js,*.json,*.ts,*.tsx,*.css,*.html,*.lua,*.py,*.go,*.md lua vim.lsp.buf.format()

            highlight DashboardHeader guifg=#00ff00
            
            nnoremap <leader>ga :Git add .<CR>
            nnoremap <leader>gc :Git commit<CR>
            nnoremap <leader>gp :Git push<CR>
            nnoremap <leader>gs :Git status<CR>
      	'';

    plugins = [
      plugins.neo-tree
      plugins.alpha-nvim
      plugins.plenary-nvim
      plugins.telescope-nvim
      plugins.vim-fugitive
      plugins.null-ls
    ];
  };
}

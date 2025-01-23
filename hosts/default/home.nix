{
  config,
  pkgs,
  inputs,
  ...
}:

let
  allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "lysec";
  home.homeDirectory = "/home/lysec";

  imports = [
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/hyprlock.nix
    ../../modules/desktop/waybar.nix
    ../../modules/desktop/swaync.nix

    ../../modules/programs/nvim/neovim.nix
    ../../modules/programs/spicetify.nix
    ../../modules/programs/vscode.nix
    ../../modules/programs/ghostty.nix
    ../../modules/programs/fastfetch.nix

    inputs.hyprland.homeManagerModules.default
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.stateVersion = "24.11";

  home.packages = allPackages;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}

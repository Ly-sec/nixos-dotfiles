{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
      ];
    };

    # Add Home Manager configuration for the 'lysec' user
    homeConfigurations.lysec = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";  # Use legacyPackages for Home Manager compatibility
      modules = [ ./hosts/default/home.nix ];  # Path to the home.nix configuration for `lysec`

      extraSpecialArgs = { inherit inputs; };  # Pass the inputs to Home Manager
    };
  };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      vbox-desktop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
	  ./hosts/vbox/configuration.nix
	  ./modules/desktop/configuration.nix
	];
      };
    };
    homeConfigurations = {
      desktop = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
	  system = "x86_64-linux";
	  config.allowUnfree = true;
        };
	extraSpecialArgs = { inherit inputs; };
	modules = [
          ./modules/desktop/home.nix
	];
      };
    };
  };
}

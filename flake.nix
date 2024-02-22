{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
  };
  }

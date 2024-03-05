{ lib, buildGoModule, fetchFromGitHub, lazygit, testers }:

buildGoModule rec {
  pname = "lazygit";
  version = "8d9e5d1";

  src = fetchFromGitHub {
    owner = "jesseduffield";
    repo = pname;
    rev = "8d9e5d1258a998e60b46686e33fe36f76ce01733";
    hash = "sha256-j6eNGa+YyUPK4GL8B5baDRsF5iM+imGgQhJnHkPEYq4=";
  };

  vendorHash = null;
  subPackages = [ "." ];

  ldflags = [ "-X main.version=HEAD-${version}" "-X main.buildSource=nix" ];

  passthru.tests.version = testers.testVersion {
    package = lazygit;
  };

  meta = with lib; {
    description = "Simple terminal UI for git commands";
    homepage = "https://github.com/jesseduffield/lazygit";
    license = licenses.mit;
    mainProgram = "lazygit";
  };
}

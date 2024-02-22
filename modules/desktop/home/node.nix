{ pkgs, ... }: {
  home.packages = with pkgs; [
    volta
    typescript
    corepack
    turbo
    nodePackages.typescript-language-server
    nodePackages.pnpm
    nodePackages.np
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    volta
    typescript
    corepack
    turbo
    nodePackages.pnpm
    nodePackages.np
  ];
}

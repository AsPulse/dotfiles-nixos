{ pkgs, ... }: {
  home.packages = with pkgs; [
    rust-bin.stable.latest.default
    tokio-console
    cargo-about
    cargo-insta
    cargo-expand
    cargo-cross
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    (vivaldi.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--gtk-version=4"
      ];
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    (chromium.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--gtk-version=4"
      ];
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    (vivaldi.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
  ];
}

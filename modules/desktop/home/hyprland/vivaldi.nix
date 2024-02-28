{ pkgs, ... }: {
  home.packages = with pkgs; [
    (vivaldi.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--gtk-version=4"
        "--enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseSkiaRenderer"
        "--enable-gpu-rasterization"
        "--enable-skia-renderer"
        "--canvas-oop-rasterization"
        "--disable-gpu-driver-bug-workarounds"
        "--enable-zero-copy"
        "--ignore-gpu-blocklist"
        "--use-vulkan"
        "--enable-quic"
        "--enable-tls13-early-data"
      ];
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
    (chromium.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
  ];
}

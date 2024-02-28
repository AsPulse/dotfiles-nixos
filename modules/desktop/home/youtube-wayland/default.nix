{ stdenv, makeDesktopItem, copyDesktopItems }: stdenv.mkDerivation rec {
  pname = "youtube-wayland";
  version = "0.1.0";
  dontUnpack = true;
  nativeBuildInputs = [
    copyDesktopItems
  ];
  desktopItems = [
    (makeDesktopItem {
      name = "youtube-wayland";
      exec = "vivaldi --app-id=agimnkijcaahngcdmfeangaknmldooml";
      desktopName = "YouTube (wayland)";
    })
  ];
  installPhase = "copyDesktopItems";
}

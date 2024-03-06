{ stdenv, makeDesktopItem, copyDesktopItems }: stdenv.mkDerivation rec {
  pname = "discord-browser";
  version = "0.1.0";
  dontUnpack = true;
  nativeBuildInputs = [
    copyDesktopItems
  ];
  desktopItems = [
    (makeDesktopItem {
      name = "discord-browser";
      exec = "vivaldi --app=https://discord.com/channels/@me --user-data-dir=/home/aspulse/.vivaldiprofiles/discord-ptb";
      desktopName = "Discord (browser)";
    })
  ];
  installPhase = "copyDesktopItems";
}

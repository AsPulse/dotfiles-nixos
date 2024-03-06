{ stdenv, makeDesktopItem, copyDesktopItems }: stdenv.mkDerivation rec {
  pname = "cookieclicker-browser";
  version = "0.1.0";
  dontUnpack = true;
  nativeBuildInputs = [
    copyDesktopItems
  ];
  desktopItems = [
    (makeDesktopItem {
      name = "cookieclicker-browser";
      exec = "vivaldi --app=https://orteil.dashnet.org/cookieclicker --user-data-dir=/home/aspulse/.vivaldiprofiles/cookieclicker";
      desktopName = "Cookie Clicker (browser)";
    })
  ];
  installPhase = "copyDesktopItems";
}

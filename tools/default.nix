{stdenv, lib, pkgs, ...}:

stdenv.mkDerivation rec {
  name = "tools-scripts";
  srcs = ./scripts;

  unpackPhase = ":";
  buildPhase = ":";
  installPhase = ''
    mkdir -p $out/bin
    cp $srcs/wrconnect.sh $out/bin/wrconnect
    chmod +x $out/bin/wrconnect

    echo "[done] Intallation"
    '';
}

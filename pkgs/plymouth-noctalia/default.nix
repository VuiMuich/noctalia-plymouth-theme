{ stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "plymouth-noctalia";
  version = "0.1.0";
  src = ./.;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    dir=$out/share/plymouth/themes/noctalia
    mkdir -p $dir
    cp animation-*.png noctalia.script noctalia.plymouth $dir/
    runHook postInstall
  '';
}

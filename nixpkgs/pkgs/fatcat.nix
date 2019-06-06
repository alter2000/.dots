{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  name = "fatcat-${version}";
  version = "git-2019-05-29";

  src = fetchFromGitHub {
    owner  = "Gregwar";
    repo   = "fatcat";
    rev    = "839090b94f18b068e5e5c3c9c2dc573f1460af56";
    sha256 = "1qrb5vx0y79ygrb5bslmxxy1ablbyylnvxq270rz03gk7p9nyiyg";
  };

  buildInputs = [ cmake ];
}

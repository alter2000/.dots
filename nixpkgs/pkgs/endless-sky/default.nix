{ stdenv, fetchFromGitHub
, SDL2, libpng, libjpeg, glew, openal, scons, libmad
}:

stdenv.mkDerivation rec {
  pname = "endless-sky";
  version = "0.9.9";

  src = fetchFromGitHub {
    owner = "endless-sky";
    repo = "endless-sky";
    rev = "v${version}";
    sha256 = "1dqgr1b6rj520yria8c85iq6ddqg5g729gfs9iv17dy7wxdvrwh8";
  };

  enableParallelBuilding = true;

  buildInputs = [
    SDL2 libpng libjpeg glew openal scons libmad
  ];

  prefixKey = "PREFIX=";

  patches = [
    ./fixes.patch
  ];

  meta = with stdenv.lib; {
    description = "A sandbox-style space exploration game similar to Elite, Escape Velocity, or Star Control";
    homepage = https://endless-sky.github.io/;
    license = with licenses; [
      gpl3Plus cc-by-sa-30 cc-by-sa-40 publicDomain
    ];
    maintainers = with maintainers; [ lheckemann ];
    platforms = platforms.linux; # Maybe other non-darwin Unix
  };
}

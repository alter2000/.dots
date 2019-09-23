self: super:

{
  self.kubernetes-helm.overrideAttrs (old: rec {
    version = "2.14.3";
    name = "helm-${version}";
    src = super.fetchFromGitHub {
      owner = "helm";
      repo = "helm";
      rev = "v${version}";
      sha256 = "18ly31db2kxybjlisz8dfz3cdxs7j2wsh4rx5lwhbm5hpp42h17d";
    };
    goDeps = ./helmDeps.nix;
  })
}

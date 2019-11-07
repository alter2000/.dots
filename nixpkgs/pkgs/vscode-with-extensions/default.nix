self: super:

self.vscode-with-extensions.override {
  vscodeExtensions = with super.vscode-extensions; [
    vscodevim.vim
  ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vsliveshare";
      publisher = "ms-vsliveshare";
      version = "1.0.1123";
      sha256 = "1qizisw78wlzf40npqvfn5aqpmrypga0zxgs6cslyaymq154gf3p";
    } {
      name = "go";
      publisher = "ms-vscode";
      version = "0.11.9";
      sha256 = "1fjnhwwl7yv6q5ynvasr1n8myjjl9s6lvw7dcvdirwyn05zzsl6d";
    } {
      name = "vscode-docker";
      publisher = "ms-azuretools";
      version = "0.8.2";
      sha256 = "01h922xspvb8pbnpgfxv6x0sphaaxk08rnl7b0fqxfw6jnj184f2";
    } {
      name = "ayu";
      publisher = "teabyii";
      version = "0.18.0";
      sha256 = "1rh2ms1ldfkb2289jsckj6v1ca1bc3956f0n5knk2pjyzxy5g148";
    } {
      name = "agila-theme";
      publisher = "whtsky";
      version = "2.0.2";
      sha256 = "11i51k8lifwb72w88yfhll03kdhkj4xyawi6cqrn25llx1wfk8gl";
    }];
}

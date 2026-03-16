{pkgs, ...}: {
  formatter.conform-nvim = {
    enable = true;
    setupOpts = {
      formatters = {
        clang_format = {
          command = "clang-format";
          args = [
            "--style={IndentWidth: 4, TabWidth: 4}"
          ];
        };
        java_format = {
          command = "google-java-format";
          args = ["--aosp" "-"];
        };
      };
      formatters_by_ft = {
        c = ["clang_format"];
        nix = ["alejandra"];
        lua = ["stylua"];
        bash = ["shfmt"];
        rust = ["rustfmt"];
        java = ["java_format"];
      };
    };
  };
  extraPackages = with pkgs; [
    alejandra # nix
    clang-tools #c/c++
    stylua # lua
    shfmt # bash
    rustfmt # rust
    google-java-format
  ];
}

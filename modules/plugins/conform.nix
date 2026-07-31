{ pkgs, ... }:
{
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
          args = [
            "--aosp"
            "-"
          ];
        };
      };
      formatters_by_ft = {
        c = [ "clang_format" ];
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        bash = [ "shfmt" ];
        rust = [ "rustfmt" ];
        java = [ "java_format" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        css = [ "prettier" ];
        html = [ "superhtml" ];
      };
    };
  };
  extraPackages = with pkgs; [
    nixfmt # nix
    clang-tools # c/c++
    stylua # lua
    shfmt # bash
    rustfmt # rust
    google-java-format # java
    prettier # javascript/typescript
    superhtml
  ];
}

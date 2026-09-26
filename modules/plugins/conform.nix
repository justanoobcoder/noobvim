{ pkgs, ... }:
{
  formatter.conform-nvim = {
    enable = true;
    setupOpts = {
      formatters = {
        java_format = {
          command = "google-java-format";
          args = [
            "--aosp"
            "-"
          ];
        };
        toml_format = {
          command = "taplo";
          args = [
            "fmt"
            "-"
          ];
        };
      };
      formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        bash = [ "shfmt" ];
        rust = [ "rustfmt" ];
        java = [ "java_format" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        css = [ "prettier" ];
        html = [ "superhtml" ];
        toml = [ "toml_format" ];
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
    taplo
  ];
}

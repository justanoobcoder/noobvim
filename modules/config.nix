{
  globals.mapleader = " ";
  hideSearchHighlight = true;
  syntaxHighlighting = true;
  clipboard = {
    enable = true;
    registers = "unnamedplus";
    providers.wl-copy.enable = true;
  };
  additionalRuntimePaths = [
    "$HOME/.config/noobvim/runtime"
  ];
}

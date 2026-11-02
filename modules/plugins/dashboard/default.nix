{ lib, ... }:
let
  # Pad descriptions so the keys line up in a column
  button = icon: desc: key: action: {
    inherit icon key action;
    desc = desc + lib.strings.replicate (43 - lib.stringLength desc) " ";
    key_format = "  » %s «";
  };
in
{
  vim.dashboard.dashboard-nvim = {
    enable = true;
    setupOpts = {
      theme = "doom";
      config = {
        header = lib.splitString "\n" (lib.removeSuffix "\n" (builtins.readFile ./header.txt));
        center = [
          (button " " "New File" "n" "enew | startinsert")
          (button " " "Find File" "f" "Telescope find_files")
          (button " " "Find Text" "g" "Telescope live_grep")
          (button " " "Restore Session" "s" "Persisted load")
          (button " " "Quit" "q" "qa!")
        ];
        footer = [
          "\"It works on my machine.\""
          "\t\t\t— Famous last words"
        ];
      };
    };
  };
}

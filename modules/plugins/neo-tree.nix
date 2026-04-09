{
  filetree.neo-tree = {
    enable = true;
    setupOpts = {
      sources = ["filesystem" "buffers" "git_status"];
      open_files_do_not_replace_types = ["terminal" "Trouble" "trouble" "qf" "Outline"];
      filesystem = {
        bind_to_cwd = false;
        follow_current_file = {
          enabled = true;
        };
        use_libuv_file_watcher = true;
        filtered_items = {
          visible = false;
          hide_dotfiles = true;
          hide_gitignored = true;
          hide_ignored = true;
          hide_by_pattern = [
            "*.freezed.dart"
            "*.g.dart"
          ];
        };
      };
      close_if_last_window = false;
    };
  };
}

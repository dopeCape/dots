# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/workflow/projects/TerminalSeductions"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "money_maker"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd  "nvim"


  new_window "runner"
  # run_cmd "export NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:$NIX_PATH"
  #
  # run_cmd "nix-shell ."
  # split_v 10 
  # run_cmd "nix-shell -p redis"
  # run_cmd "redis-server"
  # balance_windows_horizontal
  split_h 50
  run_cmd "ls"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

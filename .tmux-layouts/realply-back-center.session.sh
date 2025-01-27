# Must be called before `initialize_session`.

session_root "~/workflow/mym/realply/backend-realply/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "realply-backend"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd  "nvim"
  
  new_window "runner"
  run_cmd "nix-shell ."
  run_cmd "bun run dev"
  # split_v 10 
  # run_cmd "nix-shell -p redis"
  # run_cmd "redis-server"
  # balance_windows_horizontal
  split_h 50
  run_cmd "ls"

  # Load a defined window layout.

  # Select the default active window on session creation.

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

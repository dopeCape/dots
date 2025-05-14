
session_root "~/workflow/projects/merger"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "merger"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd  "nvim"
  new_window "runner-core"
  run_cmd "cd apps/core/ "
  run_cmd "nix-shell . "
  run_cmd "start-detached "
  run_cmd "make api"
  split_h 50
  run_cmd "cd apps/core/ "
  run_cmd "make queue"
  split_v 30
  run_cmd "cd apps/core/"
  new_window "runner-dashboard"
  run_cmd "cd apps/dashboard/"
  run_cmd "nr"
  split_h 50
  run_cmd "cd apps/dashboard/"
  run_cmd "ls"
  split_v 50
  run_cmd "cd packages/sdk/"

  # Load a defined window layout.

  # Select the default active window on session creation.

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

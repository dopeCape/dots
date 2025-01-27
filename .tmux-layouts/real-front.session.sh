
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.

session_root "~/workflow/mym/realply/frontend/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "real-front"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd  "nvim"
  
  new_window "runner"
  run_cmd "npm run dev"
  split_h 50

  # Load a defined window layout.

  # Select the default active window on session creation.

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

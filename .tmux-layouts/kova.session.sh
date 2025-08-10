
session_root "~/workflow/projects/kova"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "kova"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd  "nvim"
  new_window "terminal"
  run_cmd "cd apps/web"
  run_cmd "clear"
  split_h 50
  run_cmd "cd apps/core"
  run_cmd "clear"
  new_window "proc"
  run_cmd "nr"
  split_h 50
  run_cmd "docker compose up"
fi

finalize_and_go_to_session

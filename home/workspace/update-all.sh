#!/bin/zsh
# Concurrently update all git repositories that are subdirectories of the current directory

echo "Updating all git repositories in $(pwd)"

pids=()

color() {
  local text="$1"
  local color_code="$2"
  echo "\033[${color_code}m${text}\033[0m"
}

for dir in */; do
  if [ -d "$dir/.git" ]; then
    (
      cd "$dir"
      git pull > /dev/null 2>&1
      if [ $? -eq 0 ]; then
        update_status=$(color "Success" 32)
      else
        update_status=$(color "Failed" 31)
      fi

      echo "$dir $(color "$(git rev-parse --abbrev-ref HEAD)" 33) $update_status"
    ) &
    pids+=($!)
  fi
done

for pid in "${pids[@]}"; do
  wait "$pid"
done

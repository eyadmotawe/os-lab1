if (( $# < 2 )); then
  echo "missing parameter"
  exit 1
fi

dir="$1"
malicious_dir="$2"

has_files=0
for f in "$malicious_dir"/*; do
  if [[ -f "$f" ]]; then
    has_files=1
    break
  fi
done

if [[ $has_files -eq 0 ]]; then
  echo "No malicious files to review."
  exit 0
fi

while [[ true ]]; do
    arr=()
    for f in "$malicious_dir"/*; do
      if [[ -f "$f" ]]; then
        arr+=("f")
      fi
    done

  echo "Quarantined files:"
  i=1
  for f in "${arr[@]}"; do
    echo "$i: ${f}"
    i=$((i + 1))
    done

  read "chose file to operate on: " ch

  if (( ch < 1 || ch > "${#arr[@]}" )); then
    echo "Invalid option!"
    exit 1
  fi

  chosen_file="${files[$((ch - 1))]}"
  filename="$chosen_file"

  echo "Options for $filename:"
  echo "1: Restore this file back into dir"
  echo "2: Permanently delete this file from malicious_dir"
  echo "3: Leave this file as-is and go back to the list"

  read -p "Input: " option

done
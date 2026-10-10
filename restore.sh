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

done
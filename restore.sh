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
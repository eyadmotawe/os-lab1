if (( $# < 2 )); then
  echo "missing parameter"
  exit 1
fi

dir="$1"
malicious_dir="$2"


read dir malicious_dir interval_secs

if (( $# < 3)) then
  echo "missing parameter"
  exit 1
fi

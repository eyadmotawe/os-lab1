read dir malicious_dir interval_secs

if (( $# < 3)); then
  echo "missing parameter"
  exit 1
fi

ls -l "$dir" > "$directory_info_last"

while [[ true ]]; do
  ls -l "$dir" > "$directory_info_new"
  diff "$directory_info_last" "$directory_info_new"
    if [ $? -eq 0 ]; then

        sleep "$interval_secs"
        continue
      else
        :
      fi
  cp directory_info_new directory_info_last
  sleep "$interval_secs"
done

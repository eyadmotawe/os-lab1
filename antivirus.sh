read dir malicious_dir interval_secs

if (( $# < 3)); then
  echo "missing parameter"
  exit 1
fi
directory_info_last="directory_info.last"
directory_info_new="directory_info.new"

ls -l "$dir" > "$directory_info_last"

while [[ true ]]; do
  ls -l "$dir" > "$directory_info_new"
  diff "$directory_info_last" "$directory_info_new"
    if [ $? -eq 0 ]; then

        sleep "$interval_secs"
        continue
      else
        for file in $dir; do
          for line in $file; do
            :
            :
          done
        done
      fi
  cp "$directory_info_new" "$directory_info_last"
  sleep "$interval_secs"
done

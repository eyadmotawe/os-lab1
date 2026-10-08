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
        for file in "$dir"/*; do
          grep -qi "virus" "$file"
          if [ $? -eq 0 ]; then
            mv "$file" "$malicious_dir"
            continue
          fi

          grep -qi "trojan" "$file"
            if [ $? -eq 0 ]; then
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "malware" "$file"
            if [ $? -eq 0 ]; then
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "worm" "$file"
            if [ $? -eq 0 ]; then
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "ransomware" "$file"
            if [ $? -eq 0 ]; then
              mv "$file" "$malicious_dir"
              continue
            fi
          if [[ $file == *.exe ]]; then
            mv "$file" "$malicious_dir"
          fi
          if [[ $file == *.bat ]]; then
            mv "$file" "$malicious_dir"
          fi
          if [[ $file == *.vbs ]]; then
            mv "$file" "$malicious_dir"
          fi
          if [[ $file == *.scr ]]; then
            mv "$file" "$malicious_dir"
          fi
          if [[ $file == *.ps1 ]]; then
            mv "$file" "$malicious_dir"
          fi
        done
      fi
  cp "$directory_info_new" "$directory_info_last"
  sleep "$interval_secs"
done

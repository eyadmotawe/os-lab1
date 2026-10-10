if (( $# < 3)); then
  echo "missing parameter"
  exit 1
fi

dir="$1"
malicious_dir="$2"
interval_secs="$3"

directory_info_last="directory_info.last"
directory_info_new="directory_info.new"

for file in "$dir"/*; do
  grep -qi "virus" "$file"
  if [[ $? -eq 0 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  grep -qi "trojan" "$file"
  if [[ $? -eq 0 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  grep -qi "malware" "$file"
  if [[ $? -eq 0 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  grep -qi "worm" "$file"
  if [[ $? -eq 0 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  grep -qi "ransomware" "$file"
  if [[ $? -eq 0 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  if [[ "$file" == *.exe ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  if [[ "$file" == *.bat ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  if [[ "$file" == *.vbs ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  if [[ "$file" == *.scr ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi

  if [[ "$file" == *.ps1 ]]; then
    echo "$file is malicious and it is DELETED"
    mv "$file" "$malicious_dir"
    continue
  fi
done

ls -l "$dir" > "$directory_info_last"

while [[ true ]]; do
  ls -l "$dir" > "$directory_info_new"
  diff -q "$directory_info_last" "$directory_info_new"
    if [[ $? -eq 0 ]]; then

        sleep "$interval_secs"
        continue
      else
        for file in "$dir"/*; do
          grep -qi "virus" "$file"
          if [[ $? -eq 0 ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi

          grep -qi "trojan" "$file"
            if [[ $? -eq 0 ]]; then
              echo "$file is malicious and it is DELETED"
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "malware" "$file"
            if [[ $? -eq 0 ]]; then
              echo "$file is malicious and it is DELETED"
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "worm" "$file"
            if [[ $? -eq 0 ]]; then
              echo "$file is malicious and it is DELETED"
              mv "$file" "$malicious_dir"
              continue
            fi
            grep -qi "ransomware" "$file"
            if [[ $? -eq 0 ]]; then
              echo "$file is malicious and it is DELETED"
              mv "$file" "$malicious_dir"
              continue
            fi
          if [[ "$file" == *.exe ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi
          if [[ "$file" == *.bat ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi
          if [[ "$file" == *.vbs ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi
          if [[ "$file" == *.scr ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi
          if [[ "$file" == *.ps1 ]]; then
            echo "$file is malicious and it is DELETED"
            mv "$file" "$malicious_dir"
            continue
          fi
        done
      fi
  cp "$directory_info_new" "$directory_info_last"
  sleep "$interval_secs"
done

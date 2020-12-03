#!/bin/bash


ERROR=0


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

printf "\n*****************************\n"

PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')


echo "$PATHS" | while read FILE ; do
    if [[ ! -f $FILE ]]
    then
      # skip deleted files
      continue
    fi
    
    if ! file "$FILE" |grep -qE 'image|bitmap'; then
      continue
    fi

    FILE_SIZE=$(stat -c%s $FILE)
    if (( $FILE_SIZE > $MAX_FILE_SIZE ))
    then
      echo "The filesize of ${FILE} is ${FILE_SIZE} bytes, it should be lower than ${MAX_FILE_SIZE} bytes."
      exit 101
    fi
done

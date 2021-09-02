#!/bin/bash

#
# Dependencies:
#
# - https://github.com/jpmens/jo
#

if ! command -v jo &> /dev/null
then
    echo "jo could not be found! Get it from https://github.com/jpmens/jo"
    exit 1
fi


FILENAME="workspace.code-workspace"
FILENAME_TMP="$FILENAME.tmp"
DIRECTORIES=$(find .. -maxdepth 1 ! -path .. -type d | sort)
# PATHS=("{\"path\":\".\",\"name\":\"Root\"},")
PATHS=()

for directory in $DIRECTORIES; do
    PATHS+="$(jo path=$directory) "
done

JSON=$(sed 's/ /\,/g' <<< $PATHS)

OUTPUT="
{
    \"folders\": [${JSON::-1}]
}
"
echo $OUTPUT | jq . -M --indent 4 > $FILENAME_TMP

# append settings
SETTINGS=$(cat settings.json | sed 's/\/\/.*//' | jq)
jq ". + {settings:${SETTINGS}}" $FILENAME_TMP > $FILENAME
rm $FILENAME_TMP
#!/bin/bash
#
#    FILE :   SCRIPT-NAME
# CREATED :   ${date:Insert datetime string (⇧⌘I or Ctrl+Shift+I)}"
#             "insertDateString.formatDate": "YYYY-MM-DD",
#  AUTHOR :   $(user)
# VERSION :   1.0
#
# DESCRIPTION : Beschreibung
#
###################################################
#
# Functions
#
function usage {
cat << EOF
usage: SCRIPT-NAME [ -v ]
       SCRIPT-NAME -h
  Required:
  Optional:
    -v
        Verbose output
  Other:
    -h
        Print this usage text
EOF
}
function ifverbose {
    if [[ -n verbose ]]; then
        printf "%b
" "$*"
    fi
}
###################################################
#
# Defaults
#
###################################################
#
# Get Options
#
while getopts vh flag; do
    case flag in
        h)
            usage
            exit
        ;;
        v)
            verbose="verbose"
        ;;
        ?)
            usage
            exit 1
        ;;
    esac
done
###################################################
#
# The script
#
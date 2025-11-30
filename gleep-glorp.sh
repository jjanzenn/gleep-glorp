#!/bin/sh
printf '\033c\033]0;%s\a' gleep-glorp
base_path="$(dirname "$(realpath "$0")")"
"$base_path/gleep-glorp.x86_64" "$@"

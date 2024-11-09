#!/bin/bash
set -euo pipefail

script_dir="$( dirname "$0" )"
source "$script_dir/config.sh"

# -s == short -- don't want to be printing too much on the receipt printer
# default is 160, but let's set an explicit MAX_LENGTH (see config.sh)
raw=$( /usr/games/fortune ${FORTUNE_FILES[@]} -c -s -n $MAX_LENGTH )

# Which file did it come from?
source=$( basename "$( echo "$raw" | sed -e '/^%$/,$ d;  s/)$//;' )" )

# And just the fortune itself:
fortune=$( echo "$raw" | sed -e '1,/^%$/ d;' )

echo "$fortune"
# For some source files, add an attribution (since the individual fortunes don't have it)
case $source in
   merlin-wisdom)
	echo "   -- Merlin Mann"
	;;
   kevinkellyadvice)
	echo "   -- Kevin Kelly"
	;;
   obliquestrategies)
	echo "   -- Oblique Strategies"
	;;
esac

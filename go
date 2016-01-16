#!/usr/bin/env bash

case "$1" in
  run)
    shift
    if [ ! -x "$(which stack)" ] ; then
      brew install haskell-stack
    fi
    stack build && stack exec alphabet-diamond "$@"
    ;;
  *)
    echo "Usage"
    echo "./go run <letter>"
    ;;
esac

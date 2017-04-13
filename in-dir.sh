#! /bin/bash

pushd $1
"${@:2}"
RETURN_VAL=$?

function finish {
    popd
}

trap finish EXIT

exit $RETURN_VAL

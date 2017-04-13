#! /bin/bash

FG_CMD="${@:1}"

# somedir is server directory
pushd somedir
# run server command in background .NET here
dotnet run &
BG_PROCESS=$!
popd

# yarn at top level with server-ready npm package
# port for server
yarn server-ready -- --port 5000 --;
$FG_CMD
EXIT_CODE=$?

function finish {
    pkill -SIGKILL -P $BG_PROCESS
}

trap finish EXIT SIGTERM SIGINT SIGKILL
exit $EXIT_CODE


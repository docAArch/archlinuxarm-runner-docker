#!/bin/bash
sudo chown -R $USER:$USER /opt
cd /opt
sudo mkdir -p actions-runner
echo $(pwd)
sudo chown -R $USER:$USER ./actions-runner
cd /opt/actions-runner
curl -o actions-runner-linux-$ARCH-$VERSION.tar.gz -L https://github.com/actions/runner/releases/download/v$VERSION/actions-runner-linux-$ARCH-$VERSION.tar.gz
tar xzf ./actions-runner-linux-$ARCH-$VERSION.tar.gz
if test -f ".path"; then
    echo
else
    ./config.sh --url https://github.com/$USERNAME/$REPONAME --token $TOKEN
fi
./run.sh
from ubuntu:precise

run useradd -m -s /bin/bash haskell
run sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get -y install build-essential libedit2 libglu1-mesa-dev libgmp3-dev libgmp3c2 zlib1g-dev freeglut3-dev curl sudo
run echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell

user haskell
workdir /home/haskell
run curl -O http://www.haskell.org/ghc/dist/7.6.3/ghc-7.6.3-x86_64-unknown-linux.tar.bz2 && tar xjf ghc-7.6.3-x86_64-unknown-linux.tar.bz2 && cd ghc-7.6.3 && ./configure && sudo make install

run rm -rf ghc-7.6.3

run curl -O http://lambda.haskell.org/platform/download/2013.2.0.0/haskell-platform-2013.2.0.0.tar.gz && tar xzf haskell-platform-2013.2.0.0.tar.gz && cd haskell-platform-2013.2.0.0 && ./configure && make && sudo make install

run rm -rf haskell-platform-2013.2.0.0

env HOME /home/haskell

# Dockerfile for haskell-platform

Dockerfile for installing haskell-platform 2013.2.0.0 and another for pulling in the latest cabal-install.

## Prebuilt binary

Available at https://index.docker.io/u/zsol/haskell-platform-2013.2.0.0/

Vanilla flavor tagged by `plain`, version with up-to-date cabal-install (`1.18.0.1`) is tagged by `cabal-install` (and latest)

## DIY

```
sudo docker build -t "$USER/haskell-platform-2013.2.0.0:plain" .
sed -i "s/zsol/$USER/" Dockerfile.cabal-install
sudo docker build - < Dockerfile.cabal-install
```

#! /usr/bin/env bash
# to be run on Arch-based systems

pacaur -Syu
sudo gem update
sudo pip install -U $(pip freeze | awk '{split($0, a, "=="); print a[1]}')
gem update
(cd $HOME/.dots && git submodule update --init --recursive && \
  git add -A && git commit -m "backup" && git push)
(cd $HOME/git/stuffs &&git submodule update --init --recursive && \
  git add -A && git commit -m "backup" && git push)
(cd $HOME/git/stuffs &&git submodule update --init --recursive && \
  git add -A && git commit -m "backup" && git push)
apm update


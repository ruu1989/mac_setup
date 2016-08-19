#!/bin/bash

# Updates dotfiles, carefully excluding . and ..
find dotfiles/.* -maxdepth 0 -type f -exec cp {} ~/ \;

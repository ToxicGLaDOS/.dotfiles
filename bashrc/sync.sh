#!/bin/bash
# Change directories to this directory
cd ${0%sync.sh}
# Pull first. If we are ahead of the remote then nothing happens. If we are behind then we are updated.
git pull

# Add all, commit and push. If we are ahead of the remote then we push our local changes. If we are behind then nothing changes.
git add --all;
git commit -m "Auto-generated commit"
git push

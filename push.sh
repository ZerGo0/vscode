rm extensions.txt
code --list-extensions | xargs -L 1 echo code --install-extension >> extensions.txt
git add . && git commit -m 'sync'
git push

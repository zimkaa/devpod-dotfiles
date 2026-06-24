# Devpod Dotfiles

## Initialize devpod

.devcontainer.json

```json
  "mounts": [
      "source=/home/anton/Projects/devpod-dotfiles/devpod-dotfiles,target=/home/vscode/dotfiles,type=bind,consistency=cached"
  ],
  "postCreateCommand": "bash /home/vscode/dotfiles/install.sh",
  "onCreateCommand": "sudo chsh -s /usr/bin/zsh $USER",
  "settings": {
    "terminal.integrated.defaultProfile.linux": "zsh",
    "terminal.integrated.profiles.linux": {
      "zsh": {
        "path": "/usr/bin/zsh"
      }
    }
  },
```

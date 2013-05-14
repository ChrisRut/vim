#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -n $HOME ]; then
  if [ -d $HOME ]; then
    # Setup .vimrc file
    if [ ! -L ${HOME}/.vimrc ]; then
      if [ -e ${HOME}/.vimrc ]; then
        echo "${HOME}/.vimrc exists, moving it to: ${HOME}/.vimrc_$(date +%s)"
        mv ${HOME}/.vimrc ${HOME}/.vimrc_$(date +%s)
      fi
      echo "Creating Symlink: ${HOME}/.vimrc => ${DIR}/.vimrc"
      ln -s ${DIR}/.vimrc ${HOME}/.vimrc
    fi
    # Setup .vim directory
    if [ ! -L ${HOME}/.vim ]; then
      if [ -e ${HOME}/.vim ]; then
        echo "${HOME}/.vim exists, moving it to: ${HOME}/.vim_$(date +%s)"
        mv ${HOME}/.vim ${HOME}/.vim_$(date +%s)
      fi
      echo "Creating Symlink: ${HOME}/.vim => ${DIR}/.vim"
      ln -s ${DIR}/.vim ${HOME}/.vim
    fi
  else
    echo "ERROR: Your home directory (${HOME}) does not exist"
    exit 2
  fi
else
  echo "ERROR: The \$HOME environment variable is not set"
  exit 2
fi

echo "Done!"

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jeportie <jeportie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/02 16:47:07 by jeportie          #+#    #+#              #
#    Updated: 2024/06/02 16:59:07 by jeportie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### Install Script (`install.sh`)

#!/bin/sh

# Clone the repository to the Vim plugin directory
git clone https://github.com/jeromeDev94/NorminetteRun.git ~/.vim/plugged/NorminetteRun

# Add key mapping to .vimrc

echo '" Define the leader key if not already defined' >> ~/.vimrc
echo 'let mapleader = "\\"' >> ~/.vimrc
echo '" Map \n to run the NorminetteRun command' >> ~/.vimrc
echo 'nnoremap <Leader>n :NorminetteRun<CR>' >> ~/.vimrc
echo '" Link the syntax file to the plugin' >> ~/.vimrc
echo '"autocmd BufRead,BufNewFile *.c source ~/.vim/plugged/NorminetteRun/syntax/norminette.vim"' >> ~/.vimrc

echo "NorminetteRun plugin installed successfully!"

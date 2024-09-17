" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    norminette.vim                                     :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: jeportie <jeportie@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2024/06/02 16:40:55 by jeportie          #+#    #+#              "
"    Updated: 2024/06/02 16:41:01 by jeportie         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" ~/.vim/syntax/norminette.vim

" Define a custom highlight group for Norminette errors with a red wavy underline
if !exists('highlight NorminetteError')
    highlight NorminetteError cterm=underline gui=undercurl guisp=red
endif

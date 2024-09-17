# NorminetteRun

NorminetteRun is a Vim plugin that integrates the Norminette coding style checker, highlights code style issues, and displays error messages directly in Vim.

## Features

- Highlights Norminette errors in the buffer.
- Displays Norminette error messages in the command line when the cursor is on a line with an error.
- Automatically runs Norminette on buffer writes.
- Adds a red dot in the gutter for lines with errors.

## Installation

### Using Vundle

In .vimrc:
Plugin 'jeportie/NorminetteRun'

### Using the Install Script

Run the following command to install the plugin:
./install.sh

### Manual Installation
    
Clone the repository:
git clone https://github.com/jeromeDev94/NorminetteRun.git ~/.vim/pack/plugins/start/NorminetteRun

Add the following lines to your .vimrc:
-  " Define the leader key if not already defined
-  let mapleader = "\"
-  " Map \n to run the NorminetteRun command
-  nnoremap <Leader>n :NorminetteRun<CR>

## Usage
- Use \n to run Norminette on the current file.
- Move the cursor to a line with an error to see the Norminette error message in the command line.
- Errors will be highlighted and indicated with a red dot in the gutter.

## License
This project is licensed under the MIT License.

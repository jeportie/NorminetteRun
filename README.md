# NorminetteRun

**NorminetteRun** is a Vim plugin designed to seamlessly integrate the Norminette coding style checker into your workflow. 
It highlights code style issues directly in the buffer and displays error messages within the Vim interface.

## Features

- **Real-time Code Style Feedback**: Highlights Norminette errors directly in your code.
- **Error Messages in Command Line**: Displays detailed error messages when the cursor is placed on an error line.
- **Manual Control**: Easily trigger Norminette with a custom key mapping.
- **Gutter Indicators**: Adds visual indicators (red dots) in the gutter for lines with style errors.

## Installation

### Using Vundle

1. Add the following line to your `.vimrc`:
   ```vim
   Plugin 'jeportie/NorminetteRun'
   ```
2. Run `:PluginInstall` inside Vim.

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/jeportie/NorminetteRun.git ~/.vim/pack/plugins/start/NorminetteRun
   ```
2. Add the following lines to your `.vimrc` to map the Norminette run command:
   ```vim
   " Define the leader key if not already defined
   let mapleader = "\"
   " Map <Leader>n to run Norminette
   nnoremap <Leader>n :NorminetteRun<CR>
   ```

### Using the Install Script

Run the following command from your terminal to install the plugin automatically:
```bash
./install.sh
```

## Usage

- Save the file or press `<Leader>n` (default: `\n`) to run Norminette on the current file.
- Move the cursor to a line with an error to see the corresponding Norminette error message in the command line.
- Style issues will be highlighted, and errors are visually indicated by red dots in the gutter.

## License

This project is licensed under the MIT License.

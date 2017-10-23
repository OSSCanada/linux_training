# Basic Vim

Vim is a powerful TUI text editor.  It is complex to use at first but knowing how to use Vim will make your Linux Admin role a breeze by mastering just a few easy hotkeys/commands.

## Normal mode
Vim starts off in normal mode - it allows you to navigate your text document, but not edit until you enter specific modes (```insert``` or ```append``` mode for example).

## Normal mode commands
To ensure you are in normal mode press the ```escape``` key at any point


- ```0``` go to beginning of line
- ```$``` go to end of line
- `b` go back one word
- `w` go to next word
- ```gg``` go to first line of file
- ```G``` go to last line of file
- ```i``` enters insert mode - allows you to add text infront of the cursor's current position (press the ```escape``` key to return to normal mode)
- ```a``` enters append mode - allows you to add text behind of the cursor's current position (press the ```escape``` key to return to normal mode)
- ```v``` enters visual mode (fantastic for cut, copy and paste)

### Cut/Copy/Paste
- ```d``` deletes selected text (best used in visual ```v``` mode)
- ```y``` copies selected text (best used in visual ```v``` mode)
- ```dd``` cuts/deletes current line
- ```yy``` copies current line
- ```p``` pastes the previously cut/copied line after the cursor position
- ```P``` pastes before the current cursor position

## Command mode
To enter ```command``` mode, you must first be in ```normal``` mode by pressing the ```escape``` key and then press the ```:``` key

### Basic Vim commands
- ```:q``` quit
- ```:q!``` quit now! (do not save changes)
- ```:w``` write changes to file
- ```:w <filename>``` write changes to new <filename>
- ```:wq``` write changes then quit vim
- ```escape key``` exits command mode and returns to normal  mode


## Special commands
To ensure you enter command mode press the ```escape``` key then press the ```:``` key

- ```:3``` jump to line 3 (or any line number you want)
- ```:set number``` display line numbers
- ```:3d``` delete line 3
- ```:d3``` delete 3 lines including current cursor position
- ```:set number``` sets line numbers in your current session
- ```escape key``` exits current mode

## Searching
In normal mode
- ```/``` to search for a pattern
- Example ```/i``` searches for all instances of letter ```i``` in any word...not very helpful
- Example ```/help``` seaches for all instances of ```help``` so it will find ```helpful``` and ```helpless``` as well as ```help```
- search for an exact word ```/\<help\>``` searches for help only...so ```helpful``` and ```helpless``` do not match
- pressing ```n``` or ```N``` (```shift + n```) you can go to the ```next```/```previous``` search results

## Exercises

1. Open file ```vim.txt```
2. go to line 99 and delete the word "chambray"
3. go to the first line of the document
4. go to the last line of the document
5. add a new line to the document
6. add your name to the new line
7. delete line 3
8. go to line 5
9. delete the following 4 lines
10. go to line 200
11. cut the line
12. go to beginning of file
13. paste the cut line
14. quit vim without saving
15. Repeat 1-14, except save changes to a new file
16. quit vim

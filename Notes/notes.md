Packages:
sudo apt install curl -y
sudo apt install zsh -y
udo apt install git -y
sudo apt install htop -y
sudo apt install i3 -y
sudo apt install tmux -y
sudo apt install neovim -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install pkg-config -y
sudo apt install libssl-dev -y

/hom/mike/.cargo/bin

--------------------------------------------------------------------------------------------
## i3: Window Manager
    https://i3wm.org/

    * Install: sudo apt install i3 -y
    * Set alt as the mod key (Alt == Mod1)
  
### Using Terminals
  * **Open terminal:** Mod1+Enter
  * **Close terminal:** Mod1 + Shift + Q

### Tiled 
  * **Move Between Windows:** Mod1 + [j (left), k (down), l (up), ; (right)]
  * **Split Window Vertically:** Mod1 + v then Mod1 + Enter
  * **Split Window Horizontally:** Mod1 + h hen Mod1 + Enter
  * **Change To Tile Mode from other mode:** Mod1 + E
  * **Resize:** Mod1 + R, then use direction keys to resize
  * **Change Position of Windows:** Mod + Shift + direction

### Tabbed
  * **Change to tabbed mode:** Mod1 + W

### Stacking
  * **Stack Windows:** Mod1 + S
  * **Move Between Stack:** Mod1 +[ k (down), l (up)]

### Open Applications
  * **Open Some Other Application:** Mod1 + D
    * Opens bar on the top of the screen;

### Work Spaces
   * **Switch Spaces:** Mod + [1..9]
   * **Move window to another workspace:** Mod + Shift + workspace number

### Log out
    * **Log Out** Mod + Shift + E
  
### Lock Screen
    * **Lock:** 
      * Go to terminal
      * Enter: i3lock 
        * Changes screen to white
      * Unlock: Enter password 

----------------------------------------------------------------------------------------------
## TMUX
  * **Install**: sudo apt install tmux -y
  * **Start Session**: enter: tmux 
  * **Create New Window**: (Ctrl + b) c
  * **Switch Between Windows:** (Ctrl + b) window number 0,1,...
  * **Rename Window:** (Ctrl + b) , then change name

### Panes
  * **Create New Pane Horizontal:** (Ctrl + b)  then %
  * **Create New Pane Vertical:** (Ctrl + b)  then "
  * **Switch Pane:** (Ctrl + b) then arrows
3
### Sessionizer
  * https://github.com/jrmoulton/tmux-sessionizer
  * cargo install tmux-sessionizer

---------------------------------------------------------------------------------------------
## XOrg

### Sleep Adjustment
* xset s off			-> Disable screen saver
* xset s 900			-> Update screen save delay to 15 min (900 sec)
* xset -dpms			-> Turn off power saving mode (DPMS == Energy Star Features)
* xset +dpms			-> Turn on power saving mode 
* xset dpms 0 0 1200	-> Turn off monitor after 20mi of being idle

---------------------------------------------------------------------------------------------
### Oh-My-Zsh
* https://github.com/ohmyzsh/ohmyzsh/wiki
* Pluggins
  * Zsh-autosuggestions


-------------------------------------------------------------------
# VIM

## Command Count Motion ---------

### Save and Quit
* ```:w```		-> Write buffer
* ```:w!```		-> Override existing file
* ```:w {fileName}```	-> wirte to ane file
* ```:q```		-> Quit
* ```:q!```		-> Quit and ignore changes
* ```:wq```		-> Write buffer and quit
* ```ZZ```		-> Write and Quit
* ```:e!```   		-> Wipe out current changes and reload original file

### General
* CTRL-G		-> show filename and line position in file

### Move Cursor
* h (right) , j (down), k (up), l (left)

### Movement - Within Line
* _			-> go to beginning of text
* $			-> go to end of text
* 0 (Zero)	-> goto beginning of line
* ^			-> move to first non-blank char in line
* n|		-> move to the char in column n of current line

### Movements by Text Blocks
* w	-> Move forward one word (alphanumeric chars make up word)
* W	-> Move forward one Work ( whitespace separates words)
* b	-> Move backward one word (alphanumberic chars make up words)
* B	-> Move backward one Word
* e	-> Move to end of word (not punctuation)
* E	-> Move to end of work (included punctuation)
* (		-> Move to beginning of the current sentence
* )		-> Move to begining of the next sentence.
* {		-> Move to the beginning of the current paragraph
* }		-> Move tot he beginning of the next paragraph

### Indent
* >>		-> Indent line by shiftwidth spaces
* <<		-> De-indent line by shiftwidth spaces
* V>		-> Use visual mode to select lines to indent
### Vertical Movements
* G			-> Go to end of file
* gg		-> Go to begining of file
* {n}G		-> Go to specific line number 
* Ctrl-D	-> Jump half page down
* Ctrl-U	-> Jump half page up
* Ctrl-F	-> Jump full page up
* Ctrl-B	-> Jump full page downs
* zz		-> Center cursor on screen


### Motion - Jump to Character 
* 0 (Zero) -> goto beginning of line
* f + char -> jump **forward** to a char (land on the character)
* F + char -> jump **backward** to a char
* t + char -> jump **foward** to a char in line (land just before char)
* T + char -> jump **backaward** in line
	* ; -> move to next char
	* , -> move to previous char
### Count
* For any motion you can add a count value to specify how many time to do the motion
* (n)k -> jump n lines up
* (n)j -> jump n lines down

### Simple Edits
* i	-> Insert (at cursor)
* I	-> Insert (at begining of line)

* o	-> create new line below
* O 	-> create new line above

* a	-> Append (at cursor)
* A	-> Append (at end of line)

### Multiline Edits
* Edit multi lines at the same time
	1. Ctrl-V	-> Enter visual block mode
	2. Select lines that need to be changed
	3. Shift-I	-> Multiline Insert mode
	4. Make Changes -> note it will only make the change on the first line
	5. Esc		-> After esc then all line will be filled in

### Substiting Text
* c	-> Change Char
* cc	-> Change Line
* C	-> Replace chars from current positon to the end of line.
* cw	-> Change Word
* r	-> replace
* R	-> overstrike - Enter "overstrike/replace" mode and override all chars until ESC

### Substitue Command
* :s/{old}/{replacement}		-> replace the first instance of {old} with {replacement}
* :s/{old}/{replacement}/g		-> replace all (globally)		
* :s/{old}/{replacement}/gc		-> replace all (globally) and be prompted before any change


### Deleting Text
* d	-> Delete (char)
* dw	-> Delete (word)
* dd	-> Delete (line)
* D	-> Delete (line)
* x	-> delete char (at cursor)
* X	-> delete char (before cursor)
* p	-> put (i.e. paste)
* P	-> put (entire line)

### Undo
* u	-> undo (last change only)
* U	-> undo (restore the line to its inital state before any changes)
* Ctl-R -> re-undo

### Put 
* p	-> put (paste text **after** the cursor) 
* P	-> put (paste text **before** the cursor)
* "3p	-> put (get deletion buffer 3
	* Note: Vim maintains 9 deletion buffers
* p]		-> Paste text, aligning indentation with surroundings

### Yank
* y 	-> yank (char/selected)
* yy	-> yank entire line

### Join
* J	-> join current line (of cursor) with line below)

## Searching --------------------

### General Search
* /			-> search forward (down file)
* ?			-> search back (up file)
* n			-> search phrase again
* N			-> search phrase again in opposit direction
* CTRL-O	-> Go back (can repeat)
* CTRL-I	-> Go forward

* :set nowrapscan	-> turn of wraping 

### Matchin Parentheses Search
* %			-> press % on while cursor is on top of the [ { or ( to find the matching one

## Visual Mode -----------------

### Enter Visual Mode
* v -> enter visual mode
* Shift + v -> enter visual **line** mode

## Run External Commandes -------
* :!{command}		-> run any shell commands
* :w {fileName}		-> write current file to {fileName}
* v motion :w {fileName}	-> write selected text to file
* :r {file}			-> paste text from {file} into current file

## Teminal -------------------------
* :term			-> open terminal in vim
* Ctrl-w		-> switch between doc and terminal
* exit			-> type exit to close terminal

## RC ------------------------------
### Where to put
  * From vim can run :h rtp (runtimepath)
    * Will display the config search path for nvim

### Spelling
* Settings:
  * set spelllang=eng,cjk
  * set spellingsuggest=best,9
  * set spell
 * Ran into trouble getting to work. Errors that the .spl files were missing. I found the runtimepath and attempted
 to add the files into the ~/.vim directory and it still did not work
 * After figuring out files, add note on using this feature

## VIM in VSCode
* Ctrl-n		-> autosuggestion (down)
* Ctrl-p		-> autosuggestion (up)
* gd			-> goto definition
-------------------------------------------------------------------------------------------
# Shell

## Env Vars

### See all environment variables
* set       -> List the name/value of each shell variable
* env       -> display all exported environment
* printenv  -> print all or part of environment

--------------------------------------------------------------------------------------------
# Bluetooth

## Troubleshooting
### Restart bluetooth
* sudo systemctl restart bluetooth

## Tools

### hcitool (Configure Bluetooth Connections)
	
### bluetoothctl (Bluetooth Controller)
* Help
* devices
	* List all available devices
* paired-devices
	* List all paired devices

### Connect to bluetooth device
1. Display local devices:
	```hcitool dev```
2. Scan local device to discover bluetooth device to connect to:
	```hcitool -i {localDevice} scan``` 
	* Get the MAC address of the bluetooth device

3. Start bluetooth controller:
	* Start -> bluetoothctl
	* Check these are on:
		* power on
		* agent on
		* scan on
	* Trust device
		* trust {device}
	* Pair device
		* pair {device}


----------------------------------------------------------------------------------------------------

# Unzip

## Unzip file
* Pre: ensure that unzip is installed
	* sudo apt install unzip
* Unzip
	```unzip {fileName}```








































 





























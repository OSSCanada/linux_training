# Important things to remember

- ```which <command>``` will find where the command/service is if it is installed and in the ```$PATH```
- ```<command> --version``` will usually tell you what version of the command/service is installed

## ```apropos``` command

This will search and display topics from the man pages based on a keyword(s).

```bash
apropos concatenate
```

This will return a list of man pages that have something to do with concatenate.  The first column displays the command name, the second column describes what the command (likely) does.  This can help you in a bind when you can't remember the exact command to use. Then simply use:

```bash
man cat
```

To get the man page (README file) for the ```cat``` command.


## ```man``` command
For all the most used Linux commands - there is always a man page (manual), which is essentially a readme doc.

Should you ever forget the syntax or the parameter/flags of a command you can always run:

```bash
man <command>
```

This will display the man page for ```<command>```.  Here you can read/search through the document to find what you need.

### Searching ```man``` pages

Searching follows a similar search pattern as ```vim```.

- Start by typing "```/```" - this will start the pattern recognition.
- You can simply type the word you are looking for e.g. "```help```"
    - **NOTE**: this will match also for words that contain your search string e.g. "```help```", "```helpless```", "```helpful```", etc.
- You can refine the search by using the exact word match:
    - ```\<help\>```
    - ```\<``` represents the beginning of the word
    - ```\>``` represents the end of the word
    - this defines the boundry in which your pattern will be matched
# Important things to remember

- ```awk '/pattern/ { action $column }'``` is the general format for awk
- ```$0``` represents the entire ouput from the file or piped input
- ```/pattern/``` uses **regex** for pattern matching - !!!remember!!! the two "```/```"

## Regex patterns good to know

- ```/^abc/``` matches characters at the
- ```/abc$/``` matches characters at the end of an entire line
- ```/[a-z]/``` matches (hits) when a single lowercase character from a to z is found on the line 
- ```/[0-9]/``` matches (hits) when a single number 0 to 9 is found on the line
- ```/[Aa]/``` pattern is an "or" match, i.e. matches ```A``` or ```a```
- ```/[F.O]/``` will match when any a word has a single character between ```F``` and ```O```
- ```/[F*O]/``` is a wildcard match - any number of characters between ```F``` and ```O```
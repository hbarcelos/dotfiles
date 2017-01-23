# Unimpaired

| Command      | Description                                |
| :---:        | :---                                       |
| `[<Space>`   | Add new line before cursor line            |
| `]<Space>`   | Add new line ater cursor line              |
| `[e`         | Exchange current line with the line above  |
| `]e`         | Exchange current line with the line bellow |
| `[x`         | Encode XML/HTML entity                     |
| `]x`         | Decode XML/HTML entity                     |
| `[u`         | Encode URL                                 |
| `]u`         | Decode URL                                 |
| `[f`         | Jump to the next file in the directory     |
| `]f`         | Jump to the previous file in the directory |
| `[n`         | Jump to the next SCM conflict              |
| `]n`         | Jump to the previous SCM conflict          |

# Folding

| Command      | Description                                     |
| :---:        | :----                                           |
| `zc`         | Close one fold if the cursor is in an open fold |
| `zo`         | Open one fold if the cursor is in a closed fold |
| `za`         | Toggle one fold under cursor                    |
| `zC`         | Close all folds under cursor                    |
| `zO`         | Open all folds under cursor                     |
| `zA`         | Toggle all folds under cursor                   |
| `zr`         | Open one more level of all folds in file        |
| `zM`         | Open all folds in file                          |
| `zm`         | Closes one more level of all folds in file      |
| `zM`         | Closes all folds in file                        |

# EasyAlign

| Command                    | Description                           |
| :---:                      | :----                                 |
| `ga<obj><delim>`           | Align the `<obj>` using the delimiter |
| `:EasyAlign *<char>`       | Align "tables"                        |
| `:<range>EasyAlign <expr>` | Align all rows in `<range>`           |

# Signature

| Command      | Description                                                                                 |
| :---:        | :----                                                                                       |
| `mx`         | Toggle mark 'x' and display it in the leftmost column                                       |
| `dmx`        | Remove mark 'x' where x is a-zA-Z                                                           |
| `m,`         | Place the next available mark                                                               |
| `m.`         | If no mark on line, place the next available mark. Otherwise, remove (first) existing mark. |
| `m-`         | Delete all marks from the current line                                                      |
| `m<Space>`   | Delete all marks from the current buffer                                                    |
| `]\``        | Jump to next mark                                                                           |
| `[\``        | Jump to prev mark                                                                           |
| `]'`         | Jump to start of next line containing a mark                                                |
| `['`         | Jump to start of prev line containing a mark                                                |
| `\`]`        | Jump by alphabetical order to next mark                                                     |
| ``[`         | Jump by alphabetical order to prev mark                                                     |
| `']`         | Jump by alphabetical order to start of next line having a mark                              |
| `'[`         | Jump by alphabetical order to start of prev line having a mark                              |
| `m/`         | Open location list and display marks from current buffer                                    |
| `m[0-9]`     | Toggle the corresponding marker `!@#$%^&*()`                                                |
| `m<S-[0-9]>` | Remove all markers of the same type                                                         |
| `]-`         | Jump to next line having a marker of the same type                                          |
| `[-`         | Jump to prev line having a marker of the same type                                          |
| `]=`         | Jump to next line having a marker of any type                                               |
| `[=`         | Jump to prev line having a marker of any type                                               |
| `m?`         | Open location list and display markers from current buffer                                  |
| `m<BS>`      | Remove all markers                                                                          |

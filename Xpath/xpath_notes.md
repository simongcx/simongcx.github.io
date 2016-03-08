#  Miscellaneous
## Precedence
The `[]` operator has higher precedence (priority) than the `//` abbreviation.
```
//someexpression[n]
```
The above means "Find every node selected by `//somexpression` that is the nth child of its parent".
To get the Nth instance of the matched expression, the matched expression must be put in brackets:
```
(//someexpression)[n]
```
For example, to find the second div with the class blob:
```
(//div[@class="blob”])[2]
```
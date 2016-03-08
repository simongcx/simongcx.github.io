# Calc

## Activecell

Activecell equivalent:
```basic
Cell = ThisComponent.getCurrentSelection 'ThisComponent is the document that calls the macro

'The If statement is an attempt to check that the current selection is a single cell and not a range or a shape

If Cell.supportsService("com.sun.star.table.Cell") then

   Cell.Value = Cell.Value + 1

Else

   Print "Selection is not asingle cell"

End If
```
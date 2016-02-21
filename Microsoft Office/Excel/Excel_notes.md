# Pivot tables
## Cell reference for GETPIVOTDATA
Use the T function to convert the cell reference into a string. E.g.
```
=GETPIVOTDATA(T(B1),'[20090109.xls]Sheet1'!$B4,"Date",DATE(2009,1,9),"Hour","00")
```
## Filling down
Per field:
* Right click a value of a particular field
* Click “Field Settings…”
* Click on the “Layout & Print” tab
* Click “Repeat item labels”

All at once:
* Click on the pivot table
* Click on the “Design” ribbon
* Click “Report Layout”
* Click “Repeat All Item Labels”

## Remove subtotalling
Per field:
* Right click a value of a particular field
* Click “Field Settings…”
* The “Subtotals & Filters” tab will be selected by default
* Click “None”

All at once:
* Click on the pivot table
* Click on the “Design” ribbon
* Click “Subtotals”
* Click “Do Not Show Subtotals”

## Tabular view
The Classic Pivot table method:
* Right click anywhere in the pivot table
* Click “PivotTable Options…”
* Click on the “Display” tab
* Click “Classic PivotTable layout (enables dragging of fields in the grid)”

The per-field method
* Right click a value of a particular field
* Click “Field Settings…”
* Click on the “Layout & Print” tab
* Click “Show item labels in tabular form”
* Repeat the above for all necessary fields

The Design ribbon method
* Click on the pivot table
* Click on the “Design” ribbon
* Click “Report Layout”
* Click “Show in Tabular Form”

## Modifying a calculated field formula
* Select any cell in the pivot table
* On the Options tab of the PivotTable Tools ribbon, click “Fields, Items & Sets”
* Choose Calculated Field
* Select the calculated field you want to work with from the name drop-down list
* Update the formula
* Click the Modify button to update the formula and leave the dialog box open
* Click OK will update the formula and close the dialog box

## PivotTable, Table and DataModel nuances
* If you add a range that is not a Table to the data model, despite the name of the connection, the range is listed as Range, Range1, Range2, etc in the PivotTable FieldList dialog (this might be a bug)
* If one Table is added to the DataModel, all tables in the workbook appear in the ALL tab of the PivotTable FieldList dialog
* If you have one cell of a Table selected, the Insert > PivotTable wizard will default to having that Table as the data source

# SUMPRODUCT
## With conditionals
`(A1:A5="Hello")` returns an array of Booleans resulting from the comparison of the cell contents to the criteria provided.
This can be used as follows
```
=SUMPRODUCT((A1:A5=”Hello”)*(B1:B5))
```
This sums all the values in the range B1:B5 where the value in the corresponding row of range A1:A5 is equal to “Hello”, which achieves the same result as `SUMIF`.
## Double Unary operator
In some tutorials, the range criteria is preceded by two minus signs (a double unary). The purpose of this is to convert the list of Boolean values to zeros and ones. Each minus sign acts as a negation. When you negate a Boolean, Excel converts the underlying values to numbers and then reverses the sign. So TRUEs become -1s and FALSEs become 0s. The second negation reverses this and leaves just numbers thus allowing SUMPRODUCT to actually multiply.
The double unary appears only to be required where the parameters of the SUMPRODUCT are separated by commas.
There are alternatives to the double unary, but the double unary is believed to be the fastest:
```
=SUMPRODUCT((OrderPrice),--(Customer="Hansen"))
=SUMPRODUCT((OrderPrice),1*(Customer="Hansen"))
=SUMPRODUCT((OrderPrice),(Customer="Hansen")*1)
=SUMPRODUCT((OrderPrice),(Customer="Hansen")+0)
=SUMPRODUCT((OrderPrice),(Customer="Hansen")^1)
=SUMPRODUCT((OrderPrice),SIGN(Customer="Hansen"))
=SUMPRODUCT((OrderPrice),N(Customer="Hansen"))
=SUMPRODUCT((OrderPrice),(Customer="Hansen")*True)
=SUMPRODUCT((OrderPrice)*(Customer="Hansen"))
```
## Operators that you can use with SUMPRODUCT
```
+,-,*,/,^
```

# Tables
Called ListObjects in VBA.
## Benefits
* Auto-filter automatically added
* Quick formatting
* Auto-expands
* Auto fill-down formulae
* Always visible headers
* Totals are present when filtering

## Structured references
```
=[@[column title]]*someothercell
```
The `@` symbol is used to reference cells in the same row.
The inner square brackets are required because there is a space in the column name.


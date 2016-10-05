## Clearing deleted items

By default pivot tables retain history. Whilst this doesn't affect the information shown in the pivot table, it does affect what is shown in the filter dropdown, which can be confusing.

To fix the issue, right-click on the pivot table, click *Pivot Table Options...*, select the *Data* tab, change the *Number of items to retain per field* dropdown to *None*.

The below subroutine will apply this setting to every pivot table in every sheet in the active workbook:

```vb
Sub DeleteHistoryFromAllPivotTables()

For Each sht In ActiveWorkbook.Worksheets

    For Each pvt In sht.PivotTables
    
        pvt.PivotCache.MissingItemsLimit = xlMissingItemsNone

    Next

Next

End Sub
```

## Manipulating the data fields with VBA

The following subroutine iterates through all data fields in the currently selected pivot table, and converts those with a *Count* summarisation into a *Sum* summarisation. This can easily be tweaked based on the XlConsolidationFunction enumeration values listed in the table below. 

```vb
Sub ConvertCountDataFieldsToSum()

Dim pvtCurrentPivotTable As PivotTable
Dim pvf As PivotField

Set pvtCurrentPivotTable = ActiveCell.PivotTable

For Each pvf In pvtCurrentPivotTable.DataFields

    If pvf.Function = xlCount Then
        pvf.Function = xlSum
    End If

Next

End Sub
```


| Name            | Value | Description                                        |
|-----------------|-------|----------------------------------------------------|
| xlAverage       | -4106 | Average.                                           |
| xlCount         | -4112 | Count.                                             |
| xlCountNums     | -4113 | Count numerical values only.                       |
| xlDistinctCount | 111   | Count using Distinct Count analysis.               |
| xlMax           | -4136 | Maximum.                                           |
| xlMin           | -4139 | Minimum.                                           |
| xlProduct       | -4149 | Multiply.                                          |
| xlStDev         | -4155 | Standard deviation, based on a sample.             |
| xlStDevP        | -4156 | Standard deviation, based on the whole population. |
| xlSum           | -4157 | Sum.                                               |
| xlUnknown       | 1000  | No subtotal function specified.                    |
| xlVar           | -4164 | Variation, based on a sample.                      |
| xlVarP          | -4165 | Variation, based on the whole population.          |

Source: https://msdn.microsoft.com/en-us/library/office/ff837374.aspx

## Orientations

The following subroutine prints the name and orientation of all pivotfields in a pivot table:

```vb
Sub PrintPivotFieldOrientations()

Dim pvtCurrentPivotTable As PivotTable
Dim pvf As PivotField

Set pvtCurrentPivotTable = ActiveCell.PivotTable

For Each pvf In pvtCurrentPivotTable.PivotFields

    Debug.Print pvf.Name, pvf.Orientation

Next

End Sub
```


| Name          | Value |
|---------------|-------|
| xlHidden      | 0     |
| xlRowField    | 1     |
| xlColumnField | 2     |
| xlPageField   | 3     |
| xlDataField   | 4     |

Source: https://msdn.microsoft.com/en-us/library/office/ff194695.aspx

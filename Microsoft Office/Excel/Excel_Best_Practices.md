
* Row order shouldn't matter
* Column order shouldn't matter (i.e. moving a column position should not break the spreadsheet)
* Consistent formulae all the way down a column
* No subtotals - use pivot tables / sumif tables in another worksheet if totals are required
* No blank rows
* No blank columns
* Use Tables as much as possible
* Don't formula-link files
* It is better to reference something by name, than by cell reference / position
* It is better to have a single spreadsheet on a topic than one per month, or one per year
* Have a single header row
* Have the header row in row 1, if there is additional metadata, have this in a separate tab
* Don't separate similar data across multiple tabs

Basically, make it as much like a database as possible.

## Adding calculated columns to hard-coded source data

It is a common task to import some data into Excel (perhaps from a CSV output of a system) and then add columns to that data with additional calculations (e.g. vlookups to a mapping table to categorise the data). Often the spreadsheet will be re-used with new batches of the source data. In this scenario there are a few points of good practice:

* Add the calculated columns on the right hand side. Don't interweave the calculated columns, as this makes reusing the file with a new batch of data much harder. Don't have the calculated columns on the left, as adding new calculations will result in inconsistent position of the source data.

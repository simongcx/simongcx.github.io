
# Date functions

## Excel `DATE` / VBA `DateSerial` - build a date from integers

The Excel `Date` function and the VBA `DateSerial` function take three integers for year, month and day, and return a date. For example `=Date(2017,1,1)` in Excel and `DateSerial(2017,1,1)` both return date objects representing the 1st January 2017.

## Excel `TODAY` / VBA `Date` - return today's date

The Excel `TODAY` function and the VBA `Date` function take now parameters, and return today's date. In Excel this would be `=TODAY()` and in VBA `Date` (no brackets are necessary).

## Excel `DATEVALUE` / VBA `CDate` / VBA `DateValue` - convert a string to a date object

The Excel `DATEVALUE` function, the VBA `CDate` function and the VBA `DateValue` take a single string parameter representing a date and parse it, returning a date. For example `=DATEVALUE("01/05/2017")` in Excel, and `CDate("01/05/2017")` and `DateValue("01/05/2017")` in VBA.

Note that `CDate` will preserve any time information passed to it whereas `DateValue` will not.

```vb
Debug.Print DateValue("01/01/2016 15:35") ' returns 01/01/2016
Debug.Print CDate("01/01/2016 15:35") ' returns 01/01/2016 15:35:00
```

## Excel `TEXT` / VBA `CDate` - convert date serial to date

Excel's `TEXT` and VBA's `CDate` are not quite equivalent as Excel's underlying representation of a date is an float anyway, whilst a date object in VBA does differ from an integer.

`CDate` will accept integers and floats, representing days since 31/12/1899:

```vb
Debug.Print CDate(42856) ' returns 01/05/20167
Debug.Print CDate(42856.6) ' returns 01/05/2017 14:24:00
```

To take an integer and return a nicely formatted date in Excel, use `TEXT` as follows `=TEXT(B2,"dd/mm/yyyy")` (obviously substitute `B2` with the relevant cell address and tweak the date format as required). It is also possible to do `=DATE(YEAR(B21),MONTH(B2),DAY(B2))`.

Note that Excel and VBA's date serials differ before 01/03/1900. The Excel date format incorrectly includes 29/02/1900 (assuming 1900 was a leap year), whereas VBA correctly does not. However, to keep the two lined up from 01/03/1900, the VBA serial starts on 31/12/1899.

Excel: `=TEXT(1`,"dd/mm/yyyy")` returns 01/01/1900
VBA: `CDate(1)` returns 31/12/1899

If you want to check, run this VBA code in Excel:

```vb
For i = 1 To 100

    Debug.Print CDate(i), WorksheetFunction.Text(i, "dd/mm/yyyy")

Next
```

## VBA `DateAdd` and equivalent functionality in Excel - adding to a date

The `DateAdd` function takes three parameters, the interval represented as s string, a number, and a date object.

The interval representations are as follows:

"yyyy" - year
"q" - quarter
"m" - month of the year
"w" - weeks
"d" - day
"y" - day of the year (I haven't found an case where this works differently to "d")
"ww" - weekday (doesn't work)
"h" - hour
"m" - minute
"s" - second

Some examples:

```vb
Debug.Print DateAdd("d",0,CDate("01/01/2017")) ' returns 01/01/2016 i.e. an unmodified CDate("01/01/2017")
Debug.Print DateAdd("d",1,CDate("01/01/2017")) ' returns 02/01/2017 i.e. added one day
Debug.Print DateAdd("yyyy",1,CDate("01/01/2017")) ' returns 01/01/2019 i.e. same date with year incremented by one
Debug.Print DateAdd("m", 1, CDate("01/01/2017")) ' returns 01/02/2017 i.e. same date with month incremented by one
Debug.Print DateAdd("m", 1, CDate("01/12/2017")) ' returns 01/01/2018 i.e. same date of month, with month incremented and hence year incremented
```

It is possible to achieve the same in functionality in Excel by decomposing dates and adding to their respective parts before recompiling.

Adding one year: `=DATE(YEAR(A1)+1,MONTH(A1),DAY(A1))`
Adding one month: `=DATE(YEAR(A1),MONTH(A1)+1,DAY(A1))`
Adding one day: `=DATE(YEAR(A1),MONTH(A1),DAY(A1)+1)`

## Excel `VALUE` / VBA `CLng` - convert a date to an integer date serial

The Excel `VALUE` function and the VBA `CLng` function return date serial integers when passed a date. In Excel an example would be `=VALUE(A1)` and in VBA `Debug.Print CLng(CDate("01/01/2017"))`.

## Excel `TEXT` / VBA `MonthName` - return the name of the month of a day

The VBA `MonthName` function takes an integer for the month of the yaer and an optional boolean (default false) indicating whether to abbreviate.

```vb
Debug.Print MonthName(1,False) ' returns "January"
Debug.Print MonthName(1,True) ' returns "Jan"
```

The Excel `TEXT` function can be used to return the month name from a date:

`=TEXT(A1, "mmm")` returns an abbreviated month name
`=TEXT(A1, "mmmm")` returns the full month name

To convert from a month number rather than a date (equivalent to VBA's `MonthName`), build a date using the month number (the other values are irrelevant as long as they work):

`=TEXT(DATE(1900,A1,1),"mmm")`



## To do


DateDiff	A Function, which returns the difference between two time period
DatePart	A Function, which returns a specified part of the given input date value
FormatDateTime	A Function, which formats the date based on the supplied parameters
IsDate	A Function, which returns a Boolean Value whether or not the supplied parameter is a date
Day	A Function, which returns an integer between 1 and 31 that represents the day of the specified Date
Month	A Function, which returns an integer between 1 and 12 that represents the month of the specified Date
Year	A Function, which returns an integer that represents the year of the specified Date
WeekDay	A Function, which returns an integer(1 to 7) that represents the day of the week for the specified day.
WeekDayName	A Function, which returns the weekday name for the specified day.



Time Functions
Function	Description
Now	A Function, which returns the current system date and Time
Hour	A Function, which returns and integer between 0 and 23 that represents the Hour part of the the given time
Minute	A Function, which returns and integer between 0 and 59 that represents the Minutes part of the the given time
Second	A Function, which returns and integer between 0 and 59 that represents the Seconds part of the the given time
Time	A Function, which returns the current system time
Timer	A Function, which returns the number of seconds and milliseconds since 12:00 AM
TimeSerial	A Function, which returns the time for the specific input of hour,minute and second
TimeValue	A Function, which converts the input string to a time format


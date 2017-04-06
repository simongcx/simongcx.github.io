


After using the Sage 50 v21 ODBC driver in Excel for a while, it is quite common for the following error to be displayed *Specified driver could not be loaded due to system error 8: Not enough storage is available to process this command. (Sage Line 50 v21, C:\SysWOW64\S21DBC32.dll).*

![alt text](Specified_driver_could_not_be_loaded_due_to_system_error_8.png "Specified driver could not be loaded due to system error 8: Not enough storage is available to process this command. (Sage Line 50 v21, C:\SysWOW64\S21DBC32.dll).")



##Syntax Error: Invalid Group Specification

Occurs if the *WHERE* clause is after the *GROUP BY* clause

##Date queries
```sql
SELECT *
FROM AUDIT_JOURNAL
WHERE (AUDIT_JOURNAL.DATE>{d '2016-09-30'})
```
```sql
SELECT *
FROM AUDIT_JOURNAL
WHERE DATE > '2016-02-02'
```

###Importing to Access###

Click on the *External Data* ribbon
Click *ODBC Database*
Select *Import the source data into a new table in the current database*
Click *OK*
Select the *Machine Data Source* tab
Click *New*
Select *User Data Source (Applies to this machine only)*
Click *Next*
Select *Sage Line 50 v21*
Click *Finish*
Enter the *Data Source Name*
Enter the *Data Path*
Click *OK*
Click *OK*
Enter the *User ID*
Enter the *Password*
Click *OK*
Click *Select All*
Click *OK*
Wait for it to process
Select *Save import steps*
Enter *Save as*
Click *Save import*
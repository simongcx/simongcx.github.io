## SQL syntax

### Date queries
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

### Left joins

It is possible to do left joins (tested in v23). E.g.
```sql
SELECT AUDIT_JOURNAL.*, NOMINAL_LEDGER.NAME
FROM AUDIT_JOURNAL
LEFT JOIN NOMINAL_LEDGER
ON AUDIT_JOURNAL.NOMINAL_CODE = NOMINAL_LEDGER.ACCOUNT_REF
WHERE AUDIT_JOURNAL.DATE >= '2016-12-01'
```
### Cross-products

It is possible to do cross-products (tested in v23). E.g.

```sql
SELECT AUDIT_JOURNAL.*, NOMINAL_LEDGER.NAME
FROM AUDIT_JOURNAL, NOMINAL_LEDGER
WHERE AUDIT_JOURNAL.NOMINAL_CODE = NOMINAL_LEDGER.ACCOUNT_REF
AND AUDIT_JOURNAL.DATE >= '2016-12-01'
```

## Importing to Access

* Click on the *External Data* ribbon
* Click *ODBC Database*
* Select *Import the source data into a new table in the current database*
* Click *OK*
* Select the *Machine Data Source* tab
* Click *New*
* Select *User Data Source (Applies to this machine only)*
* Click *Next*
* Select *Sage Line 50 v21*
* Click *Finish*
* Enter the *Data Source Name*
* Enter the *Data Path*
* Click *OK*
* Click *OK*
* Enter the *User ID*
* Enter the *Password*
* Click *OK*
* Click *Select All*
* Click *OK*
* Wait for it to process
* Select *Save import steps*
* Enter *Save as*
* Click *Save import*

## Setting up with VBA

### Create a DSN-less connection to Sage 50 in Excel via VBA

```
Sub CreateSage50Connection()

    Sheets.Add After:=ActiveSheet
    With ActiveSheet.ListObjects.Add(SourceType:=0, Source:="ODBC;Driver={Sage Line 50 v21};UID=<yourusername>;PWD=<yourpassword>;DIR=<yourdatapath>;", Destination:=Range("$A$1")).QueryTable

        .CommandText = Array("SELECT * FROM AUDIT_JOURNAL")
        .RowNumbers = False
        .FillAdjacentFormulas = False
        .PreserveFormatting = True
        .RefreshOnFileOpen = False
        .BackgroundQuery = True
        .RefreshStyle = xlInsertDeleteCells
        .SavePassword = True
        .SaveData = True
        .AdjustColumnWidth = True
        .RefreshPeriod = 0
        .PreserveColumnInfo = True
        .Refresh BackgroundQuery:=False
    End With
End Sub
```

Notes:
* Make sure the version number of the driver is correct in the connection string
* The data path should be something like: `<yourinstallationdirectory>\Sage\Accounts\2015\Company.000\ACCDATA`

## Peculiarities

* There is inconsistent naming of fields between tables
    * The field NOMINAL_CODE in the AUDIT_JOURNAL table is called ACCOUNT_REF in the NOMINAL_LEDGER table
    * 

## Errors

### Specified driver could not be loaded due to system error 8

After using the Sage 50 v21 ODBC driver in Excel for a while, it is quite common for the following error to be displayed *Specified driver could not be loaded due to system error 8: Not enough storage is available to process this command. (Sage Line 50 v21, C:\SysWOW64\S21DBC32.dll).*

![Specified driver could not be loaded due to system error 8](Specified_driver_could_not_be_loaded_due_to_system_error_8.png)

### Syntax Error: Invalid Group Specification

Occurs if the *WHERE* clause is after the *GROUP BY* clause

## Table structure (schema)

| Table name                         | Purpose                                                            |
|------------------------------------|--------------------------------------------------------------------|
| ACCRUAL                            |                                                                    |
| AUDIT_HEADER                       |                                                                    |
| AUDIT_HISTORY_HEADER               |                                                                    |
| AUDIT_HISTORY_JOURNAL              |                                                                    |
| AUDIT_HISTORY_SPLIT                |                                                                    |
| AUDIT_HISTORY_USAGE                |                                                                    |
| AUDIT_JOURNAL                      | Effectively the general ledger / nominal ledger - all transactions |
| AUDIT_SPLIT                        |                                                                    |
| AUDIT_USAGE                        |                                                                    |
| AUDIT_VAT                          |                                                                    |
| BANK                               |                                                                    |
| BANK_STATEMENT                     |                                                                    |
| BANK_STATEMENT_LINE                |                                                                    |
| CALENDAR_EVENT                     |                                                                    |
| CALENDAR_EVENT_LABEL               |                                                                    |
| CALENDAR_EVENT_LOCATION            |                                                                    |
| CALENDAR_RECURRENCE_PATTERN        |                                                                    |
| CAT_TITLE                          |                                                                    |
| CATEGORY                           |                                                                    |
| CHART_LIST                         |                                                                    |
| CIS_RETURN                         |                                                                    |
| CIS_RETURNED_TRANSACTION           |                                                                    |
| CIS_SETTINGS                       |                                                                    |
| CIS_SUBCONTRACTOR                  |                                                                    |
| CIS_SUBCONTRACTOR_LEGACY           |                                                                    |
| CIS_SUBCONTRACTOR_RETURN           |                                                                    |
| CIS_SUBCONTRACTOR_TAX_HISTORY      |                                                                    |
| CLEAR_AUDIT_TRAIL_EVENT            |                                                                    |
| CLEARED_TRAN_RANGE                 |                                                                    |
| COMMUNICATION_ADDRESS              |                                                                    |
| COMPANY                            |                                                                    |
| COMPANY_DEL_ADDR                   |                                                                    |
| CONTACT_HISTORY                    |                                                                    |
| CONTACT_HISTORY_CONTACT_MAJOR_TYPE |                                                                    |
| CONTACT_HISTORY_CONTACT_OUTCOME    |                                                                    |
| CONTACT_HISTORY_CONTACT_TYPE       |                                                                    |
| COUNTRY_CODE                       |                                                                    |
| CREDIT_BUREAU                      |                                                                    |
| CURRENCY                           |                                                                    |
| DELETED_RECORDS                    |                                                                    |
| DEPARTMENT                         |                                                                    |
| DISPUTE_REASON                     |                                                                    |
| EC_VAT_DESCRIPTION                 |                                                                    |
| ECSALES_FILL                       |                                                                    |
| ECSALES_HEADER                     |                                                                    |
| ECSALES_SPLIT                      |                                                                    |
| ESUBMISSION_SETTINGS               |                                                                    |
| FINANCIAL_BUDGET                   |                                                                    |
| FIXED_ASSET                        |                                                                    |
| FIXED_ASSET_CAT                    |                                                                    |
| FUND                               |                                                                    |
| FUND_TYPE                          |                                                                    |
| GDN_ITEM                           |                                                                    |
| GRN_ITEM                           |                                                                    |
| INTRASTAT                          |                                                                    |
| INVOICE                            |                                                                    |
| INVOICE_ITEM                       |                                                                    |
| LETTER_TYPE                        |                                                                    |
| NOMINAL_LEDGER                     | Lists nominal codes and their balances                             |
| PAYMENT_INFO                       |                                                                    |
| PAYMENT_METHOD                     |                                                                    |
| PERIOD                             |                                                                    |
| POP_ITEM                           |                                                                    |
| PREPAYMENT                         |                                                                    |
| PRICE                              |                                                                    |
| PRICE_LIST                         |                                                                    |
| PROJECT                            |                                                                    |
| PROJECT_BUDGET                     |                                                                    |
| PROJECT_COST_CODE                  |                                                                    |
| PROJECT_COST_TYPE                  |                                                                    |
| PROJECT_ONLY_TRAN                  |                                                                    |
| PROJECT_RELATIONSHIP               |                                                                    |
| PROJECT_RESOURCE                   |                                                                    |
| PROJECT_RESOURCE_TYPE              |                                                                    |
| PROJECT_REVENUE_CODE               |                                                                    |
| PROJECT_STATUS                     |                                                                    |
| PROJECT_TRAN                       |                                                                    |
| PROTX_PAYMENT                      |                                                                    |
| PURCHASE_DEL_ADDR                  |                                                                    |
| PURCHASE_LEDGER                    | Lists suppliers and their balances                                 |
| PURCHASE_ORDER                     |                                                                    |
| RECURRING                          |                                                                    |
| REMITTANCE                         |                                                                    |
| RTD_SUMMARY                        |                                                                    |
| SALES_DEL_ADDR                     |                                                                    |
| SALES_LEDGER                       | Lists customers and their balances                                 |
| SALES_ORDER                        |                                                                    |
| SOFA_CATEGORY                      |                                                                    |
| SOP_ITEM                           |                                                                    |
| STOCK                              |                                                                    |
| STOCK_ALLOCATION                   |                                                                    |
| STOCK_CAT                          |                                                                    |
| STOCK_COMP                         |                                                                    |
| STOCK_TRAN                         |                                                                    |
| SUPPLIER_PAYMENT_INFO              |                                                                    |
| TAX_CODE                           |                                                                    |
| TEXT_FILE                          |                                                                    |
| UPDATE_LEDGER                      |                                                                    |
| VAT_ADJUSTMENT                     |                                                                    |
| VAT_DETAILS                        |                                                                    |
| VAT_RETURN                         |                                                                    |
| VAT_RETURN_RECEIPT                 |                                                                    |
| VAT_REV_CHARGE_DETAIL              |                                                                    |
| VAT_REV_CHARGE_HEADER              |                                                                    |
| VAT_REV_CHARGE_RETURN              |                                                                    |
| VAT_SUMMARY                        |                                                                    |


# Limitations / issues / annoyances of Sage CRM

- Can't change values in `PostInsertRecord` - therefore no way to do anything based on the record ID
- Client side API doesn't work for custom entities (issue may be limited to entities not created with the *Advanced Customization Wizard*)

# Useful sources

http://slidegur.com/doc/204126/the-values-----sage-crm-community
https://community.sagecrm.com/partner_community/b/hints_tips_and_tricks/archive/2007/07/13/key-values-in-urls.aspx
http://help.sagecrm.com/js-api/modules/crm.html
https://community.sagecrm.com/partner_community/b/hints_tips_and_tricks/archive/2013/03/28/sage-crm-v7-2-the-new-client-side-api.aspx
https://community.sagecrm.com/partner_community/b/hints_tips_and_tricks/archive/2016/08/25/how-do-i-add-the-id-from-a-custom-table-table-as-an-search-select-advanced.aspx
http://www.leading-edge.ro/sage-crm-add-ons/editable-grid-sage-crm

Generating PDFs:
https://community.sagecrm.com/partner_community/b/hints_tips_and_tricks/archive/2014/12/31/sage-crm-7-3-what-does-the-new-mail-merge-to-pdf-feature-mean-for-existing-customizations.aspx


## CreateScripts

Things you can do:
```javascript
// Set field attributes
Required = true;
DefaultValue = "hello world!";
Caption = "hello world!";
ReadOnly = true;
Hidden = true;
AllowBlack = true;
DefaultType = 6; // sets the field value to the current date / time

// Get information from the context of the record being accessed
var id = eWare.getContextInfo("Opportunity", "Oppo_referencenumber");
var strType = CRM.GetContextInfo("Opportunity", "Oppo_type");


// Access Values() collection
Caption = Values('test_testid');

// Insert HTML into the screen/block
Caption = '<font color=black>Total Due:</font>';

// Query the database with SQL
var id = eWare.getContextInfo("Opportunity", "Oppo_Opportunityid");

if (id != 'undefined' && id != '') {

	Caption = "Weighted Forecast: ";

	var sql = "Select cast(isnull(oppo_weightedforecast ,0) as decimal(10,2)) as oppo_weightedforecast";
	sql += " from vreportopportunity where oppo_opportunityid ="+id;

	var queryobj = eWare.CreateQueryObj(sql);
	queryobj.SelectSql();

    if (!queryobj.Eof) {
        if(queryobj('oppo_weightedforecast') != "undefined" ) {
            Caption += queryobj('oppo_weightedforecast');
        }
    }
}
```

Things you can't do:
- It appears that fields that are hidden via the CreateScript are not available to the client side API
- `Values('test_jobnumber') = Values('test_testid');` - the Values() collection appears to be read only

## Validate scripts

It is not possible to edit the `Values()` collection via *Validate* scripts. The only writeable variables in *Validate* scripts are `Valid` (a boolean set to false to mark the current entry as invalid) and `ErrorStr` (a string message to be displayed to the user)

Source: https://community.sagecrm.com/user_community/f/84/t/10960.aspx


## Table Scripts

### InsertRecord

### PostInsertRecord

It is not possible to edit a record via the PostInsertRecord function as the record is locked. Therefore it is not possible to do anything based on the record's unique ID (which is not assigned until after `InsertRecord`)

None of the below methods work:

```javascript
var recordJustInserted = CRM.FindRecord('Test',WhereClause);
var testid = recordJustInserted.test_testid;
recordJustInserted.test_customid = testid + 4000;
//recordJustInserted.SaveChanges();
recordJustInserted.SaveChangesNoTLS();
```
```javascript
var recordJustInserted = CRM.FindRecord('Test',WhereClause);
var testid = recordJustInserted.test_testid;
var strSQL = "UPDATE Test SET test_customid=" + (testid + 4000) + " WHERE test_testid = " + testid + ";"
var myQuery = CRM.CreateQueryObj(strSQL);
myQuery.ExecSQL();
```
```javascript
var recordJustInserted = CRM.FindRecord('Test',WhereClause);
var testid = recordJustInserted.test_testid;
var strSQL = "UPDATE Test SET test_customid=" + (testid + 4000) + " WHERE test_testid = " + testid + ";"
eWare.ExecSql(strSQL);
```



Source: https://community.sagecrm.com/user_community/f/84/t/10447.aspx

In order to change a record based on the record's unique ID (e.g. generate a custom ID based on the ID and other fields) it is necessary to do so via a SQL Trigger.



#### Getting the record ID

The PostInsertRecord event function of a Tablelevel script cannot access the ID of the record that has just been created. The record is not in context, and the unique ID has not been passed into CRM from the interface, so you can't use GetContextInfo nor Values() to get the ID. You need to use the WhereClause system variable.

```javascript
var recordJustInserted = CRM.FindRecord("opportunity",WhereClause);
var myOppoID = recordJustInserted.oppo_opportunityid;
```

Sources:
https://community.sagecrm.com/user_community/f/84/t/10042.aspx
https://community.sagecrm.com/user_community/f/84/p/5372/13115.aspx
http://slidegur.com/doc/204126/the-values-----sage-crm-community









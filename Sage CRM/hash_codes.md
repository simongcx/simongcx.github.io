# Escalation Rules, Classic Dashboard Blocks and OrderQuotes

U - CurrentUser ID - Used in Escalation Rules, Dashboard Blocks and OrderQuotes
L - CurrentUser Logon - Used in Escalation Rules and Dashboard Blocks
T - Current System Date/Time - Used in Escalation Rules and Dashboard Blocks
C - CurrentUser TeamID - Used in Escalation Rules, Dashboard Blocks and OrderQuotes
D - CurrentUser Team Name - Used in Escalation Rules and Dashboard Blocks

R - Recent List Info - Only Used in Dashboard Blocks

O - Current Opportunity ID - Only Used in OrderQuote Configuration
N - Current Version of Order/Quote - Only Used in OrderQuote Configuration



#Tab SQL codes

C: 1,5 (this restricts access to members of Teams with IDs 1 or 5
U: 1,5 (this restricts access to users with user_userids of 1 or 5
T: can be used to restrict the tab to territories, using the Territory ID (terr_territoryid).



# Accessing fields of the current record

Any field from the current entity can be accessed using hash tags (#) (also called hash codes or # codes).

For example:

```SQL
UPDATE Cases
SET Case_description='Ref : #Case_ReferenceId#'
WHERE Case_referenceid = '#Case_ReferenceId#'
```



Sources:
http://help.sagecrm.com/on_premise/en/7.3SP1/admin/Content/Administrator/WC_Using__And_Symbols.htm
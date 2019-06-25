

## Querying another database file
```sql
SELECT [RemoteQueryname].* FROM [RemoteQueryname] IN 'C:\RemoteDatabase.mdb'
```

## Val() vs CInt() or CLng()
For some unknown (unresearched) reason using `CInt()` or `CLng()` to convert a string to an integer causes datatype issues when that value is subsequently used in a WHERE clause. Use `Val()` instead.

## Update query with subquery
Cross-product method:

```sql
UPDATE table1, table2
SET table1.field1 = table2.field1
WHERE table1.id = tabl2.id
```

Inner join method:
```sql
UPDATE table1
INNER JOIN table2 ON table1.id = table2.id
SET table1.field1 = table2.field1
```

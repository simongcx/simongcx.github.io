

## Querying another database file
```sql
SELECT [RemoteQueryname].* FROM [RemoteQueryname] IN 'C:\RemoteDatabase.mdb'
```

## Val() vs CInt() or CLng()
For some unknown (unresearched) reason using `CInt()` or `CLng()` to convert a string to an integer causes datatype issues when that value is subsequently used in a WHERE clause. Use `Val()` instead.

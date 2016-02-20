Example code:
```Python
con = MySQLdb.connect('localhost', 'user', 'pass', 'db_name')
cur = con.cursor()
values = ('hello', 'world')
query = "INSERT INTO my_db VALUES(%s, %s);"
cur.execute(query, values)
con.commit()
```
Note that while MySQLdb uses the Python string substitution notation (i.e. %s), all values are %s as the MySQLdb module creates a string literal of all input values. Hence, the following will not work:
```Python
con = MySQLdb.connect('localhost', 'user', 'pass', 'db_name')
cur = con.cursor()
values = ('hello', 5)
query = "INSERT INTO my_db VALUES(%s, %d);"
cur.execute(query, values)
con.commit()
```
The specific style of parameterization may be different depending on your driver, you can import your db module and then do a print yourmodule.paramstyle. (SQLite uses '?' for parameterization.)
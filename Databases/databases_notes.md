# Database models
## Navigational Model
Both hierarchical and networks models are known as navigational databases due to the way data was accessed, and Charles Bachman's 1973 Turing Award presentation The Programmer as Navigator.
### Hierarchical Model
The hierarchical data model organizes data in a tree structure.
Hierarchical DBMSs were popular from the late 1960s, with the introduction of IBM's Information Management System (IMS) DBMS, through the 1970s.
Does not allow many-to-many relationships.
### Network Model
In 1971, the Conference on Data Systems Languages (CODASYL) formally defined the network model.

## Relational Model
## Object/Relational Model
## Object-Oriented Model
## Semistructured Model
## Associative Model
## Entity-Attribute-Value (EAV) data model
## Dimensional Model
## Graph Model
## Entity-relationship Model
## Enhanced Entity-relationship Model


# Queries
## Left join
A left join is the union of the inner join and all values in the left table that do not match to the right table with NULL values in fields taken from the right table.
An inner join is the cross product of the two tables filtered such that all records satisfy the join predicate.
A left join will duplicate (or more) the data in the left table if the matching criteria does not result in a single match per left record.



The problem with the Venn diagram above in understanding left joins, is that it only makes  sense (to me) if there only zero or one matching record in table2 for each record in table1, because it doesn't communicate the multiplication of the records in table1 if there is more than one match in table2.


# Entity relationship model

## Degree
The degree of a relationship is the number of entity types that participate in the relationship. The three most common relationships in ER models are Binary, Unary and Ternary
### Unary
A unary relationship is when both participants in the relationship are the same entity.

M:N unary relationship: A Subject may have many other Subjects as prerequisites and each Subject may be a prerequisite to many other Subjects
1:M unary relationship: An Employee may manage many Employees, but an Employee is managed by only one Employee.
1:1 unary relationship: A Person may be married to only one Person.

### Binary


# Miscellaneous
## Storing configuration data
There are two broad approaches to storing configuration data in relational databases:
the single-row table, e.g.
  CompanyName  |  StartFullScreen  |  RefreshSeconds  |  ...
---------------|-------------------|------------------|--------
  ACME Inc.    |        true       |       20         |  ...

and the name-value-pair table.

 ConfigOption    |   Value
-----------------|-------------
 CompanyName     | ACME Inc.
 StartFullScreen | true (or 1, or Y, ...)
 RefreshSeconds  | 20
 ...             | ...

### Advantages of the single row table
* Easily allows multiple configuration states and the ability to switch between them
* Takes advantage of the database's type system – by contrast the single field holding the value in the name-value pair table must be a string type to allow any input

### Advantages of the name-value-pair table
* Possible to add date-last-changed and changed-by fields
* Unlikely to hit the limit of the number of rows, whereas the single-row tables is more limited as there is typically a limit to the number of columns per table (SQLite default max number of rows is 2000, albeit changeable to 32767, whereas the maximum number of rows is approx 1e+13)
* Additional configuration does not required a schema change (unlike the single row table)


### Other approaches
Use multiple columns for the value in the name-value-pair table allowing the database's type system to be used, e.g.
ConfigOption   |   textValue    |   DateValue   |   NumericValue
---------------|----------------|---------------|-----------------
               |                |               |

Use a single column to capture the datatype in the name-value-pair table allowing the value field to be cast before use, e.g.

 ConfigOption    |   Value     |     Type
-----------------|-------------|---------------
 CompanyName     | ACME Inc.   |   sttring
 StartFullScreen | true        |   string
 RefreshSeconds  | 20          |   integer
 ...             | ...         |   ...

Use a data interchange format such as JSON or YAML to encode the values in the name-value-pair table

Sources:
http://programmers.stackexchange.com/questions/163606/configuration-data-single-row-table-vs-name-value-pair-table
http://stackoverflow.com/questions/2300356/using-a-single-row-configuration-table-in-sql-server-database-bad-idea

## Copying table with duplicates into table with primary key
```sql
INSERT INTO table2
SELECT *
FROM table1
ON DUPLICATE KEY UPDATE table2.field1 = table1.field1
```
The ON DUPLICATE KEY UPDATE can be a single field, and should be the key (or part of the key for composite keys).

## Generating SQL numbers table
```sql
SELECT 1+e+d*10+c*100+b*1000+a*10000 AS n FROM
(SELECT 0 AS a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9),
(SELECT 0 AS b UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9),
(SELECT 0 AS c UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9),
(SELECT 0 AS d UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9),
(SELECT 0 AS e UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9);
```
Source: http://stackoverflow.com/questions/4245714/select-numbers-between-a-range-1-to-100-in-sqlite

## SQL dates table

Redshift
```sql
SELECT (GETDATE()::DATE - n)::DATE FROM numbers
```
MySQL
```sql
SELECT DATE_SUB(DATE(NOW()), INTERVAL n DAY) FROM numbers
```

# Greatest-n-per-group
It is a very common question in SQL to need to find the whole data for the row with some max value in a column per some group identifier.
http://stackoverflow.com/questions/7745609/sql-select-only-rows-with-max-value-on-a-column

# Capturing relationships in a relational database
Thoughts on capturing relationships in a relational database

## Table of people
ID | Name | Date of Birth | etc
---|------|---------------|-----
   |      |               |

## Table of relationships

Relationship | ID1 | ID2
-------------|-----|-----
Father of    |  x  |  z
Boss of      |  y  |  a

*Relationship is a foreign key of the relationship types table*

## Table of relationship types

Relationship type | etc
------------------|-----
Father of         |
Boss of           |

Advantages:
* Can do an OR or an AND when querying, e.g. show the hierarchy where the parent record is the “father of” OR “boss of”
* Start with query to identify all names that have no parent in the hierarchy for that particular query
* relationships within the database can be added to without changing the database schema. It effectively moves some information from the schema into the table.
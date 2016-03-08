# MySQLinteraction

## Queries
```php
$result = mysqli_query($con,"SELECT* FROM Persons");
```
### ReturnValues

Returns `FALSE` on failure. For successful `SELECT`, `SHOW`, `DESCRIBE` or `EXPLAIN` queries `mysqli_query()` will return a `mysqli_result` object. For other successful queries `mysqli_query()` will return `TRUE`.

The `mysqli_return` object is not cloneable. References to the object by multiple parts of the code will cause problems as there is only one pointer to the current row.

# Debugging

## Communicating error messages

### echo

`echo` can be used to get text to appear in the client.

### print_r

`print_r` can be used to human-readable information about a variable. Takes two parameters, the variable and an optional parameter return. If return is true, the value is returned within PHP otherwise it is output to the client.
```php
error_log(print_r($variable,true));
```
### serialize

`serialize` can be used to get an understanding of what's in an object.

### error_log
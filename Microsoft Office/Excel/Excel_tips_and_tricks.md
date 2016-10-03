# Excel Tips and Tricks

## Getting around the 7-deep nesting limitation for the IF formula
To get round the nesting limitation for the IF forumula where each IF statement returns a number, simply add the numbers together. For example:
```
=IF(A1>10,50,0)+IF(AND(A1<=10,A1>0),100,0)+IF(A1<=0,200,0)
```
The above formula effectively stratifies the value in column A into three without using any nesting.

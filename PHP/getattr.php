<?php
$foo = [];

$foo['blob'] = 'hello';
$foo['blab'] = 'goodbye';

$bar = (object) $foo;

echo $bar-blob;

$far = 'blab';

echo $bar-$far;

?>
<?php
require_once __DIR__.'/Book.php';

$db_host = 'localhost';
$db_user = 'root';
$db_password = 'coderslab';
$db_name = 'bookshelf';

$conn = new mysqli($db_host,$db_user,$db_password,$db_name);
$conn->set_charset('UTF8');
if ($conn->error != 0) {
    die ("Blad polaczenia do bazy danych: {$conn->error}");
}
?>
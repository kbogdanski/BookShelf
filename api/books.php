<?php
require_once './src/connetion.php';

//dodaje nową książkę
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $newBook = new Book();

    $newBook->setAuthor(trim($_POST['author']));
    $newBook->setDescription(trim(str_replace("\n","<br>",$_POST['description'])));
    $newBook->setName(trim($_POST['name']));
    $newBook->setRating(trim($_POST['rating']));

    $newBook->saveToDB($conn);
}

//wyświetla wszystkie ksiażki lub dodatkowe informacje na temat ksiażki o podanym id
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['id']) && $_GET['id'] != '') {
        $loadBook = new Book();
        $id = trim($_GET['id']);
        $loadBook->loadFromDB($conn,$id);
        echo (json_encode($loadBook));
    } else {
        $allBooks = Book::GetAllBooks($conn);
        echo (json_encode($allBooks));
    }
}

//edycja książki
if ($_SERVER['REQUEST_METHOD'] == "PUT") {
    parse_str(file_get_contents("php://input"), $put_vars);
    $editBook = new Book();
    $editBook->loadFromDB($conn,$put_vars['id']);

    $editBook->setAuthor(trim($put_vars['author']));
    $editBook->setDescription(trim(str_replace("\n","<br>",$put_vars['description'])));
    $editBook->setName(trim($put_vars['name']));
    $editBook->setRating(trim($put_vars['rating']));

    $editBook->saveToDB($conn);
}

//usuwa z bazy danych ksiażkę o podanym id
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $del_vars);
    Book::DeleteFromDB($conn,$del_vars['id']);
}

?>

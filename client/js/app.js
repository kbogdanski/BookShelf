/**
 * Created by Kamil on 2016-06-25.
 */

$(document).ready(function () {
    var newBookForm = $('#createForm');
    var nameInput = $('#nameInput');
    var descriptionInput = $('#descriptionInput');
    var authorInput = $('#authorInput');
    var ratingInput = $('#ratingInput');
    var booksUlList = $('.book-list-ul');

    var loadAllBooks = function () {
        $.ajax({
                url: "http://localhost:8888/CodersLab/BookShelf/api/books.php",
                method: "GET",
                dataType: "JSON"
            })
            .done(function (booksTable) {
                booksUlList.empty();
                for (var i=0; i<booksTable.length; i++) {
                    var newLi = $("<li>");
                    newLi.attr("data-id", booksTable[i].id);
                    newLi.append($("<div class='book-img'><img src='img/book-img.jpg'></div>"));
                    newLi.append($("<h3 class='book-name'>Tytuł: " + booksTable[i].name + "</h3>"));
                    newLi.append($("<button class='showButton'>Pokaż szczegóły</button>"));
                    newLi.append($("<div class='book-text'></div>").attr("data-row",i));
                    newLi.append($("<img class='delButton' src='img/delete-img.jpg'>"));
                    newLi.appendTo(booksUlList);
                }

                //pobieranie i wyswietlanie dodatkowych informacji po kliknieciu w button 'showButton'
                var show = $('.showButton');
                show.on('click', function(event) {
                    var bookText = $(event.target).next();
                    var li = $(event.target).parent();
                    var id = li.attr("data-id");
                    if ($(event.target).text() == 'Pokaż szczegóły') {
                        $.ajax({
                            url: "http://localhost:8888/CodersLab/BookShelf/api/books.php?id=" + id,
                            method: "GET",
                            dataType: "JSON"
                            })
                            .done(function (book) {
                                var width = book.rating + '0%';
                                bookText.html("<h3>Autor: "+book.author+"</h3><br>"
                                    + book.description
                                    + "<div class='rating-bar'>OCENA: " + book.rating + "</div>"
                                    + "<button class='editButton'>Edytuj</button>");
                                bookText.css("display", "block");
                                $(event.target).text('Ukryj szczegóły');
                                $(event.target).css("background", "#cc3300");
                                $(event.target).next().children('.rating-bar').animate({"width": width}, "slow");

                                //Event dla buttona Edytuj - uzupełnia formularz aby można było edytować dane
                                var edit = $('.editButton');
                                edit.on('click', function(event) {
                                    var row = $(event.target).parent().attr("data-row");
                                    nameInput.val(booksTable[row].name);
                                    authorInput.val(booksTable[row].author);
                                    ratingInput.val(booksTable[row].rating);
                                    descriptionInput.val(booksTable[row].description);
                                    newBookForm.attr("data-id",booksTable[row].id);
                                    loadAllBooks();
                                });
                            })
                            .fail(function () {
                                console.log('Coś poszło nie tak podczas wyświetlania szczegółów ksiązki');
                            })
                    } else {
                        bookText.css("display", "none");
                        $(event.target).text('Pokaż szczegóły');
                        $(event.target).css("background", "#0000b3");
                    }
                });

                //usuwanie książki z bazy danych
                var del = $('.delButton');
                del.on('click', function(event) {
                    var li = $(event.target).parent();
                    var id = li.attr("data-id");
                    $.ajax({
                        url: "http://localhost:8888/CodersLab/BookShelf/api/books.php",
                        method: "DELETE",
                        data: "id="+id
                    })
                        .done(function() {
                            console.log('Usunąłem książkę z BD');
                            loadAllBooks();
                        })
                        .fail(function() {
                            console.log('Coś poszło nie tak podczas usuwania książki');
                        })
                });
            })
            .fail(function() {
                console.log('Coś poszło nie tak podczas ładowania listy książek');
            })

    };

    loadAllBooks();

    //dodanie nowej książki lub edycja już istniejącej
    newBookForm.on('submit', function(event) {
        event.preventDefault();
        var name = nameInput.val();
        var description = descriptionInput.val();
        var author = authorInput.val();
        var rating = ratingInput.val();

        if (newBookForm.attr("data-id")) {
            //zapisuje zmiany w DB
            var editId = newBookForm.attr("data-id");
            $.ajax({
                url: "http://localhost:8888/CodersLab/BookShelf/api/books.php",
                method: "PUT",
                data: "name=" + name + "&description=" + description + "&author=" + author + "&rating=" + rating + "&id=" + editId
            })
                .done(function() {
                    newBookForm.removeAttr("data-id");
                    nameInput.val('');
                    descriptionInput.val('');
                    authorInput.val('');
                    ratingInput.val('');
                })
                .fail(function() {
                    console.log('Coś poszło nie tak podczas zapisywania zmian w istniejacej książce');
                })
                .always(function() {
                    loadAllBooks();
                });
        } else {
            //dodaje nową ksiażkę
            $.ajax({
                url: "http://localhost:8888/CodersLab/BookShelf/api/books.php",
                method: "POST",
                data: "name=" + name + "&description=" + description + "&author=" + author + "&rating=" + rating
                })
                .done(function () {
                    nameInput.val('');
                    descriptionInput.val('');
                    authorInput.val('');
                    ratingInput.val('');
                })
                .fail(function () {
                    console.log('Coś poszło nie tak podczas zapisywania nowej książki');
                })
                .always(function () {
                    loadAllBooks();
                });
        }
    });

});

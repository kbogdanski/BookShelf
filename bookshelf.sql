-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 19 Sie 2016, 21:38
-- Wersja serwera: 5.5.44-0ubuntu0.14.04.1
-- Wersja PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `bookshelf`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Books`
--

CREATE TABLE IF NOT EXISTS `Books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `author` varchar(255) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Zrzut danych tabeli `Books`
--

INSERT INTO `Books` (`id`, `name`, `description`, `author`, `rating`) VALUES
(1, 'Potop', 'Wchodzi w skład trylogii Sienkiewicza', 'Henryk Sienkiewicz', 8),
(5, 'PIXEL', 'To jest magazyn a nie ksiażka', 'Micz', 9),
(6, 'Rambo', 'Książka na podstawie której nakręcono film w Sylwestrem Stallone.<br>Pierwsza duża rola Stallone.', 'John Ballmer', 10),
(8, 'Zaginięcie', 'Trzyletnia dziewczynka znika bez śladu z domku letniskowego bogatych rodziców. Alarm przez całą noc był włączony, a okna i drzwi zamknięte. Śledczy nie odnajdują żadnych poszlak świadczących o porwaniu i podejrzewają, że dziecko nie żyje.', 'Mróz Remigiusz', 5),
(9, 'W cieniu prawa', 'Galicja, 1909 rok. Mimo złej opinii i niejasnej przeszłości Erik Landecki zostaje przyjęty na czyścibuta w austriackim dworku. Jest przekonany, że los się do niego uśmiechnął. Pierwszej nocy ginie jednak dziedzic rodu, a cień podejrzeń pada na Polaka. Szybko pojawiają się spreparowane dowody, a Erik staje się głównym podejrzanym.<br><br>Musi walczyć nie tylko o swoją wolność, lecz także o życie – w zaborze austriackim karą za morderstwo jest bowiem śmierć przez powieszenie.', 'Mróz Remigiusz', 4),
(10, 'Ekspozycja', 'Pewnego ranka turyści odkrywają na Giewoncie makabryczny widok – na ramionach krzyża powieszono nagiego mężczyznę. Wszystko wskazuje na to, że zabójca nie zostawił żadnych śladów.<br><br>Sprawę prowadzi niecieszący się dobrą opinią komisarz Wiktor Forst. Zanim tamtego ranka stanął na Giewoncie, wydawało mu się, że widział w życiu wszystko. Tropy, jakie odkryje wraz z dziennikarką Olgą Szrebską, doprowadzą go do dawno zapomnianych tajemnic… Winy z przeszłości nie dadzą o sobie zapomnieć. Okrutne zbrodnie muszą zostać odkupione.', 'Mróz Remigiusz', 1),
(12, 'Pod kopułą', 'Pewnego pogodnego, jesiennego dnia małe amerykańskie miasteczko Chester Mill zostaje nagle i niewytłumaczalnie odcięte od świata.', 'Stephen King', 8),
(13, 'Władca Pierścieni: Drużyna Pierścienia / Dwie wieże / Powrót króla', 'Niełatwo powiedzieć, na czym polega tajemnica uroku wywieranego przez „Władcę Pierścieni”. Miał niewątpliwie rację C.S Lewis, pisząc: <br>„Dla nas, żyjących w paskudnym, zmaterializowanym i pozbawionym romantyzmu świecie możliwość powrotu dzięki tej książce do czasów heroicznych przygód, barwnych, przepysznych i wręcz bezwstydnie pięknych opowieści jest czymś niezwykle ważnym”. <br><br>Równie istotna jest przyjemność, jaką czytelnik czerpie z odkrywania złożonego, ale logicznie skonstruowanego uniwersum tej opowieści. Umożliwiają to dołączone do książki mapy oraz obszerne dodatki.<br><br>Od wydawcy:<br><br>"Władca Pierścieni" to jedna z najbardziej niezwykłych książek w całej współczesnej literaturze. Ogromna, z epickim rozmachem napisana powieść wprowadza nas w wykreowany przez wyobraźnię autora świat - fantastyczny, lecz ukazany wszechstronnie i szczegółowo, równie pełny i bogaty jak świat realny. Przykuwająca uwagę i wzruszająca, zabawna, choć momentami także przerażająca, opowieść ta rzuca na czytelnika czar, od którego nawet po zakończeniu lektury trudno się uwolnić. W ciągu pięćdziesięciu przeszło lat od pierwszego wydania "Władcy Pierścieni" miliony ludzi na całym świecie uległy temu urokowi.', 'Tolkien John Ronald Reuel', 10),
(15, 'Pieśń Lodu i Ognia. Tom 1. Gra o tron', 'W Zachodnich Krainach o ośmiu tysiącach lat zapisanej historii widmo wojen i katastrofy nieustannie wisi nad ludźmi. Zbliża się zima, lodowate wichry wieją z północy, gdzie schroniły się wyparte przez ludzi pradawne rasy i starzy bogowie.<br><br>Zbuntowani władcy na szczęście pokonali szalonego Smoczego Króla, Aerysa Targaryena, zasiadającego na Żelaznym Tronie Zachodnich Krain, lecz obalony władca pozostawił po sobie potomstwo, równie szalone jak on sam.<br>Tron objął Robert – najznamienitszy z buntowników. Minęły już lata pokoju i oto możnowładcy zaczynają grę o tron.', 'Martin George R.R.', 7),
(17, 'World of Warcraft. Illidan', 'Nie jesteś gotowy<br><br>Illidan Stormrage jest jedną z najpotężniejszych istot, jakie kiedykolwiek przemierzały ziemie Azeroth. Pozostaje też z pewnością najmniej rozumianym z wielkich tego świata. Za jego legendą i tajemniczymi poczynaniami kryje się bowiem błyskotliwy umysł, którego plany i machinacje niewielu potrafi pojąć, a jeszcze mniej – im zaufać. Rozpoczyna się panowanie Illidana, dawno przezeń zasłużone, rozpoczyna się walka o sprawiedliwość. Jego rządy przeniosą na zupełnie nowy poziom intrygującą fabułę, oszałamiającą przygodę i heroizm bohaterów World of Warcraft, najlepiej sprzedającej się gry wideo wszech czasów.<br><br>Dawno temu Illidan, nocny elf i czarownik, przeniknął w szeregi Płonącego Legionu, by powstrzymać inwazję demonów na Azeroth. Ale pobratymcy zamiast wychwalać go jako bohatera, nazwali Illidana Zdrajcą, kwestionując jego intencje po tym, jak nabrali podejrzeń, że pomaga władcom demonów.<br><br>Przez dziesięć tysięcy lat gnił w więzieniu, oczerniony i osamotniony, ale nawet na chwilę nie zapomniał o swoim celu. A teraz Legion powrócił i tak naprawdę tylko jeden czempion może stawić czoła demonom. Uwolniony z pęt Illidan szykuje się do ostatecznej konfrontacji w obcym świecie Rubieży, zbierając armię spaczonych orków, wężowych nag, przebiegłych krwawych elfów i przemienionych łowców demonów. Nikt nie zna motywów kierujących jego krokami i tylko on rozumie, jaką cenę przyjdzie mu zapłacić za pokonanie wrogów wszelkiego stworzenia. Jak przed wiekami zostaje zaatakowany przez tych, którzy w jego planach widzą jedynie cyniczną pogoń za potęgą – w tym przez Maiev Shadowsong, która pilnowała go, gdy tkwił w więzieniu. Strażniczka Shadowsong i jej oddział nocnych elfów wyruszyli za Zdrajcą aż na Rubież, chcąc go ukarać, i nie zatrzymają się, póki Illidan nie trafi do więzienia… albo nie spocznie w grobie.', 'King William', 6),
(18, 'Robert Lewandowski. Nienasycony', 'Po półfinale z Realem usiadł w szatni i zaczął się śmiać sam do siebie. "Czy to się zdarzyło naprawdę? Strzeliłem cztery gole w półfinale Ligi Mistrzów?" Gdy strzelał pięć Wolfsburgowi, był w swoim świecie, widział tylko miny obrońców i chciał więcej. Zdziwił się potem, że to wszystko rozegrało się w ledwie dziewięć minut. <br><br>Podczas Euro 2016 minie 10 lat, od kiedy w Legii orzekli, że nie ma zdrowia do wielkiego futbolu. Jak to się stało, że Robert Lewandowski wygrał z przeznaczeniem? Jak największy chuderlak w dziecięcych drużynach stał się gladiatorem? Jak piłkarz z kraju, którego kluby od 20 lat nie są w stanie przebić się do Ligi Mistrzów, został jednym z najskuteczniejszych strzelców w tych rozgrywkach? Jak zmieniał się w napastnika, który strzela cztery gole Realowi? Jak w tym czasie zmieniała się Polska, nasz futbol, reprezentacja? Jak rodził się zespół, który pokonał Niemców i wywalczył awans do Euro 2016?<br><br>"Nienasycony" to książka o obsesji strzelania goli, o sukcesie i jego cenie. O napastniku, który nie chciał przyjąć do wiadomości, że historia taka jak jego nie może się wydarzyć w polskim futbolu.', 'Wilkowicz Paweł', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

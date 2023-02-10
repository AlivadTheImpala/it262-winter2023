-- books-01262023.sql

CREATE TABLE `winter2023_Books` (
  `BookID` int UNSIGNED NOT NULL,
  `BookTitle` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Authors` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `ISBN` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Edition` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci,
  `Rating` int DEFAULT NULL,
  `Price` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `winter2023_Books` (`BookID`, `BookTitle`, `Authors`, `CategoryID`, `ISBN`, `Edition`, `Description`, `Rating`, `Price`) VALUES
(1, 'Professional ADO.NET', 'Smith', 1, '568524456', '2nd Edition', 'A great .NET book', 8, 23.50),
(2, 'Apache Server Unleashed', 'Jones', 2, '12345678', '1st Edition', 'A great PHP book', 7, 29.50),
(3, 'ASP.NET Unleashed', 'Doe', 1, '345678976', '1st Edition', 'A great .NET book', 9, 39.95),
(4, 'Introducing .NET', 'Wilson', 1, '67890567', '3rd Edition', 'A great .NET book', 8, 24.45),
(5, 'Professional C#', 'Jones', 1, '568524456', '1st Edition', 'A great .NET book', 6, 38.45),
(6, 'Beginning C++', 'Jackson', 3, '12345678', '1st Edition', 'A great programming book', 10, 41.40),
(7, 'Beginning J++', 'Johnson', 3, '345678976', '1st Edition', 'A great programming book', 8, 44.30),
(8, 'Beginning PHP', 'Smith', 2, '345678976', '2nd Edition', 'A great PHP book', 7, 55.50),
(9, 'Beginning MySQL', 'McDonald', 2, '67890567', '1st Edition', 'A great PHP book', 6, 98.20),
(10, 'Beginning Visual Basic', 'Cox', 3, '12345678', '1st Edition', 'A great .NET book', 8, 58.95),
(11, 'Beginning XHTML', 'Jones', 4, '12345678', '1st Edition', 'A great HTML book', 5, 39.95),
(12, 'Hacking Exposed', 'Evans', 5, '12345678', '2nd Edition', 'A great .NET book', 9, 22.20),
(13, 'Effective Java', 'Franklin', 3, '568524456', '1st Edition', 'A great programming book', 8, 91.20),
(14, 'JavaScript Bible', 'Jones', 4, '12345678', '1st Edition', 'A great HTML book', 6, 33.55),
(15, 'Beginning PHP4 and XML', 'Doe', 2, '12345678', '2nd Edition', 'A great PHP book', 7, 48.50),
(16, 'VBScript Regular Expressions', 'Smith', 3, '12345678', '1st Edition', 'A great programming book', 7, 49.50),
(17, 'Programming ASP', 'Johnson', 6, '67890567', '4th Edition', 'A great ASP book', 8, 49.50),
(18, 'Programming PHP', 'Doe', 2, '345678976', '1st Edition', 'A great PHP book', 9, 49.50),
(19, 'Programming C#', 'Jones', 1, '568524456', '1st Edition', 'A great .NET book', 7, 49.50),
(20, 'Programming Java', 'Smith', 3, '56780765', '5th Edition', 'A great programming book', 6, 49.50),
(21, 'Introducing XML', 'Evans', 4, '12345678', '1st Edition', 'A great HTML book', 8, 33.95);



CREATE TABLE `winter2023_Categories` (
  `CategoryID` int UNSIGNED NOT NULL,
  `Category` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `winter2023_Categories` (`CategoryID`, `Category`, `Description`) VALUES
(1, 'DotNet', 'Microsoft \'s flagship server technology.'),
(2, 'PHP', 'The world\'s most popular open source technology.'),
(3, 'Programming', 'Books of general programming interest.'),
(4, 'HTML', 'Web page architecture.'),
(5, 'Networking', 'How networks connect us.'),
(6, 'ASP', 'Microsoft \'s classic server technology.');


/* 
Below are some SQL commands we could use with our app





# Shows all book titles and categories 
SELECT BookTitle, Category FROM 
winter2023_Books INNER JOIN winter2023_Categories ON 
winter2023_Books.CategoryID = winter2023_Categories.CategoryID;

# Shows all title, authors and category for one book
SELECT BookTitle, Authors, Category FROM 
winter2023_Books INNER JOIN winter2023_Categories ON 
winter2023_Books.CategoryID = winter2023_Categories.CategoryID
WHERE BookID =6;

# Shows one book with description and aliasing
SELECT BookTitle, Authors, Category, b.Description AS 'BookDescription' FROM 
winter2023_Books AS b INNER JOIN winter2023_Categories AS c ON 
b.CategoryID = c.CategoryID
WHERE BookID =6;

# Same command, shorter aliasing
SELECT BookTitle, Authors, Category, b.Description 'BookDescription' FROM 
winter2023_Books b INNER JOIN winter2023_Categories c ON 
b.CategoryID = c.CategoryID
WHERE BookID =6;

# Shows all book titles, authors, and categories sorted by title.
SELECT BookTitle, Authors, Category FROM 
winter2023_Books b INNER JOIN winter2023_Categories c ON 
b.CategoryID = c.CategoryID
ORDER BY BookTitle ASC

# Shows all book titles, including those without a category
SELECT BookTitle, Authors, Category FROM 
winter2023_Books b LEFT JOIN winter2023_Categories c ON 
b.CategoryID = c.CategoryID
ORDER BY BookTitle ASC

# Shows number of books by category
SELECT Category, COUNT(*) AS 'NumberofBooks' FROM 
winter2023_Books b LEFT JOIN winter2023_Categories c ON 
b.CategoryID = c.CategoryID
GROUP BY Category
*/
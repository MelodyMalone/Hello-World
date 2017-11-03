
CREATE DATABASE db_library;
USE db_library;

/* --Create Tables--*/
CREATE TABLE tblPublisher (
	publisherName VARCHAR(50) PRIMARY KEY not null,
	publisherAddress VARCHAR(50) not null,
	publisherPhone VARCHAR(50) not null
);

CREATE TABLE tblBorrower (
	cardNO INT PRIMARY KEY not null IDENTITY(100,1),
	borrowerName VARCHAR(50) not null,
	borrowerAddres VARCHAR(50) not null,
	borrowerPhone VARCHAR(50) not null
);

CREATE TABLE tblBranch (
	branchID VARCHAR(50) PRIMARY KEY not null,
	branchName VARCHAR(50) not null,
	branchAddress VARCHAR(50) not null
);

CREATE TABLE tblBook (
	bookID INT PRIMARY KEY not null IDENTITY(1,1),
	bookTitle VARCHAR(50) not null,
	publisherName VARCHAR(50) not null CONSTRAINT fk_book_publisherName FOREIGN KEY REFERENCES tblPublisher(publisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tblAuthors (
	bookID INT PRIMARY KEY not null CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tblBook(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	authorName VARCHAR(50) not null
);

CREATE TABLE tblLoans (
	bookID INT PRIMARY KEY not null CONSTRAINT fk_Loans_bookID FOREIGN KEY REFERENCES tblBook(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID VARCHAR(50) not null CONSTRAINT fk_Loans_branchID FOREIGN KEY REFERENCES tblBranch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	cardNO INT not null CONSTRAINT fk_Loans_cardNO FOREIGN KEY REFERENCES tblBorrower(cardNO) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut DATE not null,
	dueDate DATE not null
);

CREATE TABLE tblCopies (
	bookID INT PRIMARY KEY not null CONSTRAINT fk_bookCopies_bookID FOREIGN KEY REFERENCES tblBook(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID VARCHAR(50) not null CONSTRAINT fk_branchID FOREIGN KEY REFERENCES tblBranch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	NO_ofCopies INT not null
);

/* --Populate Tables-- */
INSERT INTO tblPublisher
	(publisherName, publisherAddress, publisherPhone)
	VALUES /*Book title(s) - Author*/
	('Charles Scribner''s Sons', 'New York', '901-234-5678'), /*The listeners - Leni Zumas*/
	('Simon Pulse', 'New York', '123-234-3456'), /*Can't get there from here - Todd Strasser*/
	('Doubleday', 'New York', '123-456-7890'), /*The Pelican Brief, The Firm, The Rainmaker -John Grisham*/
	('Tor Books', 'New York', '234-567-8901'), /*Narnia - C.S. Lewis*/
	('HarperCollins', 'New York', '345-678-9012'), /*Boneshaker, Dreadnought, Ganymede - Cherie Priest*/
	('Bantam Books', 'New York', '456-789-0123'), /*Wild CardsI, II, III - George R.R. Martin*/
	('Picador USA', 'New York', '800-211-7945'), /*The Lost Tribe - Mark Lee*/
	('Dell Publishing', 'New York', '567-890-1234'), /*The Golden Compas, The Subtle Knife, The Amber Spyglass - Philip Pullman*/
	('Penguin Books', 'London', '678-901-2345'), /*Changes, Summer Knight, Ghost Story - Jim Butcher*/
	('Albert Lacroix', 'France', '789-012-3456'), /*Les miserables - Victor Hugo*/
	('Donald M. Grant', 'New Hamshire', '890-123-4567') /*The Dark Tower, Firestarter - Stephen King*/
;

INSERT INTO tblBorrower
	(borrowerName, borrowerAddres, borrowerPhone)
	VALUES
	('Angel Davis', 'Home', '503-777-2525'),
	('Enzo McGuckin', 'Vancouver', '360-254-2575'),
	('Muffin Davis', 'Vancouver', '360-557-1225'),
	('Melody Malone', 'Portland', '503-250-7377'),
	('Mazo Malone', 'Portland', '503-250-7377'),
	('Suzann Deneen', 'Vancouver', '360-254-2575'),
	('Mikia Cook', 'Texas', '512-744-1987'),
	('Charlie Dog', 'Vancouver', '777-777-7777'),
	('Sayaka Miki', 'Mitakihara', '503-608-1989')
;

INSERT INTO tblBranch
	(branchID, branchName, branchAddress)
	VALUES
	('branch1', 'Sharpstown', 'Northwest'),
	('branch2', 'Magic', 'Southwest'),
	('branch3', 'Reference', 'Northeast'),
	('branch4', 'Central', 'Southeast')
;

INSERT INTO tblBook
	(bookTitle, publisherName)
	VALUES
	('The Lost Tribe', 'Picador USA'),
	('Wild Cards I', 'Bantam Books'),
	('Wild Cards II', 'Bantam Books'),
	('Wild Cards III', 'Bantam Books'),
	('Boneshaker', 'HarperCollins'),
	('Dreadnought', 'HarperCollins'),
	('Ganymede', 'HarperCollins'),
	('The Chronicals of Narnia', 'Tor Books'),
	('The Golden Compass', 'Dell Publishing'),
	('The Subtle Knife', 'Dell Publishing'),
	('The Amber Spyglass', 'Dell Publishing'),
	('The Pelican Brief', 'Doubleday'),
	('The Firm', 'Doubleday'),
	('The Rainmaker', 'Doubleday'),
	('Can''t get there from here', 'Simon Pulse'),
	('The Listeners', 'Charles Scribner''s Sons'),
	('Changes', 'Penguin Books'),
	('Summer Knight', 'Penguin Books'),
	('Ghost Story', 'Penguin Books'),
	('Les Miserables', 'Albert Lacroix'),
	('The Dark Tower', 'Donald M. Grant'),
	('Firestarter', 'Donald M. Grant')
;
SELECT * FROM tblBook;
SELECT * FROM tblBorrower;
INSERT INTO tblAuthors
	(bookID,authorName)
	VALUES
	('16', 'Leni Zumas'),
	('15', 'Todd Strasser'),
	('12','John Grisham'),
	('13','John Grisham'),
	('14','John Grisham'),
	('8', 'C.S. Lewis'),
	('5', 'Cherie Priest'),
	('6', 'Cherie Priest'),
	('7', 'Cherie Priest'),
	('2', 'George R.R. Martin'),
	('3', 'George R.R. Martin'),
	('4', 'George R.R. Martin'),
	('1', 'Mark Lee'),
	('9', 'Philip Pullman'),
	('10', 'Philip Pullman'),
	('11', 'Philip Pullman'),
	('17', 'Jim Butcher'),
	('18', 'Jim Butcher'),
	('19', 'Jim Butcher'),
	('20', 'Victor Hugo'),
	('21', 'Stephen King'),
	('22', 'Stephen King')
;

INSERT INTO tblLoans
	(bookID, branchID, cardNO, dateOut, dueDate)
	VALUES
	('2', 'branch4', '101', '2017-08-08', '2017-08-22'),
	('3', 'branch4', '101', '2017-08-08', '2017-08-22'),
	('4', 'branch4', '101', '2017-08-08', '2017-08-22'),
	('8', 'branch4', '101', '2017-08-08', '2017-08-22'),
	('16', 'branch4', '101', '2017-01-08', '2017-01-22'),
	('17', 'branch2', '104', '2008-08-15', '2008-08-29'),
	('18', 'branch2', '104', '2008-08-15', '2008-08-29'),
	('19', 'branch2', '104', '2008-08-15', '2008-08-29'),
	('20', 'branch2', '105', '2017-01-09', '2017-01-23'),
	('2', 'branch4', '106', '1987-10-29', '1987-11-12'),
	('9', 'branch3', '108', '2017-03-06', '2017-03-20'),
	('10', 'branch3', '108', '2017-03-06', '2017-03-20'),
	('11', 'branch3', '108', '2017-03-06', '2017-03-20'),
	('21', 'branch4', '102', '2017-11-03', '2017-11-17'),
	('22', 'branch4', '102', '2017-11-03', '2017-11-17'),
	('1', 'branch1', '100', '2017-02-13', '2017-02-27'),
	('8', 'branch4', '107', '2017-01-08', '2017-01-26'),
	('18', 'branch2', '103', '1989-10-06', '1989-10-20')
;

INSERT INTO tblCopies
	(bookID, branchID, NO_ofCopies)
	VALUES
	('1', 'branch1', '5'),
	('2', 'branch4', '5'),
	('3', 'branch4', '5'),
	('4', 'branch4', '5'),
	('5', 'branch4', '3'),
	('6', 'branch4', '3'),
	('7', 'branch4', '3'),
	('8', 'branch4', '6'),
	('9', 'branch4', '3'),
	('10', 'branch4', '3'),
	('11', 'branch4', '3'),
	('12', 'branch1', '4'),
	('13', 'branch1', '4'),
	('14', 'branch1', '4'),
	('15', 'branch4', '2'),
	('16', 'branch4', '2'),
	('17', 'branch2', '3'),
	('18', 'branch2', '3'),
	('19', 'branch2', '3'),
	('20', 'branch1', '3'),
	('21', 'branch1', '3'),
	('22', 'branch4', '3')
;
SELECT * FROM tblLoans;
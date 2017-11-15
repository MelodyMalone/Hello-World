USE db_library;
GO

--Item 1
SELECT aa.NO_ofCopies, ab.BranchName, ac.BookTitle
FROM tblCopies aa
INNER JOIN tblBranch ab on aa.BranchID = ab.BranchID
INNER JOIN tblBook ac on aa.bookID = ac.bookID
WHERE ab.BranchName = 'Sharpstown' and ac.BookTitle = 'The Lost Tribe';


--Item 2
SELECT aa.NO_ofCopies, ab.BranchName, ac.BookTitle
FROM tblCopies aa
INNER JOIN tblBranch ab on aa.BranchID = ab.BranchID
INNER JOIN tblBook ac on aa.bookID = ac.bookID
WHERE ac.BookTitle = 'The Lost Tribe';

--Item 3
SELECT borrowername FROM tblBorrower WHERE cardNO not in(SELECT cardNO from tblLoans);

/*
--Item 4
SELECT aa.borrowerName, aa.borrowerAddres, ab.bookTitle
FROM tblBorrower aa
INNER JOIN tblLoans ac on aa.cardNO = ac.cardNO
INNER JOIN tblBook ab on ab.bookID = ac.bookID
INNER JOIN tblBranch ad on ac.branchID = ad.branchID
WHERE branchName = 'Sharpstown';
*/

--Item 5
SELECT aa.branchName, ab.NO_ofCopies
FROM tblCopies ab
INNER JOIN tblBranch aa on aa.branchID = ab.branchID
INNER JOIN tblLoans ac on ac.branchID = ab.branchID
WHERE dueDate = '%'
GROUP BY branchName;

--Item 6
SELECT aa.borrowerName, aa.borrowerAddres
FROM tblBorrower aa
INNER JOIN tblLoans ab on aa.cardNO = ab.cardNO
Where count(bookID) >= 5;

--Item 7
SELECT aa.bookTitle, ab.NO_ofCopies
FROM tblBook aa
INNER JOIN tblCopies ab on aa.bookID = ab.bookID
INNER JOIN tblAuthors ac on aa.bookID = ac.bookID
INNER JOIN tblBranch ad on ab.branchID = ad.branchID
WHERE ad.branchName = 'Central' and ac.authorName = 'Stephen King';

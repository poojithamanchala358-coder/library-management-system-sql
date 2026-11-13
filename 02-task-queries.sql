USE library_management;

-- Q1 How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
SELECT
    bc.book_copies_No_Of_Copies AS No_of_Copies
FROM tbl_book_copies bc
JOIN tbl_book b
    ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb
    ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe'
AND lb.library_branch_BranchName = 'Sharpstown';

-- Q2 How many copies of the book titled "The Lost Tribe" are owned by each library branch?
SELECT
    lb.library_branch_BranchName AS BranchName,
    bc.book_copies_No_Of_Copies AS No_of_Copies
FROM tbl_book_copies bc
JOIN tbl_book b
    ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb
    ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe';

-- Q3 Retrieve the names of all borrowers who do not have any books checked out.
SELECT
    borrower_BorrowerName
FROM tbl_borrower
WHERE borrower_CardNo NOT IN (SELECT book_loans_CardNo FROM tbl_book_loans);

-- Q4 For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address.
SELECT
    b.book_Title AS Book_Title,
    br.borrower_BorrowerName AS Borrower_Name,
    br.borrower_BorrowerAddress AS Borrower_Address
FROM tbl_book_loans bl
JOIN tbl_book b
    ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_borrower br
    ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN tbl_library_branch lb
    ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE lb.library_branch_BranchName = 'Sharpstown'
AND bl.book_loans_DueDate = '2018-02-03';

-- Q5 For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT
    lb.library_branch_BranchName AS BranchName,
    COUNT(bl.book_loans_BookID) AS Total_Books_Loaned
FROM tbl_library_branch lb
LEFT JOIN tbl_book_loans bl
    ON lb.library_branch_BranchID = bl.book_loans_BranchID
GROUP BY lb.library_branch_BranchName;

-- Q6 Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
SELECT
    br.borrower_BorrowerName AS Borrower_Name,
    br.borrower_BorrowerAddress AS Borrower_Address,
    COUNT(bl.book_loans_BookID) AS No_of_Books_CheckedOut
FROM tbl_borrower br
JOIN tbl_book_loans bl
    ON br.borrower_CardNo = bl.book_loans_CardNo
GROUP BY br.borrower_CardNo, br.borrower_BorrowerName, br.borrower_BorrowerAddress
HAVING COUNT(bl.book_loans_BookID) > 5;

-- Q7 For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
SELECT
    b.book_Title AS Book_Title,
    bc.book_copies_No_Of_Copies AS No_of_Copies
FROM tbl_book_authors ba
JOIN tbl_book b
    ON ba.book_authors_BookID = b.book_BookID
JOIN tbl_book_copies bc
    ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch lb
    ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE ba.book_authors_AuthorName = 'Stephen King'
AND lb.library_branch_BranchName = 'Central';

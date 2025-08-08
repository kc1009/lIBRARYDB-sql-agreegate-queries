-- Count Books per Author
SELECT AuthorID, COUNT(BookID) AS TotalBooks
FROM Books
GROUP BY AuthorID;

--  Count Books per Category
SELECT CategoryID, COUNT(BookID) AS TotalBooks
FROM Books
GROUP BY CategoryID;

-- Average Loan Duration (Returned Books Only)
SELECT MemberID, 
       ROUND(AVG(DATEDIFF(ReturnDate, LoanDate)), 2) AS AvgLoanDays
FROM Loans
WHERE ReturnDate IS NOT NULL
GROUP BY MemberID;

-- Total Loans per Member
SELECT MemberID, COUNT(LoanID) AS TotalLoans
FROM Loans
GROUP BY MemberID;

--  Members Who Borrowed More Than 1 Book (Using HAVING)
SELECT MemberID, COUNT(LoanID) AS TotalLoans
FROM Loans
GROUP BY MemberID
HAVING COUNT(LoanID) > 1;

--  Sum of Total Loan Days per Book
SELECT BookID, SUM(DATEDIFF(ReturnDate, LoanDate)) AS TotalLoanDays
FROM Loans
WHERE ReturnDate IS NOT NULL
GROUP BY BookID;

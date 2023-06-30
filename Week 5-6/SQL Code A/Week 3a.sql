/*Begin Questions 1,2,3*/
USE pubs 

Declare @NumberofTitles int;
Declare @AvgPrice money;

Set @NumberofTitles = (SELECT Count(title) FROM [dbo].[titles])
Set @AvgPrice = (SELECT AVG(price) FROM [dbo].[titles])

Print 'Number of Books: ' + 
CONVERT(varchar, @NumberofTitles);

Print 'Average Book Price: ' + '$' + 
CONVERT(varchar, @AvgPrice,1);

IF(@NumberofTitles < 100)
PRINT 'The Number of books is less than 100.';
else
PRINT 'There are at least 100 books.';

/*End Questions 1,2,3*/


/*Begin Questions 4,5,6*/
SELECT title_id,title,type,price INTO #AlteredTempVar FROM dbo.titles
WHERE price > 10

SELECT title_id,title,type,price FROM dbo.titles
WHERE price > 10

UPDATE #AlteredTempVar 
SET price = price - ((price * 10) / 100)

SELECT * FROM #AlteredTempVar

SELECT title_id,title, price FROM #AlteredTempVar

/*End Questions 4,5,6*/

/*Begin Questions 7*/

BEGIN TRY  
   DELETE FROM publishers WHERE pub_id = '1389';
END TRY 
BEGIN CATCH
   SELECT ERROR_MESSAGE() AS [Error Message]
END CATCH

/*End Questions 7*/
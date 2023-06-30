CREATE FUNCTION fnPubTotals5(@cutoff money)
	Returns table
Return
	(Select pub_id, SUM(price) AS Total
	FROM titles
	Group BY pub_id 
	HAVING SUM (price) > @cutoff);
GO

Select * FROM fnPubTotals5(0.00)

Select * FROM fnPubTotals5(50.00)


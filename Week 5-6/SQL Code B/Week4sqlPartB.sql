CREATE TRIGGER titles_UPDATE
	ON titles
	INSTEAD OF INSERT
AS
DECLARE @title_id varchar(6),
		@title varchar(80),
		@type char(12),
		@pub_id char(4),
		@price money,
		@advance money,
		@royalty int,
		@ytd_sales int,
		@notes varchar(200),
		@pubdate datetime,
		@TestRowCount int
SELECT @TestRowCount = Count(*) FROM titles
if @TestRowCount = 1
	BEGIN
		SELECT 
		@title_id = title_id,
		@title = title,
		@type = type,
		@pub_id = pub_id,
		@price = price,
		@advance = advance,
		@royalty = royalty,
		@ytd_sales = ytd_sales,
		@notes = notes,
		@pubdate = pubdate
		FROM dbo.titles
	IF(@price <= 300)
		UPDATE titles
		SET title = @title, type = @type, pub_id=@pub_id,
		price=@price, advance=@advance, royalty=@royalty, 
		ytd_sales=@ytd_sales, notes=@notes, pubdate=@pubdate
		Where title_id=@title_id;
	else if (@price > 300)
		THROW 50027,'Price must be less than or equal to 300.',1;
	END;

UPDATE titles
SET price = 200
WHERE title_id = 'BU1032';

UPDATE titles
SET price = 350
WHERE title_id = 'BU1032';


SELECT * FROM titles
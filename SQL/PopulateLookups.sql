truncate table categories
insert into Categories(Description, [Order]) values('Tanks', 1)

truncate table [Subcategory]
insert into [Subcategory] (categoryid, [description], [order])
values (1, 'Vertical', 1)
insert into [Subcategory] (categoryid, [description], [order])
values (1, 'Horizonal', ((select max([order]) from subcategory) + 1))

truncate table products
insert into Products ([Description], ProductNumber, ListPrice, CategoryID, subCategoryID, ModifiedBy)
values('10 x 20', '1234', 10, 1, 1, 'nate')
insert into Products ([Description],ProductNumber, ListPrice, CategoryID, subCategoryID, ModifiedBy)
values('10 x 20', '2345', 10, 1, 2, 'nate')
truncate table categories
insert into Categories(Description, [Order]) values('Tanks', 1)

truncate table [Subcategory]
insert into [Subcategory] (categoryid, [description], [order])
values (1, 'Vertical', 1)
insert into [Subcategory] (categoryid, [description], [order])
values (1, 'Horizonal', ((select max([order]) from subcategory) + 1))

truncate table products
insert into Products ([Description], ProductNumber, ListPrice, CategoryID, subCategoryID, ModifiedBy)
values('14 gallon 15" x 15" x 15"', '151515', 67.52, 1, 1, 'nate')
insert into Products ([Description],ProductNumber, ListPrice, CategoryID, subCategoryID, ModifiedBy)
values('15 gallon 18.5" x 15" x 15"', '181513', 52.99, 1, 1, 'nate')
insert into Products ([Description],ProductNumber, ListPrice, CategoryID, subCategoryID, ModifiedBy)
values('29 gallon', '222300', 121.34, 1, 2, 'nate')
--Profilowanie jakoœci danych

-- Znajdowanie duplikatów. Je¿eli wyra¿enie zwraca 0 wtedy nie ma duplikatów

With t1
as
(
select BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate, 
count(*) as records
from HumanResources.EmployeeDepartmentHistory
Group by BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate
)
Select records
from t1
where records > 1;

-- 2 - znajdowanie Duplikatów

select BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate, 
count(*) as records
from HumanResources.EmployeeDepartmentHistory
Group by BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate
having count(*) > 1;

--Je¿eli wynik powy¿szych zapytañ bêdzie dodatni, wtedy nale¿y porównaæ w having do 2,3,4,itp.
-- W ten sposób pokzuj¹ siê zdublowane rekordy

select BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate, 
count(*) as records
from HumanResources.EmployeeDepartmentHistory
Group by BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate
having count(*) = 2;

-- Jak znajdziemy duplikaty, to po ich weryfikacji mo¿emy je usun¹æ:

-- 1. Funkcja distinct

select distinct BusinessEntityID, 
DepartmentID, 
ShiftID, 
StartDate, 
EndDate, 
ModifiedDate
from HumanResources.EmployeeDepartmentHistory
 
-- 2. Grupowanie bez agregacji tabel ³¹czonych w join



select hed.BusinessEntityID, 
hed.DepartmentID, 
hed.ShiftID, 
hed.StartDate, 
hed.EndDate 
from HumanResources.EmployeeDepartmentHistory hed
join HumanResources.Employee he on hed.BusinessEntityID=he.BusinessEntityID
Group by hed.BusinessEntityID, 
hed.DepartmentID, 
hed.ShiftID, 
hed.StartDate, 
hed.EndDate

-- Oczyszczanie danych 

-- Instrukcja case - oczyszczanie z literówek


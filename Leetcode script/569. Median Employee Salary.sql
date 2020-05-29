##########  569. Median Employee Salary #########

Create table If Not Exists Employee (Id int, Company varchar(255), Salary int);
Truncate table Employee;
insert into Employee (Id, Company, Salary) values ('1', 'A', '2341');
insert into Employee (Id, Company, Salary) values ('2', 'A', '341');
insert into Employee (Id, Company, Salary) values ('3', 'A', '15');
insert into Employee (Id, Company, Salary) values ('4', 'A', '15314');
insert into Employee (Id, Company, Salary) values ('5', 'A', '451');
insert into Employee (Id, Company, Salary) values ('6', 'A', '513');
insert into Employee (Id, Company, Salary) values ('7', 'B', '15');
insert into Employee (Id, Company, Salary) values ('8', 'B', '13');
insert into Employee (Id, Company, Salary) values ('9', 'B', '1154');
insert into Employee (Id, Company, Salary) values ('10', 'B', '1345');
insert into Employee (Id, Company, Salary) values ('11', 'B', '1221');
insert into Employee (Id, Company, Salary) values ('12', 'B', '234');
insert into Employee (Id, Company, Salary) values ('13', 'C', '2345');
insert into Employee (Id, Company, Salary) values ('14', 'C', '2645');
insert into Employee (Id, Company, Salary) values ('15', 'C', '2645');
insert into Employee (Id, Company, Salary) values ('16', 'C', '2652');
insert into Employee (Id, Company, Salary) values ('17', 'C', '65');

# according to the concept of median:
# for odd number of element, N(number or sequence no. < median) = N(number or sequence no. > median)
# for even number of element, abs(N(number or sequence no. < median) - N(number or sequence no. > median))=1
select t1.Id as Id, t1.Company, t1.Salary
from Employee as t1 inner join Employee as t2
on t1.Company = t2.Company
group by t1.Id
having abs(sum(CASE when t2.Salary<t1.Salary then 1
                  when t2.Salary>t1.Salary then -1
                  when t2.Salary=t1.Salary and t2.Id<t1.Id then 1
                  when t2.Salary=t1.Salary and t2.Id>t1.Id then -1
                  else 0 end)) <= 1
order by t1.Company, t1.Salary, t1.Id
;

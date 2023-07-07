

create table Employee (
  id INT,
  company varchar(255),
  salary INT );
  
  insert into Employee
  VALUES
      (1,"A",2341),
      (2,"A",341),
      (3,"A",15),
      (4,"A",15314),
      (5,"A",451),
      (6,"A",513),
      (7,"B",15),
      (8,"B",13),
      (9,"B",1154),
      (10,"B",1345),
      (11,"B",1221),
      (12,"B",234),
      (13,"C",2345),
      (14,"C",2645),
      (15,"C",2645),
      (16,"C",2652),
      (17,"C",65) 
  
  select * from Employee;
  
--median salary companywise 
  
select company,sum(salary)/2 as median_sal
from 
  (select a.company,a.salary
  from 
      (select id,company,salary ,
                 row_number() over(partition by company order by salary) as row_count
          from employee) a ,    
     (select company,count(*) as com_count
     from Employee
     GROUP by 1) b
  where a.company=b.company AND 
       ((com_count%2=0 and row_count=com_count/2) or
        (com_count%2=0 and row_count=com_count/2+1) OR
        (com_count%2=1 and row_count=(com_count/2)+1)) ) sub1
GROUP by 1   
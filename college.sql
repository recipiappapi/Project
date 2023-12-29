drop table College;

drop table Student_Account;
drop table Student;
drop sequence student_id_sequence;
drop trigger student_id_trigger;

drop table  Teacher_account;
drop table Teacher;
drop sequence teacher_id_sequence;
drop trigger teacher_id_trigger;

drop table Staff_account;
drop table Staff;
drop sequence staff_id_sequence;
drop trigger staff_id_trigger;

drop procedure salary_withdraw_teacher;
drop procedure pay_fee;
drop procedure deposite_salary_to_teacher_account;

drop procedure salary_withdraw_staff;
drop procedure deposite_salary_to_staff_account;

drop procedure salary_withdraw_teacher;
drop procedure salary_withdraw_staff;

drop type Sport_Department;
drop type Library_Department;
drop type Sport_and_Library_Department;

drop  table Sport_Items__Issued_and_Return_Item;
drop type Sport_Department__Issued_and_Return_Item;
drop type Sport_and_Library_Department_Issued_and_Return_Item;

drop procedure update_sport_items;
drop trigger Sport_Department__Issued_and_Return_Item_Trigger;

drop procedure return_sport_items;





create Table College(
    college_Name varchar(50),
    post_code int,
    address varchar(50),
    contact int
);

create table Student(
    student_id varchar(5) primary key,
    student_name varchar(30),
    student_department varchar(30),
    student_current_semester varchar(30),
    student_address varchar(30),
    student_contact_number int unique
);
create Table Student_Account(
    student_account_id varchar(5) primary key,
    total_fee varchar(10),
    remaining_fee varchar(10),
    last_transaction_date Timestamp,
    paid_amount varchar(10)
);

create sequence student_id_sequence
      start with 1
      Increment by 1;

CREATE OR REPLACE TRIGGER student_insert_trigger
BEFORE INSERT ON Student
FOR EACH ROW 
DECLARE
    v_student_id VARCHAR(5);
BEGIN
    -- Generate the student_id
    v_student_id := 's' || student_id_sequence.NEXTVAL; 
    -- Insert the generated student_id into Student_Account with default values
    INSERT INTO Student_Account (student_account_id, total_fee, remaining_fee, last_transaction_date, paid_amount)
    VALUES (v_student_id, '8000', '8000', NULL, NULL);

   :NEW.student_id := v_student_id;
END;
/

Insert into Student(student_name,student_department,student_current_semester,student_address,student_contact_number) values
    ('Ram Poudel','IT','3rd','Kathmandu',9845697859);
Insert into Student(student_name,student_department,student_current_semester,student_address,student_contact_number) values
    ('Prem kc','Engineering','2nd','Bhatapur',984569459723);
Insert into Student(student_name,student_department,student_current_semester,student_address,student_contact_number) values
    ('Pratiba Magar','IT','3rd','Biratnagar',9845697547);
select * from Student_Account;


create table Teacher(
    teacher_id varchar(5) primary key,
    teacher_name varchar(25),
    teacher_address varchar(20),
    contact_number  int unique,
    join_date Timestamp
);

create table Teacher_account(
    teacher_account_id varchar(5) primary key,
    total_salary varchar(5),
    remaining_salary varchar(5),
    last_transaction_date Timestamp,
    salary_taken varchar(30)
);
create sequence teacher_id_sequence
      start with 1
      Increment by 1;
Select * from Teacher_account;

select 
     Teacher.teacher_id,
     Teacher.teacher_name,
     Teacher.teacher_address,
     Teacher.contact_number,
     Teacher_account.total_salary
From Teacher
Left join Teacher_account on Teacher.teacher_id = Teacher_account.teacher_account_id
where total_salary =2000;
     

create or replace trigger teacher_id_trigger
before insert on Teacher
for each row 
declare
    v_teacher_id varchar(5);
begin
     v_teacher_id := 't' || teacher_id_sequence.NEXTVAL;
     Insert into Teacher_account(teacher_account_id,total_salary,remaining_salary,last_transaction_date,salary_taken)
     values (v_teacher_id,'0','0',NULL,'0');
     :NEW.teacher_id := v_teacher_id;
End;
/


Insert into Teacher(teacher_name,teacher_address,contact_number,join_date) values('Bikas Dhakal','Kathmandu',9845678945,Timestamp '2022-1-15 14:30:00' );
Insert into Teacher(teacher_name,teacher_address,contact_number,join_date) values('Mina Kumari','Patan',9845678874,Timestamp '2022-2-15 2:30:00' );
Insert into Teacher(teacher_name,teacher_address,contact_number,join_date) values('Ram K.c','Baglung',9845678569,Timestamp '2022-3-30 1:25:00' );
Insert into Teacher(teacher_name,teacher_address,contact_number,join_date) values('Sita Pradhan','Kathmandu',9845678666,Timestamp '2022-3-31 1:3:00' );
Select * from Teacher;

Select * from Teacher_account;

create table Staff(
    staff_id varchar(5) primary key,
    staff_name varchar(25),
    staff_role varchar(20),
    staff_address varchar(20),
    contact_number  int unique,
    join_date Timestamp
);
create table Staff_account(
    staff_account_id varchar(5) primary key,
    total_salary varchar(5),
    remaining_salary varchar(5),
    last_transaction_date Timestamp,
    salary_taken varchar(30)
);

   


create sequence staff_id_sequence
      start with 1
      Increment by 1;


create or replace trigger staff_id_trigger
before insert on Staff
for each row 
declare
    v_staff_id varchar(5);
begin
     v_staff_id := 'st' || staff_id_sequence.NEXTVAL;
     Insert into Staff_account(staff_account_id,total_salary,remaining_salary,last_transaction_date,salary_taken)values(v_staff_id,'0','0',NULL,'0');
     :NEW.staff_id := v_staff_id;
End;
/

Insert into Staff(staff_name,staff_role,staff_address,contact_number,join_date) values('Shuba Tamang','Cleaning','Kathmandu',98465987623,Timestamp '2022-1-15 14:30:00');
Insert into Staff(staff_name,staff_role,staff_address,contact_number,join_date) values('Sita Poudel','Cooking','Sagarmatha',98465987625,Timestamp '2022-1-16 10:30:00');
Insert into Staff(staff_name,staff_role,staff_address,contact_number,join_date) values('Binita Kc','Helper','Hetauda',98465987627,Timestamp '2022-5-15 11:30:00');
Insert into Staff(staff_name,staff_role,staff_address,contact_number,join_date) values('Rita Magar','Cleaning','Pokhara',98465987648,Timestamp '2022-6-15 12:30:00');

select * from Staff;
select * from Staff_account;






-- Procedure to  Paying fee for student
Create or Replace Procedure pay_fee(
      p_student_id in varchar2,
      p_amount_paid in varchar2
)
As
     v_total_fee varchar2(10);
     v_remaining_fee varchar2(10);
Begin
     select total_fee,remaining_fee into v_total_fee,v_remaining_fee
     from Student_Account
     where student_account_id = p_student_id;

     v_remaining_fee := To_Char(To_number(v_total_fee)-To_number(p_amount_paid));
     update Student_Account
     set remaining_fee = v_remaining_fee,
         last_transaction_date = SYSTIMESTAMP,
         paid_amount = p_amount_paid
    where  student_account_id = p_student_id;
End pay_fee;
/
select * from Student_Account

Execute pay_fee('s21',3000);
--------Procedure for Admin to deposite Salary of Teacher to Teacher_Account at Monthend------------------
create or replace procedure deposite_salary_to_teacher_account(
    p_teacher_id in varchar2,
    p_salary_to_deposite in varchar2
    
)
as 
   v_total_salary varchar2(10);
   v_remaining_salary varchar2(10);

begin
   select total_salary,remaining_salary into v_total_salary,V_remaining_salary
   from Teacher_account
   where teacher_account_id = p_teacher_id;
  
   v_total_salary := To_char(To_number(V_remaining_salary) + To_number(p_salary_to_deposite));
   v_remaining_salary := v_total_salary;
   update Teacher_account
   set total_salary = v_total_salary,
       remaining_salary = v_remaining_salary
   where 
       teacher_account_id = p_teacher_id;

End deposite_salary_to_teacher_account;
/
select * from Teacher;
Execute deposite_salary_to_teacher_account('t1',2000);
  
--------Procedure for Admin to deposite Salary of Teacher to Staff_Account at Monthend------------------

create or replace procedure deposite_salary_to_staff_account(
    p_staff_id in varchar2,
    p_salary_to_deposite in varchar2
    
)
as 
   v_total_salary varchar2(10);
   v_remaining_salary varchar2(10);

begin
   select total_salary,remaining_salary into v_total_salary,V_remaining_salary
   from Staff_account
   where staff_account_id = p_staff_id;
  
   v_total_salary := To_char(To_number(V_remaining_salary) + To_number(p_salary_to_deposite));
   v_remaining_salary := v_total_salary;
   update Staff_account
   set total_salary = v_total_salary,
       remaining_salary = v_remaining_salary
   where 
       staff_account_id = p_staff_id;

End deposite_salary_to_staff_account;
/
select * from Staff_account
execute deposite_salary_to_staff_account('st1',800);


---------Procedure to withdraw salary for Teacher-----------
create or replace procedure salary_withdraw_teacher(
    p_teacher_id in varchar2,
    p_salary_withdraw in varchar2
)
as 
   v_total_salary varchar2(10);
   v_remaining_salary varchar2(10);
begin 
   select total_salary,remaining_salary into v_total_salary,v_remaining_salary
   from Teacher_account
   where teacher_account_id = p_teacher_id;
   If To_number(v_remaining_salary) >= To_number(p_salary_withdraw) Then
  
       v_remaining_salary := To_Char(To_number(v_remaining_salary)-To_number(p_salary_withdraw));
       update Teacher_account
       set remaining_salary = v_remaining_salary,
          last_transaction_date = SYSTIMESTAMP,
          salary_taken = p_salary_withdraw
       where teacher_account_id = p_teacher_id;
       DBMS_OUTPUT.PUT_LINE('Salary Withdraw successfully');
   else
       DBMS_OUTPUT.PUT_LINE('sorry!!!InSufficient Balance.');
   end If;
           
End salary_withdraw_teacher;
/
---------Procedure to withdraw salary for Staff----------


create or replace procedure salary_withdraw_staff(
    p_staff_id in varchar2,
    p_salary_withdraw in varchar2
)
as 
   v_total_salary varchar2(10);
   v_remaining_salary varchar2(10);
begin 
   select total_salary,remaining_salary into v_total_salary,v_remaining_salary
   from Staff_account
   where staff_account_id = p_staff_id;
   If To_number(v_remaining_salary) >= To_number(p_salary_withdraw) Then
  
       v_remaining_salary := To_Char(To_number(v_remaining_salary)-To_number(p_salary_withdraw));
       update Staff_account
       set remaining_salary = v_remaining_salary,
          last_transaction_date = SYSTIMESTAMP,
          salary_taken = p_salary_withdraw
       where staff_account_id = p_staff_id;
       DBMS_OUTPUT.PUT_LINE('Salary Withdraw successfully');
   else
       DBMS_OUTPUT.PUT_LINE('sorry!!!InSufficient Balance.');
   end If;
           
End salary_withdraw_staff;
/
select * from Staff_account;

Execute salary_withdraw_staff('st1',400);





create or replace type Sport_and_Library_Department as object(
    Item_Name varchar(30),
    Quantity int 
)Not Final;

create or replace type Sport_Department under Sport_and_Library_Department();
create table Sport_Items of Sport_Department;
Insert into Sport_Items(Item_Name,Quantity) values ('Football', 5);
Insert into Sport_Items(Item_Name,Quantity) values ('Basketball', 5);
Insert into Sport_Items(Item_Name,Quantity) values ('TT', 20);
Insert into Sport_Items(Item_Name,Quantity) values ('CriketSet', 2);
select * from Sport_Items;
drop table Sport_Items;

create or replace type Library_Department under Sport_and_Library_Department();
create table Books_Items of Library_Department;
Insert into Books_Items(Item_Name,Quantity) values ('C++', 50);
Insert into Books_Items(Item_Name,Quantity) values ('DSA', 50);
Insert into Books_Items(Item_Name,Quantity) values ('Python', 50);
Insert into Books_Items(Item_Name,Quantity) values ('Calculas', 50);

create or replace type Sport_and_Library_Department_Issued_and_Return_Item as object(
    Issuder_id varchar(20),
    Issed_item varchar(20),
    Issed_quantity varchar(5) ,
    Issued_date timestamp,
    Return_date timestamp,
    Days_Issued number,
    Return_stattus varchar2(3),
    Fine_Amount varchar2(5)
)Not Final;
create or replace type Sport_Department__Issued_and_Return_Item under Sport_and_Library_Department_Issued_and_Return_Item();
create table Sport_Items__Issued_and_Return_Item of Sport_Department__Issued_and_Return_Item;
-- drop table Sport_Items__Issued_and_Return_Item;


create or replace procedure update_sport_items(
    p_issuder_id varchar2,
    p_issed_item varchar2,
    p_issed_quantity varchar2,
    p_issed_date timestamp
)
as 
begin 
   update Sport_Items
   set Quantity = Quantity - to_number(p_issed_quantity)
   where Item_Name = p_issed_item;
end;
/

create or replace trigger  Sport_Department__Issued_and_Return_Item_Trigger
After insert on Sport_Items__Issued_and_Return_Item
for each row
Begin
    update_sport_items(:new.Issuder_id,:new.Issed_item, :new.Issed_quantity,:new.Issued_date);
End;
/
select * from Student;

Insert into Sport_Items__Issued_and_Return_Item (Issuder_id,Issed_item,Issed_quantity,Issued_date,Return_date,Days_Issued,Return_stattus,Fine_Amount)Values
('s1','Football',3,To_TIMESTAMP('2022-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),NULL,NULL,NULL,NULL);
Insert into Sport_Items__Issued_and_Return_Item (Issuder_id,Issed_item,Issed_quantity,Issued_date,Return_date,Days_Issued,Return_stattus,Fine_Amount)Values
('s2','TT',3,To_TIMESTAMP('2022-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),NULL,NULL,NULL,NULL);


select * from Sport_Items__Issued_and_Return_Item;


CREATE OR REPLACE PROCEDURE return_sport_items(
    p_issuder_id VARCHAR2,
    p_issed_item VARCHAR2,
    p_issed_quantity VARCHAR2,
    p_return_date TIMESTAMP
)
AS
  v_total_return_quantity VARCHAR2(10);
  v_quantity VARCHAR2(10);
  v_days_diff NUMBER;
  v_issued_date TIMESTAMP;
BEGIN
  -- Use a cursor to handle multiple rows in the SELECT
  FOR c IN (
    SELECT Issed_quantity, Issued_date
    FROM Sport_Items__Issued_and_Return_Item
    WHERE Issuder_id = p_issuder_id
      AND Issed_item = p_issed_item
  )
  LOOP
    v_total_return_quantity := c.Issed_quantity;
    v_issued_date := c.Issued_date;
  END LOOP;

  -- Use a cursor to handle multiple rows in the SELECT
  FOR c IN (
    SELECT Quantity
    FROM Sport_Items
    WHERE Item_Name = p_issed_item
  )
  LOOP
    v_quantity := c.Quantity;
  END LOOP;

  -- Check if returned quantity is less than or equal to issued quantity
  IF TO_NUMBER(p_issed_quantity) = TO_NUMBER(v_total_return_quantity) THEN
    -- Update Sport_Items only if the condition is met
    UPDATE Sport_Items
    SET Quantity = TO_NUMBER(v_quantity) + TO_NUMBER(p_issed_quantity)
    WHERE Item_Name = p_issed_item;
    v_days_diff := EXTRACT(DAY FROM (p_return_date - v_issued_date));

    -- Update existing row in Sport_Items__Issued_and_Return_Item
    UPDATE Sport_Items__Issued_and_Return_Item
    SET Return_date = p_return_date,
        Days_Issued = v_days_diff,
        Return_stattus = 'YES',
        Fine_Amount =
          CASE
            WHEN v_days_diff > 10 AND v_days_diff <= 20 THEN 50
            WHEN v_days_diff > 20 AND v_days_diff <= 30 THEN 100
            ELSE 500
          END
    WHERE Issuder_id = p_issuder_id
      AND Issed_item = p_issed_item;

    DBMS_OUTPUT.PUT_LINE('Update');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Sorry!!! Issued and Return quantity do not match.');
  END IF;
END return_sport_items;
/
Execute return_sport_items('s1','Football',3,To_TIMESTAMP('2022-10-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));



Alter Table Student_Account 
add constraint stu
foreign key(student_account_id) references Student(Student_id);

Alter Table Sport_Items__Issued_and_Return_Item
add constraint stsp
foreign key(Issuder_id) references Student(Student_id);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------JOIN TABLE------------------------------------------------------------------------------------------------------------
select 
   Student.student_name,
   Student.student_department,
   Student.student_current_semester,
   Student.student_address,
   Student.student_contact_number,
   Student_Account.remaining_fee,
   Sport_Items__Issued_and_Return_Item.Issed_item,
   Sport_Items__Issued_and_Return_Item.Issed_quantity,
   Sport_Items__Issued_and_Return_Item.Fine_Amount
From Student 
Left join Student_Account on Student.Student_id = Student_Account.student_account_id
Right join Sport_Items__Issued_and_Return_Item on Student.Student_id = Sport_Items__Issued_and_Return_Item.Issuder_id
where    Student_Account.remaining_fee = 8000   and    Sport_Items__Issued_and_Return_Item.Fine_Amount =500;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------UNION-------------------------------------------------------------------------------------------------------------------------------------------
      
select 
     Teacher.teacher_id,
     Teacher.teacher_name,
     Teacher.teacher_address,
     Teacher.contact_number,
     Teacher_account.total_salary
From Teacher
Left join Teacher_account on Teacher.teacher_id = Teacher_account.teacher_account_id
where total_salary =2000
Union
Select
   Staff.staff_id,
   Staff.staff_name,
   Staff.staff_address,
   Staff.contact_number,
   Staff_account.total_salary
From Staff
Right Join Staff_account on Staff.staff_id = Staff_account.staff_account_id
where    Staff_account.total_salary = 800;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   
   
    

   

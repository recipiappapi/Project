DROP TABLE Library;
DROP SEQUENCE boo_seq;

DROP TABLE Books;
Drop PROCEDURE add_book();
Drop PROCEDURE remove_book();


DROP TABLE Journals;
DROP PROCEDURE add_journal();
DROP PROCEDURE remove_journal();

DROP TABLE Library_Members_Details_Tables;
DROP TYPE Library_Members_Details;
DROP TYPE Library_Members;

DROP TRIGGER update_return_status_book;

DROP TYPE ISSUED_AND_RETURN;

DROP TYPE BOOKS_ISSUED_AND_RETURN_DETAILS;
Drop TABLE BOOKS_ISSUEDANDRETURN_RECORDS;
Drop TABLE JOURNALS_ISSUEDANDRETURN_RECORDS;

DROP TYPE JOURNALS_ISSUED_AND_RETURN_DETAILS;
DROP TABLE JOURNALS_FINEAMOUNT;
DROP TRIGGER update_return_status_journals;


-- Create Library table

CREATE TABLE Library (
    Library_ID NUMBER(5) PRIMARY KEY,
    Name VARCHAR(50),
    Phone INTEGER
);

--Inserting into the table
Insert into  Library (Library_ID,Name,Phone) values (05,'IT_Libary',0557894);

-- Create Books table with a sequence for Book_ID
CREATE SEQUENCE boo_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE Books (
    Book_ID NUMBER(5) PRIMARY KEY,
    Book_Author VARCHAR(25),
    Book_Name VARCHAR(25),
    Library_ID NUMBER(5),
    CONSTRAINT fk_library FOREIGN KEY (Library_ID) REFERENCES Library(Library_ID)
);

-- Create procedure with the correct sequence name
CREATE OR REPLACE PROCEDURE add_book(
    p_Book_ID NUMBER,
    p_Library_ID NUMBER,
    p_Book_Author VARCHAR,
    p_Book_Name VARCHAR
) AS
BEGIN
    INSERT INTO Books (Book_ID, Book_Author, Book_Name, Library_ID)
    VALUES (p_Book_ID, p_Book_Author, p_Book_Name, p_Library_ID);
END add_book;

-- Adding The Books
DECLARE
    v_Library_ID NUMBER := 05; -- Use the appropriate Library_ID
    v_Book_Details SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
        'Ram Kumar|DSA',
        'Shyam Hari|DataBase',
        'Alice Poudel|C++',
        'Pritam Kumar|Linear Algebra',
        'Purna Bdr Kc|Statistics'
        -- Add more book details as needed
    );
    v_Book_Author VARCHAR2(25);
    v_Book_Name VARCHAR2(25);
    v_Book_ID NUMBER;
BEGIN
    -- Loop through the book details and add each book
    FOR i IN 1..v_Book_Details.COUNT LOOP
        -- Split the book details into author and title
        SELECT REGEXP_SUBSTR(v_Book_Details(i), '[^|]+', 1, 1) INTO v_Book_Author FROM DUAL;
        SELECT REGEXP_SUBSTR(v_Book_Details(i), '[^|]+', 1, 2) INTO v_Book_Name FROM DUAL;

        -- Specify the Book_ID (replace with your desired value)
        v_Book_ID := 100 + i; -- Replace with your desired logic for Book_ID

        -- Call the add_book procedure with the specified Book_ID
        add_book(v_Book_ID, v_Library_ID, v_Book_Author, v_Book_Name);
    END LOOP;
END;
/

select * from Books;

--Procedure That removes Books 
CREATE OR REPLACE PROCEDURE remove_book(
    p_Book_ID NUMBER
) AS
BEGIN
    DELETE FROM Books WHERE Book_ID = p_Book_ID;
    COMMIT; -- Ensure the changes are committed
    DBMS_OUTPUT.PUT_LINE('Book removed: ' || p_Book_ID);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found with Book_ID: ' || p_Book_ID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error removing book: ' || SQLERRM);
END remove_book;
/

-------------------------------------------------------------------------------------------------calling function----------------------------------------------------------------------------------------------------
BEGIN
    remove_book(101); -- Replace with the actual BOOK_ID
END;
/

Select * from Books;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Journals (
    Journal_ID NUMBER(5) PRIMARY KEY,
    Journal_Author VARCHAR(100),
    Journal_Name VARCHAR(100),
    Library_ID NUMBER(5),
    CONSTRAINT fk_j FOREIGN KEY (Library_ID) REFERENCES Library(Library_ID)
);

-- Create procedure with the correct sequence name
CREATE OR REPLACE PROCEDURE add_journal(
    p_Journal_ID NUMBER,
    p_Library_ID NUMBER,
    p_Journal_Author VARCHAR,
    p_Journal_Name VARCHAR
) AS
BEGIN
    INSERT INTO Journals (Journal_ID, Journal_Author, Journal_Name, Library_ID)
    VALUES (p_Journal_ID, p_Journal_Author, p_Journal_Name, p_Library_ID);
END add_journal;

-- Adding The Journals
DECLARE
    v_Library_ID NUMBER := 05; -- Use the appropriate Library_ID
    v_Journal_Details SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
        'Pratiba Patel|Web Developemnt',
        'Alice Pratap|Face Recognition',
        'Sushma Kiran|AI',
        'Dina Nath|ChatBot'
    );
    v_Journal_Author VARCHAR2(100);
    v_Journal_Name VARCHAR2(100);
    v_Journal_ID NUMBER;
BEGIN
    -- Loop through the journal details and add each journal
    FOR i IN 1..v_Journal_Details.COUNT LOOP
        -- Split the journal details into author and title
        SELECT REGEXP_SUBSTR(v_Journal_Details(i), '[^|]+', 1, 1) INTO v_Journal_Author FROM DUAL;
        SELECT REGEXP_SUBSTR(v_Journal_Details(i), '[^|]+', 1, 2) INTO v_Journal_Name FROM DUAL;

        -- Specify the Journal_ID (replace with your desired value)
        v_Journal_ID := 200 + i; -- Replace with your desired logic for Journal_ID

        -- Call the add_journal procedure with the specified Journal_ID
        add_journal(v_Journal_ID, v_Library_ID, v_Journal_Author, v_Journal_Name);
    END LOOP;
END;
SELECT * FROM JOURNALS;

---------------------------------------------------------------------------------------------- Function for Romoving Journals---------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE remove_journal(
    p_Journal_ID NUMBER
) AS
BEGIN
    DELETE FROM Journals  WHERE Journal_ID = p_Journal_ID;
    COMMIT; -- Ensure the changes are committed
    DBMS_OUTPUT.PUT_LINE('Journal  removed: ' || p_Journal_ID);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Journal not found with Journal_ID: ' || p_Journal_ID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error removing Journal: ' || SQLERRM);
END remove_journal;
/
---------------------------------------------------------------------------------------------------Calling Function remove_journal()--------------------------------------------------------------------------------
----See table before any modification--------
select * from Journals;
---------------------------------------------After Calling Function with modification-------------------------------------------
BEGIN
    remove_journal(127);
END;
/
COMMIT;
----------------------------------------------See table Journals After any modification--------------------------------------------------------------------------
select * from Journals;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------CREATING TABLE LIBRARY MEMBER-------------------------------------------------------------------------------------

    
create or replace type Library_Members as object(
        Member_Name varchar(30),
        Address varchar(30),
        Joined_date TimeStamp
)Not final;

CREATE or REPLACE TYPE Library_Members_Details  under Library_Members(
    Member_ID number(20),
    Member_Role Varchar(30),
    Department Varchar(30),
    Mobile_number number(15)

);
Create Table Library_Members_Details_Tables of Library_Members_Details(primary key(Member_ID),unique(Mobile_number));


------------------------Inserting Data into table Library_Members_Details_Tables-----------------------------------------------
INSERT INTO Library_Members_Details_Tables VALUES ('Ram Pratap','Kathmandu',SYSTIMESTAMP,001,'Teacher','IT',9843215987);
INSERT INTO Library_Members_Details_Tables VALUES ('Bikas Nath','Birgunj',SYSTIMESTAMP,002,'Student','IT',9843215887);
INSERT INTO Library_Members_Details_Tables VALUES ('Sita Nuepane','Sagarmatha',SYSTIMESTAMP,003,'Student','Engineering',9843217987);
INSERT INTO Library_Members_Details_Tables VALUES ('Prabesh Bhujel','Kathmandu',SYSTIMESTAMP,004,'Teacher','Engineering',9847215987);
INSERT INTO Library_Members_Details_Tables VALUES ('Shyam Kumar','Pokhara',SYSTIMESTAMP,005,'Teacher','IT',98437715987);

select * from Library_Members_Details_Tables;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------BOOK AND JOURNALS ISSUED AND RETURN RECORDS---------------------------------------------------------------------------------------------------------
-------------------------------FOR BOOKS AND FINE AMOUNT------------------------------------------------------------------
create or replace type ISSUED_AND_RETURN as object(
    ISSUEDER_ID NUMBER(10) ,
    ISSUEDER_NAME VARCHAR2(20)
)Not final;

CREATE or REPLACE TYPE BOOKS_ISSUED_AND_RETURN_DETAILS  under ISSUED_AND_RETURN(
    TRANCTION_BOOK_ID VARCHAR(10),
    BOOK_ID NUMBER(20),
    BOOK_NAME VARCHAR(30),
    ISSUED_DATE TIMESTAMP,
    ISSUED_TYPE_QUANTITY NUMBER(10),
    RETRUN_DATE DATE,
    DAYS_ISSUED NUMBER,
    RETURN_STATUS VARCHAR2(3)
);
Create Table BOOKS_ISSUEDANDRETURN_RECORDS of BOOKS_ISSUED_AND_RETURN_DETAILS(primary key(TRANCTION_BOOK_ID));


CREATE TABLE BOOKS_FINEAMOUNT (
    TRANCTION_BOOK_ID number(20) primary key  ,
    ISSUEDER_ID NUMBER(10)  ,
    ISSUEDER_NAME VARCHAR2(20),
    BOOK_ID VARCHAR2(20),
    BOOK_NAME VARCHAR(50),
    FINE_AMOUNT NUMBER
);
select * from BOOKS_FINEAMOUNT;
CREATE OR REPLACE TRIGGER update_return_status_book
BEFORE INSERT OR UPDATE ON BOOKS_ISSUEDANDRETURN_RECORDS
FOR EACH ROW
DECLARE
    v_days_diff NUMBER;
BEGIN
    IF :NEW.RETRUN_DATE IS NOT NULL THEN
        -- Calculate days as a number
        v_days_diff := EXTRACT(DAY FROM (:NEW.RETRUN_DATE - :NEW.ISSUED_DATE));
        :NEW.DAYS_ISSUED := v_days_diff;
        :NEW.RETURN_STATUS := 'YES';
    ELSE
        -- Calculate days as a number
        v_days_diff := EXTRACT(DAY FROM (SYSDATE - :NEW.ISSUED_DATE));
        :NEW.DAYS_ISSUED := v_days_diff;
        :NEW.RETURN_STATUS := 'NO';
    END IF;

    -- Check if fine is needed based on the range of days issued
    IF v_days_diff > 10 AND v_days_diff <= 20 THEN
        INSERT INTO BOOKS_FINEAMOUNT (TRANCTION_BOOK_ID,ISSUEDER_ID, ISSUEDER_NAME, BOOK_ID, BOOK_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_BOOK_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.BOOK_ID, :NEW.BOOK_NAME, 50);
    ELSIF v_days_diff > 20 AND v_days_diff <= 30 THEN
        INSERT INTO BOOKS_FINEAMOUNT (TRANCTION_BOOK_ID,ISSUEDER_ID, ISSUEDER_NAME, BOOK_ID, BOOK_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_BOOK_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.BOOK_ID, :NEW.BOOK_NAME, 100);
    ELSE
        INSERT INTO BOOKS_FINEAMOUNT (TRANCTION_BOOK_ID,ISSUEDER_ID, ISSUEDER_NAME, BOOK_ID, BOOK_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_BOOK_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.BOOK_ID, :NEW.BOOK_NAME, 500);
    END IF;
END update_return_status_book;
/
INSERT INTO BOOKS_ISSUEDANDRETURN_RECORDS(TRANCTION_BOOK_ID,ISSUEDER_ID,ISSUEDER_NAME,BOOK_ID,BOOK_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (1,001,'Ram Kumar',101,'DSA',TO_TIMESTAMP('2022-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-21', 'YYYY-MM-DD'));
INSERT INTO BOOKS_ISSUEDANDRETURN_RECORDS(TRANCTION_BOOK_ID,ISSUEDER_ID,ISSUEDER_NAME,BOOK_ID,BOOK_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (2,002,'Bikas Nath',103,'C++	',TO_TIMESTAMP('2022-09-06 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-26', 'YYYY-MM-DD'));
INSERT INTO BOOKS_ISSUEDANDRETURN_RECORDS(TRANCTION_BOOK_ID,ISSUEDER_ID,ISSUEDER_NAME,BOOK_ID,BOOK_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (3,003,'Sita Nuepane	',102,'DataBase',TO_TIMESTAMP('2022-09-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-8', 'YYYY-MM-DD'));
INSERT INTO BOOKS_ISSUEDANDRETURN_RECORDS(TRANCTION_BOOK_ID,ISSUEDER_ID,ISSUEDER_NAME,BOOK_ID,BOOK_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (4,004,'Prabesh Bhujel	',105,'Statistics',TO_TIMESTAMP('2022-09-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2023-01-21', 'YYYY-MM-DD'));
SELECT * FROM BOOKS_FINEAMOUNT;

ALTER TABLE BOOKS_ISSUEDANDRETURN_RECORDS
ADD CONSTRAINT fk_Libary_Book
FOREIGN KEY (ISSUEDER_ID) REFERENCES Library_Members_Details_Tables(Member_ID);

ALTER TABLE BOOKS_ISSUEDANDRETURN_RECORDS
ADD CONSTRAINT fk_Libary_Book_Details
FOREIGN KEY (Book_ID) REFERENCES Books (Book_ID);

ALTER TABLE BOOKS_FINEAMOUNT
ADD CONSTRAINT fk_Libary_Book_Details_and_fine
FOREIGN KEY (TRANCTION_BOOK_ID) REFERENCES BOOKS_ISSUEDANDRETURN_RECORDS (TRANCTION_BOOK_ID);

-----------------------------------------------------------------------------------------------FOR JOURNALS---------------------------------------------------------------------------------------------------------

CREATE or REPLACE TYPE JOURNALS_ISSUED_AND_RETURN_DETAILS  under ISSUED_AND_RETURN(
    TRANCTION_JOURNAL_ID VARCHAR(10),
    JOURNAL_ID NUMBER(20),
    JOURNAL_NAME VARCHAR(30),
    ISSUED_DATE TIMESTAMP,
    ISSUED_TYPE_QUANTITY NUMBER(10),
    RETRUN_DATE DATE,
    DAYS_ISSUED NUMBER,
    RETURN_STATUS VARCHAR2(3)
);



CREATE TABLE JOURNALS_FINEAMOUNT (
    TRANCTION_JOURNAL_ID VARCHAR(10) primary key,
    ISSUEDER_ID NUMBER(10)  ,
    ISSUEDER_NAME VARCHAR2(20),
    JOURNAL_ID VARCHAR2(20),
    JOURNAL_NAME VARCHAR(50),
    FINE_AMOUNT NUMBER
);
Create Table JOURNALS_ISSUEDANDRETURN_RECORDS of JOURNALS_ISSUED_AND_RETURN_DETAILS( primary key(TRANCTION_JOURNAL_ID));

-- Create the trigger to automatically update RETURN_STATUS and DAYS_ISSUED

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------TRIGGER FOR THE update_return_status_jOURNALS----------------------------------------------------------------------
CREATE OR REPLACE TRIGGER update_return_status_journals
BEFORE INSERT OR UPDATE ON JOURNALS_ISSUEDANDRETURN_RECORDS
FOR EACH ROW
DECLARE
    v_days_diff NUMBER;
BEGIN
    IF :NEW.RETRUN_DATE IS NOT NULL THEN
        -- Calculate days as a number
        v_days_diff := EXTRACT(DAY FROM (:NEW.RETRUN_DATE - :NEW.ISSUED_DATE));
        :NEW.DAYS_ISSUED := v_days_diff;
        :NEW.RETURN_STATUS := 'YES';
    ELSE
        -- Calculate days as a number
        v_days_diff := EXTRACT(DAY FROM (SYSDATE - :NEW.ISSUED_DATE));
        :NEW.DAYS_ISSUED := v_days_diff;
        :NEW.RETURN_STATUS := 'NO';
    END IF;

    -- Check if fine is needed based on the range of days issued
    IF v_days_diff > 10 AND v_days_diff < 20 THEN
        INSERT INTO JOURNALS_FINEAMOUNT (TRANCTION_JOURNAL_ID,ISSUEDER_ID, ISSUEDER_NAME, JOURNAL_ID, JOURNAL_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_JOURNAL_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.JOURNAL_ID, :NEW.JOURNAL_NAME, 100);
    ELSIF v_days_diff >= 20 AND v_days_diff < 30 THEN
        INSERT INTO JOURNALS_FINEAMOUNT (TRANCTION_JOURNAL_ID,ISSUEDER_ID, ISSUEDER_NAME, JOURNAL_ID, JOURNAL_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_JOURNAL_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.JOURNAL_ID, :NEW.JOURNAL_NAME, 200);
    ELSE
        INSERT INTO JOURNALS_FINEAMOUNT (TRANCTION_JOURNAL_ID,ISSUEDER_ID, ISSUEDER_NAME, JOURNAL_ID, JOURNAL_NAME, FINE_AMOUNT)
        VALUES (:NEW.TRANCTION_JOURNAL_ID,:NEW.ISSUEDER_ID, :NEW.ISSUEDER_NAME, :NEW.JOURNAL_ID, :NEW.JOURNAL_NAME, 800);
    END IF;
END update_return_status_journals;
/
INSERT INTO JOURNALS_ISSUEDANDRETURN_RECORDS(TRANCTION_JOURNAL_ID,ISSUEDER_ID,ISSUEDER_NAME,JOURNAL_ID,JOURNAL_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (1,001,'Ram Pratap	',201,'Web Developemnt',TO_TIMESTAMP('2022-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-21', 'YYYY-MM-DD'));
INSERT INTO JOURNALS_ISSUEDANDRETURN_RECORDS(TRANCTION_JOURNAL_ID,ISSUEDER_ID,ISSUEDER_NAME,JOURNAL_ID,JOURNAL_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (2,003,'Sita Nuepane',203,'AI',TO_TIMESTAMP('2022-09-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-5', 'YYYY-MM-DD'));
INSERT INTO JOURNALS_ISSUEDANDRETURN_RECORDS(TRANCTION_JOURNAL_ID,ISSUEDER_ID,ISSUEDER_NAME,JOURNAL_ID,JOURNAL_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (3,002,'Bikas Nath',204,'ChatBot',TO_TIMESTAMP('2022-09-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2022-09-30', 'YYYY-MM-DD'));
INSERT INTO JOURNALS_ISSUEDANDRETURN_RECORDS(TRANCTION_JOURNAL_ID,ISSUEDER_ID,ISSUEDER_NAME,JOURNAL_ID,JOURNAL_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (4,004,'Prabesh Bhujel	',202,'Face Recognition	',TO_TIMESTAMP('2022-09-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2023-1-16', 'YYYY-MM-DD'));
INSERT INTO JOURNALS_ISSUEDANDRETURN_RECORDS(TRANCTION_JOURNAL_ID,ISSUEDER_ID,ISSUEDER_NAME,JOURNAL_ID,JOURNAL_NAME,ISSUED_DATE,ISSUED_TYPE_QUANTITY,RETRUN_DATE) VALUES (5,005,'Shyam Kumar',204,'ChatBot',TO_TIMESTAMP('2022-09-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),1,TO_DATE('2023-01-02', 'YYYY-MM-DD'));
select * from Journals;

ALTER TABLE JOURNALS_ISSUEDANDRETURN_RECORDS
ADD CONSTRAINT fk_Libary_journal
FOREIGN KEY (ISSUEDER_ID) REFERENCES Library_Members_Details_Tables(Member_ID);

ALTER TABLE JOURNALS_ISSUEDANDRETURN_RECORDS
ADD CONSTRAINT fk_Libary_journal_Details
FOREIGN KEY (Journal_ID) REFERENCES Journals (Journal_ID);

ALTER TABLE JOURNALS_FINEAMOUNT
ADD CONSTRAINT fk_Libary_Book_Details_and_fine
FOREIGN KEY (TRANCTION_JOURNAL_ID) REFERENCES JOURNALS_ISSUEDANDRETURN_RECORDS (TRANCTION_JOURNAL_ID);

--------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------Q.N-1(JOIN THREE TABLES USING JOIN)----------------------------------------------------------------------------------------------------
SELECT * FROM BOOKS_FINEAMOUNT;

SELECT
    Library_Members_Details_Tables.MEMBER_NAME,
    Library_Members_Details_Tables.ADDRESS,
    Library_Members_Details_Tables.MEMBER_ID,
    Library_Members_Details_Tables.MEMBER_ROLE,
    Library_Members_Details_Tables.DEPARTMENT,
    BOOKS_ISSUEDANDRETURN_RECORDS.BOOK_ID,
    BOOKS_ISSUEDANDRETURN_RECORDS.BOOK_NAME,
    BOOKS_ISSUEDANDRETURN_RECORDS.DAYS_ISSUED,
    BOOKS_FINEAMOUNT.FINE_AMOUNT
FROM BOOKS_ISSUEDANDRETURN_RECORDS
LEFT JOIN Library_Members_Details_Tables on  BOOKS_ISSUEDANDRETURN_RECORDS.ISSUEDER_ID = Library_Members_Details_Tables.Member_ID
RIGHT JOIN Books on BOOKS_ISSUEDANDRETURN_RECORDS.Book_ID = Books.Book_ID
lEFT JOIN  BOOKS_FINEAMOUNT ON BOOKS_ISSUEDANDRETURN_RECORDS.TRANCTION_BOOK_ID = BOOKS_FINEAMOUNT.TRANCTION_BOOK_ID
WHERE BOOKS_FINEAMOUNT.FINE_AMOUNT>50 ;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------Q.N-2 (UNION)----------------------------------------------------------------------------------------------------------------------------
SELECT
    Library_Members_Details_Tables.MEMBER_NAME,
    Library_Members_Details_Tables.ADDRESS,
    Library_Members_Details_Tables.MEMBER_ID,
    Library_Members_Details_Tables.MEMBER_ROLE,
    Library_Members_Details_Tables.DEPARTMENT,
    BOOKS_ISSUEDANDRETURN_RECORDS.BOOK_ID,
    BOOKS_ISSUEDANDRETURN_RECORDS.BOOK_NAME,
    BOOKS_ISSUEDANDRETURN_RECORDS.DAYS_ISSUED,
    BOOKS_FINEAMOUNT.FINE_AMOUNT
FROM BOOKS_ISSUEDANDRETURN_RECORDS
LEFT JOIN Library_Members_Details_Tables on  BOOKS_ISSUEDANDRETURN_RECORDS.ISSUEDER_ID = Library_Members_Details_Tables.Member_ID
RIGHT JOIN Books on BOOKS_ISSUEDANDRETURN_RECORDS.Book_ID = Books.Book_ID
lEFT JOIN  BOOKS_FINEAMOUNT ON BOOKS_ISSUEDANDRETURN_RECORDS.TRANCTION_BOOK_ID = BOOKS_FINEAMOUNT.TRANCTION_BOOK_ID
WHERE BOOKS_FINEAMOUNT.FINE_AMOUNT>50
UNION
SELECT
    Library_Members_Details_Tables.MEMBER_NAME,
    Library_Members_Details_Tables.ADDRESS,
    Library_Members_Details_Tables.MEMBER_ID,
    Library_Members_Details_Tables.MEMBER_ROLE,
    Library_Members_Details_Tables.DEPARTMENT,
    JOURNALS_ISSUEDANDRETURN_RECORDS.JOURNAL_ID,
    JOURNALS_ISSUEDANDRETURN_RECORDS.JOURNAL_NAME,
    JOURNALS_ISSUEDANDRETURN_RECORDS.DAYS_ISSUED,
    JOURNALS_FINEAMOUNT.FINE_AMOUNT
FROM JOURNALS_ISSUEDANDRETURN_RECORDS
LEFT JOIN Library_Members_Details_Tables on  JOURNALS_ISSUEDANDRETURN_RECORDS.ISSUEDER_ID = Library_Members_Details_Tables.Member_ID
RIGHT JOIN Journals on JOURNALS_ISSUEDANDRETURN_RECORDS.Journal_ID = Journals.Journal_ID
lEFT JOIN  JOURNALS_FINEAMOUNT ON JOURNALS_ISSUEDANDRETURN_RECORDS.TRANCTION_JOURNAL_ID = JOURNALS_FINEAMOUNT.TRANCTION_JOURNAL_ID
WHERE JOURNALS_FINEAMOUNT.FINE_AMOUNT>=100 ;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------CURRENT_TIMESTAMP-------------------------------------------------------------------------------------------------------
SELECT
    Member_Name,
    Address,
    Member_ID,
    Member_Role,
    Department,
    Joined_date
FROM
    Library_Members_Details_Tables
WHERE
    Joined_date >= CURRENT_TIMESTAMP - INTERVAL '1' YEAR;

-----------------------------------------------------------------------------------------------------------------PARTATION--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select TRANCTION_BOOK_ID,
  sum(FINE_AMOUNT) over(order by FINE_AMOUNT rows between unbounded preceding and current row) as Runningtotal,
  avg(FINE_AMOUNT) over(order by FINE_AMOUNT rows between unbounded preceding and unbounded following) as avg,
  min(FINE_AMOUNT) over(order by FINE_AMOUNT rows between unbounded preceding and unbounded following) as min,
  max(FINE_AMOUNT) over(order by FINE_AMOUNT rows between unbounded preceding and unbounded following) as max
from BOOKS_FINEAMOUNT;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------NESTED QURIES---------------------------------------------------------------------------------------------------------
select Library_Members_Details_Tables.MEMBER_NAME,Library_Members_Details_Tables.ADDRESS,Library_Members_Details_Tables.MEMBER_ROLE,
   Library_Members_Details_Tables.DEPARTMENT,Library_Members_Details_Tables.MOBILE_NUMBER
FROM Library_Members_Details_Tables
WHERE Library_Members_Details_Tables.MEMBER_ID IN(
    SELECT BOOKS_FINEAMOUNT.ISSUEDER_ID
    FROM BOOKS_FINEAMOUNT
    WHERE BOOKS_FINEAMOUNT.FINE_AMOUNT > 50
);

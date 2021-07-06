#29 june 2021

#Functions
-- That taken an input frim you and deliver an output

#Character Functions

#Numeric Finctions
#Date functions
#Advanced Functions
#Logical Functions


#Character Functions


-- ASCII

select ascii("a")

select ascii("Amit")


#Char_length
-- This function gives the length of the character
select char_length("wiley mthree")

#Count the length of customer names in order table

use superstore2

select `customer name`, char_length(`customer name`) from tbl_orders

select `customer name`, character_length(`customer name`) from tbl_orders

char_length
character_length


#concat

select concat("Sachin"," ", "Tendulkar")


select concat("Sachin ",null,"Tend")

-- concat_ws
select concat_ws("-","Sachin","Tendulkar")



-- Feild: It returns the index of the character

select field("i", "a","m","i")


select field("Amit","ram","shyam","ami")

select field(1,4,5,6,1)


-- Find_in_set

select find_in_set("i", "a,m,i,t")

-- insert

select insert("This is a good day",6,2,"was")
select insert("This is a good day",8,1," extremely ")

This is extremely a good day


-- instr
-- This function is used to find the positioj of a characer in the string

select instr("Wiley","E")


--lcase 

select lcase("SUMMERS")

select ucase("summers")

-- left
-- iT extrcts number of charactes from the left

select left("Canada",2)


select * from tbl_orders

select distinct left(`customer name`, instr(`customer name`,' ')) from tbl_orders;

Claire Gute
Darrin Van Huff
select `customer name` , left(`customer name`,instr(`customer name`," ")) from tbl_orders


char_length
character_length
length

Amit Kumar


select right("Canada",2)

-- write a query to give First and LastName

select instr("This is a good day", " is ")



select right(`customer name`,length(`customer name`)- instr(`customer name`," ")) 

from  tbl_orders 

Claire Gute

len - pos of spave

select `customer name`, left(`customer name`,instr(`customer name`," ")) as "first name",  
right(`customer name`,instr(`customer name`," ")) as "last name" from tbl_orders;


locate-- We use this function to find the positon of character

select locate("is", "This is a good day", 5)


select locate("is", "This ist is a good day", instr("This is a good day","is")+2)


Left
Right
mid -- this extracts the data from the middle


select mid("Sachin",3,2)




Sachin Ramesh Tendulkar
Subhasj Chander Bose


select mid("Sachin Ramesh Tendulkar",instr("Sachin Ramesh Tendulkar"," ")+1,
locate(" ","Sachin Ramesh Tendulkar",instr("Sachin Ramesh Tendulkar"," ")+1)-instr("Sachin Ramesh Tendulkar"," ")
) 

SELECT LEFT(RIGHT("sachin ramesh tendulkar",LENGTH("sachin ramesh tendulkar")-instr("sachin ramesh tendulkar"," ")),INSTR(
					RIGHT("sachin ramesh tendulkar",LENGTH("sachin ramesh tendulkar")-instr("sachin ramesh tendulkar"," "))," "))

select substring("Sachin Ramesh tendulkar",instr("Sachin Ramesh tendulkar"," ")+1,locate(" ","Sachin Ramesh tendulkar",instr("Sachin Ramesh tendulkar"," ")))



-- Position  -- This also give position of the character

select position("is" in "This is a good day")

-- Replace -- this function replaces the instances of the particular string. This is case sensitive

select replace("This Is a great day","is", "an")

-- Reverse this function reverses the string

select reverse("Apple")

--  RPAD this is a function that add extra text to complete the no of characters

select rpad("123", 5,"0")

-- RTRIM This function removes the trailing spaces from the text
select rtrim("Wiley         ")
Wiley
-- 

Try LPAD and LTRIM



-- strcpm -- this function is used to compare two strings

select strcmp("Wilez","Wiley")

Aman
Suman

select strcmp('ziley','zilea')

zilea
ziley

str1=str2 --- 0
str1<str2 --- -1
str1>str2 --- 1


-- substr -- This will exctract the part of the string

select substr("Wiley SQL Sessions",7 , 100)



-- substring substr -- This will exctract the part of the string



select substring("Wiley SQL Sessions",-5,3 )


string, position, length
-- substring_index  this returns the string before the specified delimiter

select substring_index("This is a good day","i",1)
delimiter

ABC-123-0111
Amit Kumar

#Numeric Functions

ABS 
select abs(-10.3)

-- round
select round(sum(sales),2) from tbl_orders

select round(10.34322,2)

Write a query to fetch sum, min, max sales till 2 decimal places


-- Ceiling
select ceiling(2.9)

-- Floor
select floor(2.9)

div -- division
select 10 div 2


-- greatest
select greatest(10,30,5,90)



-- least



select power(2,3)
sqrt
sin
tan

select rand()

select truncate(100.356,2), round(100.356,2), ceiling(100.356), floor(100.356)


#Date Functions


select curdate()

select curtime()

select current_timestamp()





use mthree_june;
CREATE table cards
(Card_Num text,Date_ date, Status_ text);

insert into cards
values('c2' , '2021-07-15', 'Activated'),('c3' , '2021-01-11 ', 'Activated');


select * from cards


select card_num,year(date_) as year ,status_ from cards  
order by card_num,year(date_) ;

select * from cards
group by Card_num
order by Status_;


select year(date_) as yr,card_num, status_ from cards
order by yr desc, status_


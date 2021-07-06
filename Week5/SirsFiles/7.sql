select ascii ("amit")

select char_length("wiley mthree")

use superstore

select `customer name`,char_length(`customer name`) from tbl_orders;

select concat("sacin ", "Tendulkar")
select concat_ws("_","sacin", "Tendulkar")

select field("a","a","s")

select `customer name`, left(`customer name`,instr(`customer name`," ")) as "first name",  
right(`customer name`,instr(`customer name`," ")) as "last name" from tbl_orders;

select locate(("")

select mid("sachin",3,2)

select locate("is", "This ist is a good day", instr("This is a good day","is")+1)
select locate("is", "This ist is a good day", instr("This is a good day","is")+1)

select mid("sachin",3,2)

select mid("Sachine Ramesh Tendulkar",instr("Sachine Ramesh Tendulkar","Ramesh"),6) as middle_name;

select mid("Sachin Ramesh Tendulkar",instr("Sachin Ramesh Tendulkar"," ")+1,
locate(" ","Sachin Ramesh Tendulkar",instr("Sachin Ramesh Tendulkar"," ")+1)-instr("Sachin Ramesh Tendulkar"," ")
)

select position("is" in "This is a good day")
select replace("This is a excellent day","a","an")

select reverse("apple")

select rpad("123",5,"0")
select lpad("123",5,"0")

select rtrim("wiley      ")
select ltrim("                    wiley      ")

select strcmp("Wiley","wiley")

select substr("Wiley SQL sessions", -7, 3)

select substring_index("This is a good day", " ", 2)
select substring_index("This is a good day", "i", 1)





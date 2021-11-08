# sql-challenge

# Intro

The purpose of this project was to practice surface level importing/exporting of data into a SQL Server before passing various queries over the Database.

# Data Set 
![departments](resources/departments.csv)
![dept_emp](resources/dept_emp.csv)
![dept_manger](resources/dept_manger.csv)
![employees](resources/employees.csv)
![salaries](resources/salaries.csv)
![titles](resources/titles.csv)

The data set consists of a collection of CSV files offering information concerning the staff make-up of a fictional Department Store.

# Method

The first step was to construct the tables to correspond with the appropriate CSV files. This was accomplished using 
<http://www.quickdatabasediagrams.com/> but could also be done through the SQL application.

 After table construction was complete, the data within the tables was examined to consider where primary and foreign keys would be placed between tables, as well as the relationships between the keys themselves. 

Now that the groundwork was laid out and the tables constructed but empty it was time for the importing of information. I ran into a critical issue during this step; the data would not always import because of the constraints added during the construction phase of the tables. I had to drop all tables then run all text above the ALTER... section at the bottom. 

That fixed the problem and allowed me to move on to queries and analysis.

# Analysis

This project was more about how to proceed to the analysis of information and less about presenting a concept within the data to compare/consider and as a result there was not much critical thinking.

I will say that at first I felt there were some redundancies with the separation of information in the database we were instructed to build. 

Why have a table for managers separate from the employees? After all the mangers are employees so there could just be a boolean value to designate the difference, eliminating the need for department_employees and department_managers. 

However, after considering the queries that could be needed by someone in this field/particular job, I understood that having this separation from the beginning eliminated the need for separating managers when passing queries because it was already done.

This idea strengthened the importance of having an Entity Relationship Diagram (ERD) during the building of a database. Without the visual to guide my joining, the pathways would not have been as simple. ERD's are fantastic and I love that there is a software available to streamline the thinking process by allowing easier construction of what can be a monster of a task. ERD construction is a skill that is developed over time because most of the difficulty lies in thinking about future needs and building a system that won't need continuous changes to succeed. 

# Conclusion

Learning to create databases in SQL was quite enjoyable and allows for the segregation of information with the goal of streamlining analysis. It is fun and challenging to construct Entity Relationship Diagrams however proficiency in that skill will be crucial for success in large projects.

One of my challenges being new to SQL was understanding the executional hierarchy of functions. Coming from knowing mostly Python, which is another high-level language, the order in which SQL executes functions was throwing me for a loop for the first two class sub-modules.


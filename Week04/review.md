# Review Questions

1. What application model typically displays the user interface in a Web browser?

- [ ] a. client/server
- [ ] b. two-tier
- [x] c. three-tier
- [ ] d. thin-tier

2. Which of the following is not a type of stored program unit in PL/SQL?

- [ ] a. procedure
- [x] b. application trigger
- [ ] c. package
- [ ] d. database trigger

3. The term “named program unit” indicates which of the following?

- [x] a. The PL/SQL block is assigned a name so that it can be saved and reused.
- [ ] b. The PL/SQL block is of a certain type.
- [ ] c. The PL/SQL block is executable as an anonymous block.
- [ ] d. The PL/SQL block is saved client side.

4. Any application model usually represents which of the following basic components? (Choose all that apply.)

- [x] a. user interface
- [x] b. program logic
- [ ] c. coding style
- [x] d. database

5. When working with an Oracle database, which of the following is considered an advantage of PL/SQL? (Choose all that apply.)

- [x] a. tight integration with SQL
- [ ] b. easier naming conventions
- [x] c. tighter security
- [x] d. improved performance

6. Which of the following is a free GUI tool from Oracle for editing PL/SQL?

- [ ] a. SQL*Plus
- [ ] b. Oracle Developer
- [x] c. Oracle SQL Developer
- [ ] d. Only third-party tools are available.

7. Which of the following is an Oracle tool included with the Oracle database server that allows sending SQL and PL/SQL statements to the server?

- [x] a. SQL*Plus
- [ ] b. PL/SQL Builder
- [ ] c. PL/SQL Creator
- [ ] d. Procedure Builder

8. A procedural programming language allows including which of the following?

- [x] a. decision-making logic
- [ ] b. inserts
- [ ] c. DML statements
- [ ] d. table creation statements

9. “Application portability” refers to the capability to .

- [ ] a. upload and download
- [ ] b. create a small executable
- [x] c. move to other computer platforms
- [ ] d. transmit data efficiently

10. A two-tier application model is commonly referred to as a(n) application model.

- [ ] a. n-tier
- [x] b. client/server
- [ ] c. double-layered
- [ ] d. user-database

11. Name the four types of stored program unit structures and the basic differences between them.

- Procedure: a named PL/SQL block that performs an action.
- Function: a named PL/SQL block that returns a value.
- Package: a group of related procedures, functions, and other program objects.
- Trigger: a set of instructions that are automatically executed or fired in response to certain events on a particular table or view.

12. If you aren’t using Oracle development tools, such as Oracle Forms, should you pursue learning PL/SQL? Why or why not?
  Yes, learning PL/SQL can still be beneficial even if you aren't using Oracle development tools like Oracle Forms. PL/SQL is a powerful and versatile programming language for working with Oracle databases. It allows you to write stored procedures, functions, and triggers, enhancing the capabilities and efficiency of your database applications.
13. Describe the major difference between a two-tier and a three-tier application model.

- In a two-tier model (client/server), the application is divided into a client-side interface and a server-side database. The client handles the user interface and application logic, while the server manages the database.
- In a three-tier model, there is an additional layer known as the application server. The three tiers are:
    1. User Interface (Client): Handles presentation and user interaction.
    1. Application Server: Manages application logic and processing.
    1. Database Server: Stores and retrieves data.

14. Describe what a user interface is and the role a procedural language plays in user interfaces.

- A user interface (UI) is the point of interaction between the user and a computer application. It includes visual elements such as screens, pages, and graphical elements, as well as the functionality provided to the user. A procedural language, like PL/SQL, can play a role in user interfaces by providing the underlying logic and functionality needed to process user input, interact with the database, and generate dynamic content in response to user actions. PL/SQL can be used to handle business rules, data validation, and other aspects of application logic within the user interface.

# Chapter Summary

- Programmers can use a procedural language to code a logical sequence of steps for making decisions and instructing the computer on what tasks to perform.
- SQL is used for creating and manipulating a database, but it’s not a procedural language.
- PL/SQL is a procedural language, and the Oracle database and software tools contain a PL/SQL processing engine.
- PL/SQL improves application portability because it can be processed on any platform Oracle runs on.
- Using PL/SQL can improve security because users don’t need to be granted direct access to database objects.
- Applications contain three main components: a user interface, program logic, and a database.
- The two-tier or client/server application model splits programming logic between the client machine and the database server.
- The three-tier application model places much of the program code on an application server (the middle tier).
- Programming code on the client machine is referred to as client-side code, and code on the database server is referred to as server-side code.
- A named program unit is a block of PL/SQL code that has been saved and assigned a name so that it can be reused.
- A stored program unit is a named program unit that’s saved in the database and can be shared by applications. Procedures and functions are named program units that are called to perform a specific task.
- A database trigger is PL/SQL code that’s processed automatically when a particular DML action occurs. A package is a structure that allows grouping functions and procedures into one container.
- An application event is some activity that occurs, such as a user clicking an item onscreen, which causes some processing to occur.
- Documentation is available on the Oracle Technology Network (OTN) Web site.
- Both SQL*Plus and SQL Developer are Oracle software tools that allow submitting SQL and PL/SQL statements directly to the Oracle server. Oracle SQL Developer is a software tool for creating and testing program units.
- Many third-party software tools are available for developing PL/SQL program units.
- You need to review a database’s ERD before you can work with the data effectively.
- You need to be familiar with SQL statement syntax before learning PL/SQL.

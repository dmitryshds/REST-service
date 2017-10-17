# Spring REST service

This application was created and testing using:
Spring-Boot 1.5.7 (Security,Data,Test),  PostgreSQL-9.4 , H2(for test)
Thymeleaf,Bootstrap-4.0.0-beta,JQuery-3.2.1, Maven-3.0.5;
This application uses a different approach for obtaining data(JSON,XML).
## Getting Started

To initialize Data base in folder /resouses  file import.sql is present.(Credential for test: User{login:11,password:11} Admin{login:admin, password:admin}   )
Another way you can change property spring.jpa.hibernate.ddl-auto=create 
The user can register, go to User page and create an order (or orders).
User can not get the right access to Admin page.
The administrator can do all the CRUD operations with users and orders.


## Running the tests
For test running use maven - test - run 
select orderNumber, requiredDate, shippedDate, status, comments from orders where shippedDate > requiredDate;

select customerName as 'big spender' from customers where customerNumber=(select customerNumber from payments where amount=(select max(amount) from payments));

select orderdetails.orderNumber, products.productName, orderdetails.quantityOrdered from orderdetails join products on orderdetails.productCode=products.productCode order by orderdetails.orderNumber;

select distinct employees.employeeNumber, employees.lastName, employees.firstName from employees join customers on employees.employeeNumber=customers.salesRepEmployeeNumber;

select employees.officeCode, offices.city, offices.state, offices.country, count(*) as 'totalEmployeesHere' from employees join offices on offices.officeCode=employees.officeCode group by officeCode order by officeCode;

select distinct customers.customerName as 'good customers', customers.addressLine1, customers.addressLine2, count(*) from payments join orders on payments.paymentDate < orders.shippedDate join customers on orders.customerNumber=customers.customerNumber group by customers.customerName order by count(*) desc limit 10;

select productlines.productLine, products.productName from productlines join products on products.productLine=productlines.productLine;
 
select productName as 'ford things', productLine, MSRP from products where productName like '%Ford%' order by productLine;

select customerName as 'boat enthusiasts' from customers where customerNumber in (select customerNumber from orders where orderNumber in (select orderNumber from orderdetails where productCode in (select productCode from products where productName like '%Boat%')));

select distinct employees.jobTitle, employees.firstName, employees.lastName, offices.phone, employees.extension from offices right join employees on employees.officeCode=offices.officeCode and employees.officeCode!=4;
create database motorcycle_part_sales;
use motorcycle_part_sales;

select *
from sales;

/* You're working for a company that sells motorcycle parts, and they've asked with some help in analyzing their sales data!
They operate three warehouses in the area, selling both retail and wholesale. 
They offer a variety of parts and accept credit card, cash, and bank transfer as payment methods. However, each payment type incurs a different fee.
The board of directors want to gain a better understanding of wholesale revenue by product line, 
and how this varies month-to-month and across warehouses. You have been tasked with calculating net revenue for each product line, 
grouping results by month and warehouse. The results should be filtered so that only "Wholesale" orders are included.

They have provided you with access to their database, which contains the following table called sales: */

SELECT 
    product_line,
    CASE WHEN EXTRACT(MONTH FROM date) = 6 THEN 'June'
         WHEN EXTRACT(MONTH FROM date) = 7 THEN 'July'
         WHEN EXTRACT(MONTH FROM date) = 8 THEN 'August'
    END as month,
    warehouse,
    ROUND(SUM(total * (1 - payment_fee)), 2) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, warehouse, month
ORDER BY product_line, month, net_revenue DESC;





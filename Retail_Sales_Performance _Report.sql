--Project Data Analysis for Retail - Sales Performance Report

--Overall Performance by Year
select 
year(order_date) years,
sum(sales) sales,
count(order_status) as number_of_order
from dqlab_sales_store
where order_status = 'order finished'
group by years;

--Overall Performance by Product Sub Category
select
year(order_date) years,
product_sub_category,
sum(sales) sales
from dqlab_sales_store
where order_status = 'order finished' and year(order_date) in ('2011','2012')
group by years, product_sub_category
order by years, sales DESC

--Promotion Effectiveness and Efficiency by Years
select 
year(order_date) years,
sum(sales) sales,
sum(discount_value) promotion_value,
round((sum(discount_value)/sum(sales))*100,2) as burn_rate_percentage
from dqlab_sales_store
where order_status ='order finished'
group by years;

--Promotion Effectiveness and Efficiency by Product Sub Category
select
year(order_date) years,
product_sub_category, product_category,
sum(sales) sales,
sum(discount_value) promotion_value,
round((sum(discount_value)/sum(sales))*100,2) burn_rate_percentage
from dqlab_sales_store
where order_status = 'order finished' and year(order_date) ='2012'
group by years, product_sub_category, product_category
order by sales DESC;

--Customers Transactions per Year
select
year(order_date) years,
count(distinct customer) number_of_customer
from dqlab_sales_store
where order_status ='order finished'
group by years;

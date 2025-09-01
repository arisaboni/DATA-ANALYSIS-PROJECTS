










		select * from Mobile_Phone_Transactions;

		---Revenue Generated for the year
		select Sum(Total_Revenue) As Total_Revenue_Generated
		from Mobile_Phone_Transactions;



		---Total_Quantity_of_Goods_Sold_for_the_Year
		select sum(Units_Sold) As Total_Quantity_of_Goods_Sold_for_the_Year
		from Mobile_Phone_Transactions;



		---Total Quantity of Goods Sold for each month
		SELECT FORMAT(End_of_Month, 'MMM') AS Purchase_Month, sum(Units_Sold) As Total_Quantity_Sold
		FROM Mobile_Phone_Transactions
		Group by End_of_Month
		order by Total_Quantity_Sold desc;


		--- Revenue generated for each month
		SELECT FORMAT(End_of_Month, 'MMM') AS Purchase_Month, sum(Total_Revenue) As Revenue_Generated
		FROM Mobile_Phone_Transactions
		Group by End_of_Month
		order by Revenue_Generated desc;



		---Number of products marketed
		select count(distinct Mobile_Model) As products_Marketed
		from Mobile_Phone_Transactions;


		


		---Total Quantity Sold from each product
		select Mobile_Model, sum(Units_Sold) As Total_Quantity_Sold
		from Mobile_Phone_Transactions
		group by Mobile_Model
		order by Total_Quantity_Sold desc;


		--- Revenu Generated from each product
		select Mobile_Model, Sum(Total_Revenue) As Revenue_Generated
		from Mobile_Phone_Transactions
		group by Mobile_Model
		order by Revenue_Generated desc;


		


		---Highest_Quantity_Sold_of_each_Product
		select  Mobile_Model, max(Units_Sold) As Highest_Quantity_Sold_of_Product
		from Mobile_Phone_Transactions
		group by Mobile_Model
		order by Highest_Quantity_Sold_of_product desc;



		---Highest_Revenue_Generated_of_each_Product
		select Mobile_Model, max(Total_Revenue) As Highest_Revenue_Generated_of_Product
		from Mobile_Phone_Transactions
		group by Mobile_Model
		order by Highest_Revenue_Generated_of_product desc;


		---Showing Total Quantity of each Product Purchased Relative to Customer_Age_Group, CUstomer_Gender and Country.
		select Customer_Age_Group, Customer_Gender, Country,  Mobile_Model, sum(Units_Sold) As Total_Quantity_of_Product_Purchased
		from Mobile_Phone_Transactions
		group by Customer_Age_Group, Customer_Gender, Country, Mobile_Model
		order by Customer_Age_Group, Total_Quantity_of_Product_Purchased desc;


		


		--- The average selling price by customer age group
		select Customer_Age_Group, Avg(Price) As Average_price
		from Mobile_Phone_Transactions
		Group by Customer_Age_Group
		order by Average_price desc;



		---Top 3 customer age groups by total revenue
		select top(3) Customer_Age_Group, Total_Revenue
		from Mobile_Phone_Transactions
		group by Customer_Age_Group, Total_Revenue
		order by  Total_Revenue desc;


		---How male and female customers differ in purchasing behavior (units sold and price)
		select Customer_Gender, Avg(Units_Sold) As Average_Quantity_Sold, Avg(Price) As Average_Purchasin_Price
		from Mobile_Phone_Transactions
		group by Customer_Gender
		order by Average_Quantity_Sold, Average_Purchasin_Price desc;


		---The performance of each sales channel relative to revenue generated and units sold.
		select Sales_Channel, Avg(Total_Revenue) As Average_Revenue_Generated , Avg(Units_Sold) As Average_Quantity_Sold
		from Mobile_Phone_Transactions
		group by Sales_Channel
		order by Average_Revenue_Generated, Average_Quantity_Sold desc;


		---The most used payment type and the one that generates the highest revenue.
		select Payment_Type, count(Payment_Type) As N0_of_Occurence_of_Payment_Type, Sum(Total_Revenue) As Revenue_generated
		from Mobile_Phone_Transactions
		group by Payment_Type
		order by N0_of_Occurence_of_Payment_Type, Revenue_generated desc;


		--- The breakdown of payment types used by gender
		select Payment_Type, Customer_Gender, count(Customer_Gender) As No_of_Occurence_of_each_Gender
		from Mobile_Phone_Transactions
		group by Payment_Type, Customer_Gender
		order by No_of_Occurence_of_each_Gender desc;


		---  The average price per storage size for each brand.
		select Storage_Size, Avg(Price) As Average_Price
		from Mobile_Phone_Transactions
		group by Storage_Size
		order by Storage_Size,  Average_Price
		

		--- The color and storage size combination that is most preferred by customers
		select Color, Storage_Size, sum(Units_Sold) As Total_Quantity_Sold
		from Mobile_Phone_Transactions
		group by Color, Storage_Size
		order by  Total_Quantity_Sold desc;


		---  The best-selling model for each brand
		select Brand, Mobile_Model, sum(Units_Sold) As Total_Quantity_Sold
		from Mobile_Phone_Transactions
		group by Brand, Mobile_Model
		order by  Total_Quantity_Sold desc;


		---  The total revenue and units sold relative to country and city.
		select country, city, sum(total_revenue) As Total_Revenue
		from Mobile_Phone_Transactions
		group by Country, City
		order by Total_Revenue desc;


		--- The total units sold relative to country and city.
		select country, city, sum(units_sold) As Total_Quantity_Sold
		from Mobile_Phone_Transactions
		group by Country, City
		order by Total_Quantity_Sold desc;



		---  City that recorded the highest.
		select City, max(Units_Sold) As Highest_Quantity_Sold
		from Mobile_Phone_Transactions
		group by City
		order by Highest_Quantity_Sold desc;

		
		--- The city that recorded the lowest sales.
		select City, min(Units_Sold) As Lowest_Quantity_Sold
		from Mobile_Phone_Transactions
		group by City
		order by Lowest_Quantity_Sold



		--- The average revenue per customer by country
		select Customer_Age, Country, Avg(Total_Revenue) As Average_Revenue
		from Mobile_Phone_Transactions
		group by Customer_Age, Country
		order by Average_Revenue desc;


		--- The City and country combinations that contributed most to Z Fold 6 sales
		select City, Country
		from Mobile_Phone_Transactions
		where Mobile_Model = 'Z Fold 6'


		--- List of countries number  of the cusromers
		select Country, count(distinct City) As No_of_Cities
		from Mobile_Phone_Transactions
		group by Country
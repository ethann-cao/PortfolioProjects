SELECT * 
FROM portfolio_projects.`walmartsalesdata.csv` ;

 -- Create time_of_day column --
 -- Giving insight onto which time of day where the most sales are generally made  --
 
Select Time, 
(CASE 
	WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN `Time` BETWEEN "12:0:01" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening"
    END
    )
FROM portfolio_projects.`walmartsalesdata.csv`;

ALTER TABLE portfolio_projects.`walmartsalesdata.csv` ADD day_name varchar(255);

UPDATE portfolio_projects.`walmartsalesdata.csv` 
SET Time_Of_Day = (CASE 
	WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN `Time` BETWEEN "12:0:01" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening"
    END
);

 -- Create day_name column --
 -- Giving insight onto which day where the most sales are generally made  --
 
SELECT date, DAYNAME(date)
FROM portfolio_projects.`walmartsalesdata.csv`;

ALTER TABLE portfolio_projects.`walmartsalesdata.csv` ADD day_name varchar(255);

UPDATE portfolio_projects.`walmartsalesdata.csv` 
SET day_name = DAYNAME(date);

 -- Create month_name column --
 -- Giving insight onto which month most sales are generally made  --

ALTER TABLE portfolio_projects.`walmartsalesdata.csv` ADD month_name varchar(255);

SELECT date, monthname(date)
FROM portfolio_projects.`walmartsalesdata.csv`;

UPDATE portfolio_projects.`walmartsalesdata.csv` 
SET month_name =  monthname(date);


-- How many unique cities does the data have? --

-- ANSWER: 3 --

SELECT 
	DISTINCT City 
FROM portfolio_projects.`walmartsalesdata.csv`;


-- In which city is each branch? -- 

SELECT 
	DISTINCT CITY, BRANCH
FROM portfolio_projects.`walmartsalesdata.csv`;


-- How many unique product lines does the data have? -- 
-- 6 --
SELECT COUNT(DISTINCT `Product line`)
FROM portfolio_projects.`walmartsalesdata.csv`;

-- What is the most common payment method?--
-- EWallet --
SELECT Payment, COUNT(Payment)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Payment 
ORDER BY  COUNT(Payment) DESC
;

-- What is the most selling product line? -- 
-- Fashion Accessories --

SELECT `Product line`, (COUNT(`Product line`))
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Product line`
ORDER BY (COUNT(`Product line`)) desc
LIMIT 1
;

-- What is the total revenue by month?--

SELECT month_name, SUM(total) as Total_Revenue
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY month_name
ORDER BY Total_Revenue DESC ;

-- What month had the largest COGS? -- 

SELECT month_name, SUM(cogs) as sum_cogs
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY month_name
ORDER BY sum_cogs DESC ;

-- What product line had the largest revenue? --
SELECT `Product line`, Sum(Total)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Product line`
ORDER BY `Product line`;

-- What is the city with the largest revenue? -- 
SELECT Branch, City, SUM(Total) as revenue
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Branch,City
ORDER BY revenue DESC
LIMIT 1
;


-- What product line had the largest VAT? -- 

SELECT `Product line`, AVG(`Tax 5%`) as VAT
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Product line`
ORDER BY VAT DESC;

-- Fetch each product line and add a column to those product line showing "Good", 
 -- "Bad". Good if its greater than average sales --
 
 
SELECT `Product line`
FROM portfolio_projects.`walmartsalesdata.csv`
;

-- Which branch sold more products than average product sold?--
SELECT Branch, SUM(Quantity) 
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY branch
HAVING SUM(Quantity) > (Select AVG(Quantity) FROM portfolio_projects.`walmartsalesdata.csv`)
;

-- What is the most common product line by gender? --
-- female -- 
SELECT  `Product line`, Count(Gender) 
FROM portfolio_projects.`walmartsalesdata.csv`
where Gender = "Female"
GROUP BY `Product line` 
ORDER BY Count(Gender) desc
;
-- male -- 
SELECT  `Product line`, Count(Gender) 
FROM portfolio_projects.`walmartsalesdata.csv`
where Gender = "Male"
GROUP BY `Product line` 
ORDER BY Count(Gender) desc
;

-- What is the average rating of each product line? -- 

SELECT  `Product line`, ROUND(AVG(Rating),2) as avg_rating
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Product line` 
ORDER BY avg_rating desc
;

-- Number of sales made in each time of the day per weekday--
SELECT time_of_day, count(time_of_day) as times
FROM portfolio_projects.`walmartsalesdata.csv`
group by time_of_day
ORDER BY times DESC;

-- Which of the customer types brings the most revenue? --
SELECT `Customer type`, SUM(Total)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Customer type`
ORDER BY SUM(Total) DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?--

SELECT City, SUM(`Tax 5%`)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY City
order by SUM(`Tax 5%`) DESC;

-- Which customer type pays the most in VAT? -- 
SELECT `Customer type`, SUM(`Tax 5%`)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Customer type`
ORDER BY SUM(`Tax 5%`) DESC;

-- How many unique customer types does the data have? --

SELECT COUNT(DISTINCT `Customer type`) as count_type
FROM portfolio_projects.`walmartsalesdata.csv`;

-- How many unique payment methods does the data have?
SELECT COUNT(DISTINCT Payment) as Payment_types
FROM portfolio_projects.`walmartsalesdata.csv`;

-- What is the most common customer type?
SELECT `Customer type`, count( `Customer type`)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Customer type`;

-- Which customer type buys the most? -- 
SELECT `Customer type`, sum(Quantity)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY `Customer type`;

-- What is the gender of most of the customers?
SELECT Gender, Count(Gender)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Gender;


-- What is the gender distribution per branch?
SELECT Branch, Gender, Count(Gender)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Gender, Branch 
ORDER BY Branch;

-- Which time of the day do customers give most ratings?
SELECT Time_Of_Day, Count(Rating)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Time_Of_Day
ORDER BY Count(Rating) desc;

-- Which time of the day do customers give most ratings per branch?
SELECT Branch, Time_Of_Day, Count(Rating)
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY Time_Of_Day, Branch
ORDER BY Branch, Count(Rating) desc;

-- Which day of the week has the best avg ratings?
SELECT day_name, ROUND(avg(Rating),2) AS avg_rating
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY day_name
ORDER BY avg_rating desc;

-- Which day of the week has the best average ratings per branch?
SELECT branch, day_name, ROUND(avg(Rating),2) AS avg_rating
FROM portfolio_projects.`walmartsalesdata.csv`
GROUP BY branch, day_name
ORDER BY branch, avg_rating desc;

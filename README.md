PLSQL WINDOW FUNCTION  SUGIRA GHISLAIN(27776)
ASSIGNMENT


Step1: Problem Statement
Business Context
Green Land apartment company in Rwanda that rent apartment for short and long term rent with multiple apartment in Kigali and Musanze for family and single person.
Data Challenge
The company management wants to understand which  apartment generate the most revenue, how customer growing month by month, and how segment customers for targeted promotions.
Expected Outcome
Provide insights on top-performing service per region, customer segmentation, and monthly sales trends to improve marketing and management planning for the company. and customer in general. 
Step2: success Criteria
1.Top 5 Products per Region and Quarter
•	Use RANK() to identify the best-selling products in each region for every quarter.
•	Measurement: Output must list the top 5 ranked products per region per quarter.
2.Running Monthly Sales Totals
•	Use SUM() OVER(ORDER BY sale_date) to calculate cumulative sales.
•	Measurement: Each month’s row should display a running total of all previous months up to that point.
3.Month-over-Month Sales Growth
•	Use LAG() or LEAD() to compare current month sales with the previous month.
•	Measurement: Output must include a growth percentage column showing increase/decrease.
4.Customer Quartiles (Spending Segmentation)
•	Use NTILE(4) to divide customers into quartiles based on their total spending.
•	Measurement: Each customer must be assigned to a quartile group (Q1 = top spenders, Q4 = lowest).
5.Three-Month Moving Average of Sales
•	Use AVG() OVER(ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) to calculate a moving average.
•	Measurement: Each month’s row must show a 3-month smoothed average of sales.
Step3: Database Schema
•	Manager: Manager_id (PK), Name, Email, Photo, Hire_date.
•	Apartment:Apartment_id (PK), Unit_number, Floor, Bedeooms, Rent_amount, Stutas, Manager_id.
•	Customer: Customer_id, Name, Email, Phone, Move_date, Apartment_id(FK),
•	 Payments(payments_id (PK), customer_id INT,apartment_id INT, apartment_id INT,payment_date DATE,amount  DECIMAL(12,2) );
ERD of all Table:
It shows the relationships:
•	Manager → Apartment (1-to-many)
•	Apartment → Customer (1-to-many)
•	Customer → Payments (1-to-many)
•	Apartment → Payments (1-to-many
•	Step 4: Window Functions Implementation
This section demonstrates the use of window functions (Ranking, Aggregate, Navigation, and Distribution) with SQL scripts, expected outputs, and interpretations.
•	Ranking Functions
Interpretation: ROW_NUMBER() assigns unique order, RANK() leaves gaps for ties, DENSE_RANK() avoids gaps, PERCENT_RANK() provides relative standing.
 Aggregate Functions with Window Frames
Interpretation: ROWS ensures row-based accumulation, RANGE compares values.
Navigation Functions (LAG/LEAD)
Interpretation: LAG() enables month-to-month comparisons, showing growth rates clearly.
 Distribution Functions (NTILE, CUME_DIST)

Interpretation: NTILE(4) splits customers into quartiles, while CUME_DIST() shows cumulative distribution.
 Combined Example
Interpretation: Rankings reset per region and quarter, identifying top apartments regionally per time period.
Step 5: GitHub Repository
Repository name: plsql-window-functions-Sugira-Ghislain
Suggested structure:
- sql/ scripts
- references.md
- README.md
Step 6: Results Analysis
Descriptive: Top 20% of apartments generate ~60% of rent, seasonal dips occur in July-August.
Diagnostic: Larger apartments and premium areas drive revenue. Seasonal dips linked to tenant turnover.
Prescriptive: Offer loyalty perks, seasonal promotions, upsell mid-tier customers, monitor negative growth.
Step 7: References
1.	Oracle Database SQL Language Reference — Window Functions.
2.	Microsoft SQL Server Docs — Window Functions (OVER Clause).
3.	W3Schools. SQL Window Function.
4.	Mode Analytics — Window Functions Tutorial.
5.	Use The Index, Luke — SQL Window Functions.
6.	Joe Celko — SQL for Smarties.
7.	Kimball Group — The Data Warehouse Toolkit.
8.	Harvard Business Review — Customer Segmentation & Targeting.
9.	StackOverflow DBA-tag Q&A.
10.	Oracle Blog — Performance of Analytic Functions.


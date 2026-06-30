# Logistics_Operation_Analysis_Project

### Project Overview
This project focused on analyzing a multi-table logistics operations database to uncover operational, financial, fleet management, delivery, and driver performance insights. This report presents a comprehensive data analysis for Aerolink logistics, a logistics and freight trucking company and it operations across a three-year period from January 2022 to December 2024.The project used SQL for data cleaning, exploration, transformation, and analytical querying, while Microsoft Excel was recommended for dashboard development and business visualization. The analysis aimed to improve delivery efficiency, optimize fleet utilization, reduce operational costs, and identify high-performing operational assets.

### Data Source
The dataset used for this project was a Logistics Operations relational database consisting of multiple CSV files representing core logistics business entities such as trips, loads, customers, drivers, trucks, trailers, fuel purchases, maintenance records, and delivery events.

### Business Problem Definition
The logistics company required operational intelligence to improve efficiency and reduce costs. The analysis focused on identifying operational bottlenecks, high-performing drivers, costly trucks, fuel consumption trends, delivery delays, and customer revenue patterns.
•	Which drivers completed the highest number of trips?
•	Which trucks generated the highest maintenance costs?
•	Which routes experienced the most delays?
•	Which customers generated the highest revenue?
•	Which trucks consumed the most fuel?
•	What trends existed in operational revenue over time?
•	How did safety incidents impact operational performance?

### Cleaning Decisions
•	Duplicate checks were performed across all tables using GROUP BY and COUNT logic. Primary key uniqueness was validated across all 14 tables. The results confirmed that no duplicate primary key values exist in any table. The loads and trips tables both contain exactly 85,410 records with 85,410 unique IDs, confirming clean one-to-one alignment.
•	Null values in termination_date within the drivers table were retained because they represented active employees.
•	Identified 1,714 null driver_id values, 1,680 null trailer_id values, and, 1,672 null truck_id values in the trips table. Null values were investigated as operational assignment gaps.
•	Date columns were standardized into DATE or DATETIME formats.
•	Categorical fields such as delivery statuses were standardized to ensure consistent reporting.
•	Orphan check queries were run for every foreign key relationship in the schema. An orphan is a record in a child table whose foreign key value does not match any row in the parent table.
•	Numeric fields such as revenue, fuel cost, maintenance cost, and distance metrics were 

### Assumptions Made
•	Null termination dates indicate currently active drivers.
•	Trips with missing driver_id or trailer_id were assumed to represent unassigned or incomplete operational records.
•	Revenue values in the loads table represented finalized shipment revenue.
•	Fuel purchases without driver IDs were assumed to originate from incomplete fueling logs.
•	Maintenance records accurately represented repair and servicing events.
•	Delivery timestamps represented operationally completed activities.

### SQL Techniques Used
•	Data Exploration Queries
•	Filtering and Sorting
•	Aggregation
•	Joins
•	Subqueries
•	Common Table Expressions (CTEs)
•	Window Functions
•	CASE Statements 
•	Detailed Analysis and Insights

### Key Insights Summary
1.	Revenue is stable at $262.5M over 3 years but shows zero growth December 2024 revenue is lower than January 2022. The company is operationally solid but commercially stagnant. A growth strategy, new lanes, new customers, or higher per-mile pricing is needed to prevent gradual revenue erosion from cost inflation.
2.	Fuel costs dropped from 39.2% of revenue in 2022 to 34.2% in 2024 entirely due to diesel price reductions, not efficiency gains. The company is exposed to a $4.3M annual cost shock if diesel prices return to 2022 levels. Fuel efficiency programs are essential as a hedge against price risk.
3.	Total maintenance spend is $5.73M across 2,920 events, generating ~72,500 hours of truck downtime over 3 years. Each maintenance event averages 25 hours of downtime. Reducing average downtime by even 2 hours per event would recover 5,840 truck-hours of productive capacity.
4.	The performance gap between Elite and Standard drivers represents recoverable value. A well-structured mentorship program amongst the drivers in the elite level and the other levels would the most direct intervention.
5.	Revenue per mile across top routes ranges only from $2.39 to $2.78 which shows tight pricing regardless of corridor. There is significant opportunity to differentiate pricing by lane based on market demand, transit time, and competitive rates. A rate review using load board benchmarks could increase per-mile revenue on high-demand corridors.
6.	On-time delivery is an aspect that needs attention, this is a critical service quality crisis. Customer satisfaction and contract retention are at risk. An operational audit of scheduling and appointment management is urgent.

### Conclusion
The Logistics Operations Database analysis reveals a company with a strong and stable operational foundation, with $262.5 million in revenue across three years, a diverse customer base with no dangerous concentration risk, and a fleet of 120 trucks completing nearly 80 loads per day, but one that is failing to grow and facing three serious operational problems that threaten its future performance. The fuel efficiency opportunity is recoverable with low-cost internal program. The on-time delivery crisis requires urgent operational intervention before customer contracts are at risk. The safety classification failure must be resolved to give management a credible view of the company's risk exposure. And the flat revenue trend demands a proactive commercial strategy before cost inflation erodes the margins that the recent diesel price decline has temporarily protected.
The logistics operations analysis successfully demonstrated the value of SQL-driven business intelligence and operational analytics. Through structured cleaning, relational modeling, and advanced analysis, the project uncovered important operational trends, cost drivers, customer revenue patterns, and delivery performance insights. The final deliverables, including SQL scripts, dashboards, presentations, and reports, provide management with actionable recommendations capable of improving operational efficiency and strategic decision-making.

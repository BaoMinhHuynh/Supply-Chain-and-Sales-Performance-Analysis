# Supply Chain Operations and Sales Performance Project

## Description:

This project focuses on analyzing supply chain operations and sales performance to identify opportunities for operational optimization and revenue growth. By examining key metrics such as revenue, profitability, delivery times, return rates, and customer behavior, the analysis provides insights that support more informed and data-driven strategic decisions.

## Key Analytical Questions:

1. What is the average delivery time, and which region has the slowest deliveries?
2. How does delivery time impact profitability?
3. Which region has the highest return rate?
4. Which product has the highest return rate, and what are the key causes?
5. What are the revenue and profit trends over time (yearly, quarterly, monthly)?
6. Which top 5 regions have the highest and lowest revenue?
7. Which products have the highest and lowest sales?

## Dataset:

Datasource: [Sales & Delivery Data](https://mazhocdata.tv/showcase/)

## File structure:

- [Data Understanding.xlsx](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/Data%20Understanding.xlsx) : This file contains complete descriptive information for all data fields in the dataset.
- [rfm_mapping.xlsx](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/rfm_mapping.xlsx) : Contains the RFM score mapping used for customer segmentation.
- [Supply Chain Dashboard_New.pbix](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/Report%20and%20Data%20Viz/Supply%20Chain%20Dashboard_New.pbix) : This is PowerBI report.
- [Supply Chain Dashboard.pdf](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/Report%20and%20Data%20Viz/Supply%20Chain%20Dashboard.pdf) : An exported version of the dashboard for easier viewing and sharing without requiring Power BI.
- [Analysis Report.pdf](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/Report%20and%20Data%20Viz/Analysis%20Report.pdf) : Summarizes key insights and business recommendations derived from the analysis.
- [SupplyChainSQL.sql](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/SupplyChainSQL.sql) : Used for exploratory data analysis (EDA) and answering key analytical questions.

## Tech Stack:

- Primary Tool: Power BI Desktop
- Language: DAX, SQL
- Advanced Features: Time Intelligence, RFM Segmentation, Cohort Retention Matrices

## EDA and Dashboard Development using SQL and Power BI

I will highlight some key points in this project, you can find more detail in [Analysis Report.pdf](https://github.com/BaoMinhHuynh/Supply-Chain-and-Sales-Performance-Analysis/blob/main/Report%20and%20Data%20Viz/Analysis%20Report.pdf)

### 📊 Key Dashboards & Insights

### Overview

![Overview](/assets/Overview.png)

### 1. Sales Performance

![sales](/assets/RevenueYOY.png)

**YTD Revenue** reached $733.22K, representing a **20.36% YoY growth**.

Revenue shows strong seasonality, **peaking in November** (> $80K) while **April–May underperformed** compared to the previous year.

Regional growth was driven by **West (+33.42%)** and South (+31.30%), while **Central (-0.22%)** remained stagnant.

### 2. Product Performance

![product](/assets/RevenueProduct.png)

**Phones** generated the **highest revenue** ($105K), while **Copiers** delivered the **highest profit** ($25K YTD).

**Appliances** recorded the **fastest growth** (+64.78%).

**Envelopes (-28.57%)** and **Machines (-22.11%)** experienced significant declines.

The drop in **Machines** is largely linked to extremely **long delivery times (41 days)**, reducing competitiveness and increasing operational costs.

### 3. Customer & RFM Analysis

![customer](/assets/Customer.png)

Average revenue per customer: $2.90K

Average order frequency: 6.32 orders per customer

**Customer acquisition** has steadily **declined** since 2015, suggesting a growing reliance on existing customers.

Customer Segmentation (RFM):

**Loyal Customers and Big Spenders** contribute the **majority of revenue** (~$1.09M).

However, around $438K revenue is associated with **high churn-risk segments** such as **Losing Big Spenders and Losing Loyal Customers**.

### 4. Operational Insights

![operational](/assets/ReturnedRate.png)

**Return Rate increased 14.59% YoY**, reaching 8.73%.

**Average delivery time** rose to **35.02 days**, indicating potential **logistics inefficiencies and quality control issues**.

### Recommendations

**Sales**: Prioritize marketing investment in high-margin products (Copiers & Accessories) and investigate the stagnant performance in the Central region.

**Operations**: Audit logistics processes in the West region (17.35% return rate) and set a KPI to reduce average delivery time to under 20 days.

**Marketing**: Launch a targeted win-back campaign for “Losing Big Spenders” and increase customer acquisition efforts to stabilize new customer growth.

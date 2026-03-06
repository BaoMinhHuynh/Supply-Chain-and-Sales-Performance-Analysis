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

- [Data Understanding.xlsx](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Data%20Understanding.xlsx) : This file contains complete descriptive information for all data fields in the dataset.
- [rfm_mapping.xlsx](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Data%20Understanding.xlsx) : Contains the RFM score mapping used for customer segmentation.
- [Supply Chain Dashboard_New.pdf](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Telecom%20Customer%20Churn.pdf) : This is PowerBI report.
- [Supply Chain Dashboard.pdf](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Telecom%20Customer%20Churn.pdf) : An exported version of the dashboard for easier viewing and sharing without requiring Power BI.
- [Analysis Report.pdf](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Telecom%20Customer%20Churn.pdf) : Summarizes key insights and business recommendations derived from the analysis.
- [SupplyChainSQL.sql](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Telecom_customer_churn_analysis.ipynb) : Used for exploratory data analysis (EDA) and answering key analytical questions.

## Tech Stack:

- Primary Tool: Power BI Desktop
- Language: DAX, SQL
- Advanced Features: Time Intelligence, RFM Segmentation, Cohort Retention Matrices

## EDA and Dashboard Development using SQL and Power BI

I will highlight some key points in this project, you can find more detail in [Analysis Report.pdf](https://github.com/BaoMinhHuynh/Telecom-project/blob/main/Telecom-customer-analyst-project/Data%20Understanding.xlsx)

### Overview

![Overview](/Telecom-customer-analyst-project/assets/Dashboard_2.png)

- **Critical Churn Rate:** Despite strong total revenue ($21.3M), the churn rate is alarmingly high at ~26.5%.

- **Ineffective Promotions:** The majority of revenue comes from customers with "No Offer" ($11.35M). Current promotional offers (especially C, D, and E) are underperforming and generating minimal returns.

- **Core Customer Profile:** The business is driven by married customers (64% of revenue).

### Total Charges Vs Total Revenue

![DB4](/Telecom-customer-analyst-project/assets/Dashboard_4.png)

### Churned Overall

![DB5](/Telecom-customer-analyst-project/assets/Dashboard_5.png)

### Churned by Customer Status and Tenure Category

![DB6](/Telecom-customer-analyst-project/assets/Dashboard_6.png)

### Churned Reason: Competitor made better Offer by Offer

![DB8](/Telecom-customer-analyst-project/assets/Dashboard_8.png)

### Conclusion

![DB14](/Telecom-customer-analyst-project/assets/Dashboard_14.png)

### Recommendations

- Offer Benefits Review
- Continuation of older offers
- Marketing Scheme for Offers
- Reward Programs
- Choice of High-Quality Devices Offered
- Training programs for support staff

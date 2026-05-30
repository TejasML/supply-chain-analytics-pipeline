# 📦 Supply Chain Analytics Pipeline

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Scikit-Learn](https://img.shields.io/badge/ScikitLearn-ML-green?logo=scikit-learn)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-ORM-red)

---

## 📌 Project Overview

An end-to-end supply chain analytics pipeline built on 100K+ real Brazilian e-commerce orders from the Olist dataset. The project covers the complete data analyst workflow — raw CSV ingestion, data cleaning, star schema data warehouse design in MySQL, 30-day revenue forecasting using Linear Regression, and an executive Power BI dashboard with 3 focused pages.

**Business Problem:**
Olist needed visibility into sales performance, delivery reliability, and future demand. This pipeline answers three core business questions:
- How is revenue trending and which products drive the most sales?
- Which regions and product categories have the worst delivery performance?
- What will revenue look like in the next 30 days?

---

## 🏗️ Architecture

```
8 Raw CSV Files (Olist Dataset)
         ↓
Python · Pandas
(Data Cleaning + Feature Engineering)
         ↓
MySQL · SQLAlchemy
(Star Schema · Staging → Dimensions → Fact Table)
         ↓
SQL Analytics
(Window Functions · Aggregations · Views)
         ↓
Python · Scikit-Learn
(Linear Regression · 30-Day Revenue Forecast)
         ↓
MySQL
(forecast_table stored back to database)
         ↓
Power BI
(3-Page Executive Dashboard)
```

### Star Schema
> 📷 *(Add your Power BI relationship view screenshot here)*

![Star Schema](images/star_schema.png)

### Pipeline Flow
> 📷 *(Add your pipeline architecture screenshot here)*

![Pipeline](images/architecture.png)

---

## 🛠️ Tech Stack

| Layer | Tools |
|---|---|
| Data Cleaning | Python · Pandas |
| Database | MySQL · SQLAlchemy |
| Data Modeling | Star Schema · SQL Views · Window Functions |
| Machine Learning | Scikit-Learn · Linear Regression |
| Visualization | Power BI · DAX |

---

## 📦 Dataset

**Brazilian E-Commerce Public Dataset by Olist**
🔗 [Download from Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

| File | Description |
|---|---|
| olist_orders_dataset.csv | Order dates, status, delivery dates |
| olist_order_items_dataset.csv | Products, quantities, prices |
| olist_order_payments_dataset.csv | Payment types and values |
| olist_order_reviews_dataset.csv | Customer review scores |
| olist_customers_dataset.csv | Customer location data |
| olist_products_dataset.csv | Product categories and dimensions |
| olist_sellers_dataset.csv | Seller location data |
| olist_geolocation_dataset.csv | Zip code coordinates |

**Size:** 100K+ orders · 8 CSV files · 2016–2018

---

## 📁 Project Structure

```
supply-chain-analytics-pipeline/
│
├── README.md
├── .gitignore
├── requirements.txt
│
├── notebooks/
│   ├── Data_Cleaning.ipynb          ← cleaning + feature engineering + push to MySQL
│   └── Sales_Forecasting.ipynb      ← ML model + forecast table push to MySQL
│
├── sql/
│   ├── 01_verify_staging.sql        ← sanity check on staging tables
│   ├── 02_create_dimensions.sql     ← dim_customer, dim_product, dim_seller, dim_date
│   ├── 03_create_fact.sql           ← fact_orders with feature engineering
│   ├── 04_add_keys.sql              ← primary keys and foreign keys
│   ├── 05_window_functions.sql      ← rolling avg, LAG, RANK queries
│   ├── 06_aggregations.sql          ← revenue by month, state, category
│   ├── 07_views_powerbi.sql         ← views for Power BI layer
│   └── 08_validation.sql            ← final row counts and null checks
│
├── images/
│   ├── architecture.png             ← pipeline flow diagram
│   ├── star_schema.png              ← Power BI relationship view screenshot
│   ├── dashboard_page1.png          ← Sales Overview
│   ├── dashboard_page2.png          ← Delivery Performance
│   └── dashboard_page3.png          ← Revenue Forecast
│
└── supply_chain_analytics_dashboard.pbix
```

---

## 📊 Dashboard

### Page 1 — Sales Overview
![Sales Overview](images/dashboard_page1.png)

### Page 2 — Delivery Performance & Customer Satisfaction
![Delivery Performance](images/dashboard_page2.png)

### Page 3 — Revenue Forecast & Demand Planning
![Revenue Forecast](images/dashboard_page3.png)

---

## 💡 Key Insights

- **Revenue peaked in November 2017** — likely driven by Black Friday, with 1.2M in monthly revenue
- **92.27% of orders were delivered on time** — strong overall delivery performance
- **Credit card dominates payments** — 78.34% of all transactions use credit card
- **beleza_saude (Health & Beauty) is the top revenue category** — generating 1.4M+ in total sales
- **State RR has the highest late order count** — indicating a regional logistics gap
- **Peak purchasing hour is 16:00** — afternoon orders are most frequent

---

## ⚙️ How To Run

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/supply-chain-analytics-pipeline.git
cd supply-chain-analytics-pipeline
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Download the dataset
Download all 8 CSV files from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place them in a local `data/raw/` folder.

### 4. Setup environment variables
Create a `.env` file in the project root:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_PORT=3306
DB_NAME=supply_chain_dw
```

### 5. Create MySQL database
```sql
CREATE DATABASE supply_chain_dw;
```

### 6. Run notebooks in order
```
1. notebooks/Data_Cleaning.ipynb
2. notebooks/Sales_Forecasting.ipynb
```

### 7. Run SQL files in order
Open MySQL Workbench and run in this order:
```
01_verify_staging.sql
02_create_dimensions.sql
03_create_fact.sql
04_add_keys.sql
05_window_functions.sql
06_aggregations.sql
07_views_powerbi.sql
08_validation.sql
```

### 8. Connect Power BI
- Open Power BI Desktop
- Get Data → MySQL Database
- Connect to `supply_chain_dw`
- Load: `fact_orders`, `dim_customer`, `dim_product`, `dim_seller`, `dim_date`, `forecast_table`
- Set relationships in Model view
- Open `supply_chain_analytics_dashboard.pbix`

---

## 👤 Author

**Your Name**
- 🔗 [LinkedIn](https://linkedin.com/in/yourprofile)
- 🐙 [GitHub](https://github.com/yourusername)
# 📦 Supply Chain Analytics Pipeline

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Scikit-Learn](https://img.shields.io/badge/ScikitLearn-ML-green?logo=scikit-learn)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-ORM-red)

---

## 📌 Project Overview

An end-to-end supply chain analytics pipeline built on 100K+ real Brazilian e-commerce orders from the Olist dataset. The project covers the complete data analyst workflow — raw CSV ingestion, data cleaning, star schema data warehouse design in MySQL, 30-day revenue forecasting using Linear Regression, and an executive Power BI dashboard with 3 focused pages.

**Business Problems this project solves:**
- How is revenue trending and which products drive the most sales?
- Which regions and product categories have the worst delivery performance?
- What will revenue look like in the next 30 days?

---

## 🏗️ Architecture

Raw CSV files are cleaned and feature-engineered in Python, then pushed to MySQL via SQLAlchemy as staging tables. A Star Schema Data Warehouse is designed in MySQL using fact and dimension tables to support business intelligence reporting and analytics. SQL views and window functions form the analytics layer that Power BI consumes. A Linear Regression model pulls data from MySQL, forecasts the next 30 days of revenue, and stores predictions back to the database.

![Pipeline](images/architecture.png)

### Star Schema Design

Designed a Star Schema Data Warehouse in MySQL using fact and dimension tables to support business intelligence reporting and analytics.

![Star Schema](images/star_schema.png)

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

A real-world Brazilian e-commerce dataset containing 100K+ orders placed between 2016 and 2018. It covers the full order lifecycle — from purchase to delivery — including customer information, product details, seller data, payments, and reviews across 8 CSV files.

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
└── images/
    ├── architecture.png
    ├── star_schema.png
    ├── dashboard_page1.png
    ├── dashboard_page2.png
    └── dashboard_page3.png
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

**Q1: How is revenue trending and which products drive the most sales?**

- Revenue grew consistently through 2017, peaking at **R$ 1.2M in November 2017** — driven by Black Friday demand
- **Health & Beauty (beleza_saude)** is the top revenue category at R$ 1.4M+, followed by watches and home decor
- Total platform revenue across 2016–2018 reached **R$ 15.92M** across 98,666 orders
- Average order value stands at **R$ 140.46** with credit card dominating at **78.34%** of all transactions

---

**Q2: Which regions and product categories have the worst delivery performance?**

- Overall on-time delivery rate is strong at **92.27%** — only 9K orders out of 98K+ were late
- **State RR (Roraima)** has the highest late order count — indicating a northern Brazil logistics gap
- **cama_mesa_banho (Bed & Bath)** leads late orders by product category with 933 late deliveries
- Average lead time from purchase to delivery is **12.42 days** across all states

---

**Q3: What will revenue look like in the next 30 days?**

- The Linear Regression model forecasts **R$ 761K in total revenue** over the next 30 days
- Peak predicted daily revenue is **R$ 25.76K**
- Peak purchasing activity occurs at **16:00** — afternoon hours drive the most orders

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
Download from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place CSV files in a local `data/raw/` folder.

### 4. Configure database credentials
Create a `.env` file in the project root with your MySQL credentials. Refer to `.env.example` for the required variables.

### 5. Run notebooks in order
```
1. notebooks/Data_Cleaning.ipynb
2. notebooks/Sales_Forecasting.ipynb
```

### 6. Run SQL files in order
Open MySQL Workbench and execute files from the `sql/` folder in numerical order (01 → 08).

---

## 👤 Author

**Your Name**
- 🔗 [LinkedIn](https://linkedin.com/in/yourprofile)
- 🐙 [GitHub](https://github.com/yourusername)
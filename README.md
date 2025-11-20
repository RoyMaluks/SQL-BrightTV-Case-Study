# 🚗 Bright Motors Car Sales Analysis (BRIGHTLEARN)

---

## 📘 Project Purpose

This project analyzes Bright Motors’ historical car sales data to uncover revenue patterns, customer purchasing behaviour, and inventory performance.  
The goal is to help the newly appointed Head of Sales understand business performance and make data-driven decisions to improve profitability, optimize stock, and strengthen dealership operations.

---

## 📊 Dataset Used

**Dataset:** `Bright_Car_Sales`  

**Fields:**

- year  
- brand  
- model  
- trim  
- body  
- transmission  
- vin_id  
- state  
- condition  
- odometer  
- color  
- interior  
- seller  
- market_value  
- selling_price  
- sale_date  

---

## 🛠️ Tools & Technologies

- **Snowflake** – ETL, data cleaning, SQL transformations  
- **Power BI** – Dashboard design, DAX measures, KPI reports  
- **Miro** – Planning, architecture mapping, workflow design  
- **PowerPoint** – Final business presentation  

---

## 🎯 Objectives

- Identify top revenue-generating car brands and models  
- Analyze monthly and weekly sales performance  
- Understand the relationship between price, odometer, and car age  
- Compare market value vs. selling price  
- Categorize vehicles into High, Medium, and Low Margin  
- Provide strategic recommendations to improve profitability  

---

## 🔍 Steps Followed

1. Converted Excel data into CSV format  
2. Loaded dataset into Snowflake  
3. Performed data cleaning:  
   - Fixed date formats  
   - Handled null values in brand/model/trim  
   - Standardized numeric fields (selling price, market value)  
4. Engineered additional fields:  
   - Month name  
   - Day of week  
   - Margin category  
   - Price difference  
5. Ran analytical SQL queries:  
   - Revenue by brand/model  
   - Monthly and weekday trend analysis  
   - Transmission performance  
6. Exported cleaned dataset to Power BI  
7. Built visualizations and DAX measures:  
   - KPIs  
   - Revenue trends  
   - Margin breakdowns  
   - Brand comparisons  
8. Designed a final presentation summarizing insights and recommendations  

---

## 💡 Key Findings

- Total revenue exceeds R8 billion across the dataset  
- Tuesday–Thursday drive the highest revenue  
- February is the strongest month, while April and July have zero or very low revenue  
- Vehicle sales are dominated by Low Margin units (4

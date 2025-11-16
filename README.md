# 📺 BrightTV Viewership Analysis Dashboard

## 📘 Project Purpose
This project analyzes BrightTV’s user activity, content consumption patterns, and overall engagement.  
The goal is to understand user behaviour, identify peak usage periods, and provide insights to help improve content strategy and grow BrightTV’s user base.

---

## 📊 Datasets Used

### Dataset 1: `BrightTV_userProfile`
**Fields:**
- UserID
- Name
- Surname
- Email
- Gender
- Race
- Age
- Province
- Social Media Handle

### Dataset 2: `BrightTV_viewership`
**Fields:**
- UserID
- Channel2
- RecordDate2
- Duration2

---

## 🛠️ Tools & Technologies
- **Snowflake** – SQL data cleaning, transformation, modeling  
- **Power BI** – Dashboard creation, DAX measures, visuals  
- **Miro** – Workflow mapping and planning  
- **PowerPoint** – Final presentation design  

---

## 🎯 Objectives
- Analyze user and usage trends across BrightTV  
- Identify factors influencing content consumption  
- Understand peak vs. low consumption days and months  
- Recommend content to improve low-consumption days  
- Suggest initiatives to help grow BrightTV’s user base  

---

## 🔍 Steps Followed
1. Imported datasets into Snowflake  
2. Cleaned and standardized fields (dates, nulls, durations)  
3. Engineered additional features:
   - Day name  
   - Hour of day  
   - Weekday/weekend  
   - Monthly classification  
4. Ran analytical SQL queries (average duration, daily trends, channel counts, etc.)  
5. Loaded the transformed dataset into Power BI  
6. Created DAX measures and built dashboard visuals:
   - KPIs  
   - Line charts  
   - Bar charts  
   - Monthly trend visuals  
7. Designed process flow and planning documents in Miro  
8. Presented findings in PowerPoint  

---

## 💡 Key Findings
- Friday is the busiest day, followed by Saturday, Wednesday, and Sunday  
- March has the highest usage among all months  
- April shows the lowest user activity, with only 5 users recorded  
- Viewing heavily increases on weekends, indicating leisure-time engagement  
- Consumption is influenced by day of week, month, user availability, and content type  

---

## 🚀 Conclusion
The analysis highlights strong engagement on weekends and in the month of March.  
To boost overall platform performance, BrightTV should consider:
- Increasing content drops and marketing campaigns during low-activity months (e.g., April)  
- Strengthening weekly programming to keep engagement consistent  
- Creating personalized user-targeted engagement campaigns  
- Expanding high-performing content categories  

These insights provide a foundation for improving user retention, growing the user base, and optimizing BrightTV’s content strategy.

---

## ✨ Author
**Roy Maluks** — Aspiring Data Analyst focused on SQL, Snowflake, Power BI, and storytelling through data.

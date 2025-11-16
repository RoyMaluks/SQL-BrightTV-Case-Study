📊 BrightTV Analytics Project

This project explores user behaviour and content consumption trends on BrightTV using analytical tools and visualization platforms. Two datasets were used to understand user profiles, viewership patterns, and factors that influence overall engagement.

📁 Dataset Description
1. BrightTV_userProfile

Contains demographic and basic user information.

Column	Description
UserID	Unique identifier for each user
Name	First name of the user
Surname	Last name of the user
Email	User email address
Gender	Gender of the user
Race	Race category
Age	Age in years
Province	Province of residence
Social Media Handle	User’s social media profile name

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. BrightTV_viewership

Tracks user viewing activity across channels and dates.

Column	Description
UserID	Linked to User Profile table
Channel2	Channel watched
RecordDate2	Date and time of viewing
Duration2	Watch duration (in minutes)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

🛠 Tools & Technologies Used

Snowflake – Data cleaning, transformation, and SQL analysis

Power BI – Data modeling, interactive dashboard creation, insights visualization

Miro – Planning and flow design

PowerPoint – Presentation building and storytelling

---

🔍 Key Findings
1. User & Channel Insights

Total users analyzed across the period.

21 total channels available in the dataset (SQL result).

Viewing time varies significantly by day and month.

2. Busiest Days

Friday is the highest consumption day, followed by
Saturday → Wednesday → Sunday.

3. Monthly Trends

March has the highest usage, followed by February.

January shows moderate activity.

April has the lowest usage, with only 5 users active.

4. Usage Behaviour

Peak hours and peak days indicate when users engage most.

Low-consumption periods show opportunities for campaigns and content releases.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

🧭 Steps Followed

Data Import into Snowflake.

Cleaning & Transformation

Standardized date fields

Handled null channel values

Created calculated fields (day, weekday, month).

SQL Analysis

Average watch time

Total channels

Daily/Monthly consumption metrics

High-watch vs low-watch segmentation

Data Export to Power BI

Created core measures (DAX)

Built date hierarchy, calendar table, relationships

Designed key visuals:

Line charts, bar charts, cards, KPI indicators

Dashboard Creation

User trends

Consumption patterns

Top/low performing periods

Presentation Preparation in PowerPoint.

📌 Conclusion

The analysis shows that BrightTV’s content consumption is strongest on Fridays and weekends, with March being the peak month.
Low-engagement periods such as April highlight opportunities for new content promotions, feature rollouts, or targeted marketing campaigns.
With continued data monitoring and user-focused strategies, BrightTV can grow both user engagement and overall platform usage.

### Revenue-Leakage-Operational-Inefficiency-Analysis

**Business Problem**: Ride-hailing platforms rely on a balanced marketplace between customers and drivers. However, high ride cancellations and operational inefficiencies disrupt this balance, leading to poor user experience, inefficient supply utilisation, and reduced repeat usage, hence impacting the revenue of the business. The data has July's month bookings.
The goal is to identify key friction points in the booking journey that are hindering sustainable growth and revenue and propose data-backed insights to improve marketplace efficiency.



##Questions we solved to understand this problem statement:


**#Question 1:**
**What percentage of total booking demand is lost due to ride failures?**<br>
**Assumption**: We have considered ride failures when they have been cancelled by the driver or an incomplete ride due to many reasons.<br>
**Reason of Assumption**: From a business point of view, since we have only one month of data, I have looked at the supply side. If we were to draw conclusions on the scope of improvement, I would start with the supply side first.<br>
**Insights**: Total 80% revenue we have lost due to ride failures. Revenue lost has a major impact on the business.<br>
**Recommendation**: In the ride-hailing market, if we are failing at making a profit, then either we have operational inefficiencies at the micro-level or brand positioning needs be strengthened.<br>


#**Question 2:**
Which vehicle type contributes the highest share to total revenue leakage?<br>
**Assumption**: We have considered ride failures when they have been cancelled by the driver or an incomplete ride due to many reasons.<br>
**Reason for Assumption**: From a business point of view, since we have only one month of data, I have looked at the supply side. If we were to draw conclusions on the scope of improvement, I would start with the supply side first.<br>
**Insights**: Prime Sedan and Ebike contribute to the highest share of total revenue leakage.<br>
**Recommendation**: Need to analyse at the micro-level why these categories are failing. Interviewing the drivers and understanding the problems from the supply side will help us work on our operations.<br>


#**Question 3:** 
What percentage of total lost revenue comes from the top 20% highest-risk locations?<br>
**Assumption**: Revenue leakage follows the Pareto Principle (80/20 rule), meaning a small percentage of pickup locations may be responsible for a large share of total lost revenue.<br>
**Reason for Assumption:** In operational systems (rides, logistics, marketplaces), inefficiencies are often concentrated rather than evenly distributed.<br>
**Insights**: Revenue leakage is evenly distributed across pickup locations, indicating systemic inefficiencies rather than geographically concentrated risk.<br>
**Recommendation**: Operational improvements should focus on platform-wide cancellation reduction strategies rather than location-specific interventions.<br>


#**Question 4:**
If the cancellation rate reduces by 10%, how much additional revenue can be realised?<br>
**Assumption** : A 10% reduction in ride cancellations (driver cancellations + incomplete rides) would convert 10% of currently lost rides into completed rides, thereby recovering equivalent lost revenue.<br>
**Reason for Assumption** : A 10% reduction in ride cancellations (driver cancellations + incomplete rides) would convert 10% of currently lost rides into completed rides, thereby recovering equivalent lost revenue.<br>
**Recommendation**: A 10% reduction in cancellations could recover approximately ₹ 1018342.70 in additional revenue.<br>


#**Question 5:**
Which time-of-day segment contributes the highest revenue leakage rate?<br>
**Assumption**: Revenue leakage is not uniformly distributed throughout the day.<br>
Certain time segments (e.g., peak hours or late night) may experience higher cancellation rates due to operational stress, driver availability issues, or traffic conditions.<br>
**Reason for Assumption:** Revenue leakage is not uniformly distributed throughout the day.<br>
Certain time segments (e.g., peak hours or late night) may experience higher cancellation rates due to operational stress, driver availability issues, or traffic conditions.<br>
**Recommendation** : By targeting high-leakage periods with focused supply optimisation and driver engagement strategies, the platform can reduce cancellation-driven losses and improve overall revenue efficiency.<br>











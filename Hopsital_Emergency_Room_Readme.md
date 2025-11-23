Patient Admission & Satisfaction Analytics – SQL + Power BI Dashboard

A healthcare analytics project focused on understanding patient demographics, admission behavior, wait-time patterns, satisfaction levels, and departmental workload. The analysis combines SQL preprocessing with Power BI visualizations to deliver clear, actionable insights for hospital performance improvement.

1. Project Overview

This project analyzes a structured patient dataset to produce:

Pivot reports summarizing patient admissions, satisfaction, wait-times, and demographics

Clean and interactive Power BI dashboards

Metrics for operational efficiency and patient service quality

Insights that help healthcare teams improve decision-making

The analysis highlights:

Patient flow patterns

Department workload

Admission trends

Satisfaction determinants

The impact of wait-time on overall experience

2. Dataset Structure

Below are the core fields included in the dataset:

Column Name	Description
Patient Id	Unique identifier for each patient
Patient Admission Date	Date and time when patient visited
Patient First Initial	First letter of patient’s first name
Patient Last Name	Patient’s last name
Patient Gender	M/F
Patient Age	Age in years
Patient Race	Race classification
Department Referral	Department the patient is referred to
Patient Admission Flag	TRUE = Admitted, FALSE = Not Admitted
Patient Satisfaction Score	Rating between 1–10
Patient Waittime	Waiting time in minutes
3. Pivot Reports Included
a. Patient Admission Summary
Admission Status	Count	Percentage
Admitted	217	46.27%
Not Admitted	252	53.73%
Total	469	100%
b. Metrics Used

Total Number of Patients

Average Patient Satisfaction Score

Average Patient Wait-Time

c. Additional Pivot Tables

Gender distribution

Department referral counts

Patient attendance status

These pivot reports serve as the base for the Power BI dashboard visuals.

4. Power BI Dashboard Components

The dashboard contains:

KPI Cards for total patients, average satisfaction, and average wait-time

Pie/Donut Chart showing admitted vs not admitted percentages

Bar Chart for department referral volumes

Gender distribution chart

Wait-time vs Satisfaction chart to explore correlation

Slicers to filter by Gender, Department, Race, and Admission Status

All visuals are dynamically linked to support interactive analysis.

5. Key Insights
1. Admission Trends

Out of 469 patients, 53.73% were not admitted while 46.27% were admitted.

Indicates efficient outpatient handling or strict admission criteria.

2. Satisfaction Patterns

Higher satisfaction observed among admitted patients.

Missing satisfaction scores reflect inconsistent feedback collection.

Longer wait-times correlate with lower satisfaction.

3. Wait-Time Analysis

Wait-times vary significantly across departments.

Heavier departments (e.g., General Practice) show longer queues.

Reducing queue times may improve satisfaction scores.

4. Department-Level Observations

General Practice receives the highest referrals.

“None” referrals indicate frequent walk-ins.

High workload departments may require improved scheduling or staffing.

5. Gender Distribution

Balanced distribution between male and female patients.

No major differences in admission rates or satisfaction levels.

6. Race and Demographics

Dominant groups include White, African American, and Native American/Alaska Native.

No notable demographic bias detected in admissions or satisfaction.

7. Patient Attendance

Most patients complete their visit.

Few cases of patients leaving without consultation may relate to:

Long visible queues

Waiting discomfort

Lack of clarity at reception

6. Tech Stack
Technology	Purpose
SQL	Data cleaning, transformation, preprocessing
Excel / CSV	Data storage and inspection
Power BI Desktop	Dashboard and interactive visualizations
DAX Measures	KPI calculations and analytics
Pivot Tables	Summarization and validation
7. How to Use This Project

Download the dataset from the repository.

Load the data into Power BI Desktop.

Use the included DAX measures to compute KPIs.

Review pivot reports to validate numbers.

Interact with the dashboard using slicers for deeper analysis.

8. Conclusion

This project provides a comprehensive view of hospital performance by analyzing:

Patient flow

Admission behavior

Department load

Satisfaction scores

Wait-time impact

The insights help healthcare facilities improve resource allocation, operational efficiency, and overall patient experience.

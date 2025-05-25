# 🏥 Healthcare Management SQL Project

## 📌 Overview
This project simulates a relational healthcare database for managing patients, prescriptions, pharmacies, and disease tracking across Indian cities and states. It demonstrates expertise in SQL database design, optimization, stored procedures, triggers, and real-world query logic.

## 🛠️ Tools & Technologies
- MySQL (SQL)
- GitHub
- GitHub Desktop
- VS Code

## 📂 Dataset Summary
Synthetic datasets were generated to simulate realistic healthcare operations:
- `patients.csv`: 1,000 patients (Indian names, age, gender, city)
- `pharmacies.csv`: 100 pharmacies across 50 cities
- `prescriptions.csv`: 1,500 prescription records from 2020–2023
- `diseases.csv`: 20 common diseases
- `cities.csv`: 50 cities linked to states
- `states.csv`: 20 Indian states

## 🧱 Database Design
The schema includes six normalized tables with proper keys and constraints:

- `patients`, `pharmacies`, `prescriptions`, `diseases`, `cities`, `states`
- Foreign key relationships model geographic and clinical linkages
- Tables designed to support real-world healthcare workflows

## 📋 SQL Features Demonstrated

### ✅ Schema Creation
- Primary and foreign keys
- Constraints and data integrity
- Normalized structure

### ✅ Stored Procedures
- Top drugs by prescription volume
- Disease-wise patient count per year
- Prescription history per patient
- Pharmacy-specific medication filters

### ✅ Triggers
- Audit log for new city inserts
- Trigger for pharmacy updates (inventory change tracking simulation)

### ✅ Indexing
- Indexed foreign keys and frequent filter columns
- Optimized join and time-based filtering performance (20–35% gain)

### ✅ Analytical Queries
- Year-over-year prescription trends
- Drug usage frequency
- City/state-level disease mapping
- Patient-level analytics (e.g., high-risk, multi-disease profiles)
- Age group segmentation
- Churn prediction (inactive patients)

## 📊 Sample Insights (from queries)
- Dengue and diabetes are the most common conditions
- Most prescriptions are concentrated in 10 urban cities
- Age group 36–50 receives the most medication
- 50+ patients with prescriptions from 3+ pharmacies → potential care fragmentation

## 📁 File Structure

healthcare_management_sql_project/
│
├── sample_dataset/
│ ├── patients.csv
│ ├── pharmacies.csv
│ ├── prescriptions.csv
│ ├── diseases.csv
│ ├── cities.csv
│ └── states.csv
│
├── healthcare_db_creation.sql
├── stored_routines.sql
├── triggers.sql
├── indexes.sql
├── sample_queries.sql
└── README.md


## 📌 How to Use

1. Run `healthcare_db_creation.sql` to create the database and tables.
2. Use the CSV files to populate each table using `LOAD DATA INFILE` or import via GUI.
3. Run `stored_routines.sql`, `triggers.sql`, and `indexes.sql`.
4. Explore and test using `sample_queries.sql`.

## 👤 Author

**Don Richardson Bayya**  

---

> ✅ Built to demonstrate end-to-end database thinking: from schema to insights.  
> 📢 Use this as a live portfolio piece when applying to data roles.


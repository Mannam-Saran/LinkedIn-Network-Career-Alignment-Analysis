
# LinkedIn Network Career Alignment Analysis

Analyze your LinkedIn connections to evaluate how well your professional network aligns with your target career goals — using Python and Snowflake, with dashboards built directly in Snowsight.

---

##  Project Objective

The goal of this project is to:
- Extract, clean, and analyze LinkedIn connections
- Classify each connection’s job title into meaningful career categories
- Measure how aligned the network is with a target field (e.g., Data Science)
- Visualize insights using Snowflake-native dashboards

---

## Tools Used

- **Python**: Data preprocessing and job role classification
- **Snowflake**: Centralized data warehouse, SQL-based analytics
- **Snowsight**: Interactive dashboard for query results and insights

---

## Dataset

- Exported from personal LinkedIn account: `Connections.csv`
- Fields used: `First Name`, `Last Name`, `Position`, `Company`, `Connected On`, `Email Address`, `URL`
- Additional field created: `Job Category` using Python classification logic

---

## Data Cleaning Steps (Python)

- Removed blank/missing job titles
- Standardized casing and formatting
- Combined `First Name` and `Last Name` into `Full Name`
- Added `Job Category` based on keyword rules (e.g., "data scientist", "analyst", "devops", etc.)

---

## Job Role Classification

Implemented rule-based classification logic using a custom dictionary with 14 job categories:
- Data Science
- Data Analyst
- Business Intelligence
- Data Engineer
- Web Development
- Software Engineering
- DevOps / Cloud
- Cybersecurity
- Quality Assurance / Testing
- Talent / HR
- Product / Project
- Consulting
- Marketing
- Student

**Special logic:**  
- "Business Analyst" → Business Intelligence  
- All other "Analyst" → Data Analyst  
- Interns and students → Student  
- QA, SDET, Test Engineer → QA Category  

---

## SQL Views Created in Snowflake

```sql
linkedin_network.staging.connections_by_category;
linkedin_network.staging.ds_alignment_summary;
linkedin_network.staging.top_companies;
connection_trends;
```

---

## Dashboard Highlights (Snowsight)

- Job Category Split (Pie/Bar)
- % of Network in Data Science
- Top Companies by Connection Count
- Trend of Connections Over Time

Dashboard link: https://app.snowflake.com/bpkdjnv/rw70674/#/linkedin-career-alignment-dP1dLWHTO

---

## Key Insights

- **X%** of network is aligned to Data Science roles
- Top aligned companies: TCS, Amazon, etc.
- Majority of connections are concentrated in [Location/Industry]
- Emerging growth in roles like Cybersecurity and QA


## Future Work

- Enhance role classification using spaCy or BERT
- Include geographic analysis (if location data is added)
- Automate LinkedIn data ingestion using Selenium or LinkedIn API
- Integrate with a real-time dashboarding platform like Streamlit or Observable

---

## Acknowledgments

- LinkedIn for data export capability
- Snowflake for trial access and Snowsight dashboarding
- Open-source tools: pandas, tabulate, Jupyter, etc.

---

## Connect with Me

Feel free to connect or reach out:

- LinkedIn: https://www.linkedin.com/in/mannam-saran-2001
- GitHub: https://github.com/Mannam-Saran

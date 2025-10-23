🏦 Bank Loan Data Analysis and Performance Dashboard
This project presents a comprehensive Bank Loan Analysis Dashboard created using Power BI and SQL. 
The goal is to evaluate the bank's financial health, assess loan performance, and uncover key trends by providing a dynamic and insightful view of the loan portfolio data.
🎯 Project OverviewThe core of this project is to distinguish between 'Good Loans' (Fully Paid) and 'Bad Loans' (Charged Off) to calculate a crucial Bad Loan Percentage.
The dashboard tracks key financial metrics and provides multi-dimensional analysis to help stakeholders make informed decisions regarding risk assessment and portfolio management.
✨ Key Features and AnalysisThe dashboard and underlying analysis provide the following critical insights:Key Performance Indicators (KPIs):
Total Loan ApplicationsTotal Funded AmountTotal Received AmountAverage Interest Rate and Average DTI (Debt-to-Income)Loan Performance Metrics:Good Loan vs. Bad Loan applications, funded amount, and received amount.
Calculation of the overall Bad Loan Percentage.
Time-Series and Trend Analysis:Month-to-Date (MTD) analysis for all primary KPIs, including growth metrics (MTD vs. PMTD - Previous Month to Date).Monthly Trend analysis of applications, funded amount, and received amount.
Segmentation Analysis:
Detailed breakdowns of loan metrics by key borrower and loan characteristics:Grade/Sub GradeLoan Term (36 months vs. 60 months)Employee LengthPurpose (Debt Consolidation, Credit Card, Home Improvement, etc.)Home Ownership (MORTGAGE, RENT, OWN)Geographical State🛠️ Technologies UsedCategoryTool/LanguagePurposeData SourceCSV/ExcelSource files containing the raw bank loan data.
Data ProcessingSQL ServerUsed for cleaning, transformation, and calculating core business metrics (e.g., MTD, Good vs. Bad Loan counts).
Data VisualizationPower BIThe primary tool for creating the interactive and dynamic dashboard.
📂 Repository ContentsBANK_LOAN_PROJECT.pbix:
The final Power BI Dashboard file. 
This file contains all the visualizations, measures, and data model.Bank Loan EXcel Dashboard.xlsx - financial_loan.csv:
The main dataset used for the analysis.
Bank Loan EXcel Dashboard.xlsx - bank_loan_data.csv:
A secondary or processed version of the loan data.
Bank Loan EXcel Dashboard.xlsx - Design Sheet.csv:
Contains aggregated data or pre-calculated metrics, likely used for the Excel-based reporting component or data dictionary.SQLQuery1.sql, SQLQuery2.sql: S
QL scripts containing the queries used to extract and aggregate data from the loan tables, including complex calculations for MTD and segmented analysis.
Google Colab Notebook: (Optional) Documentation or a setup guide for the project.


Power BI Dashboard : 


<img width="1441" height="852" alt="Screenshot 2025-10-23 151651" src="https://github.com/user-attachments/assets/abc96023-f56f-42b9-8049-f426203456eb" />


<img width="1440" height="851" alt="Screenshot 2025-10-23 160000" src="https://github.com/user-attachments/assets/fbe08288-533b-43aa-b0f0-d75c04e1ac0f" />


<img width="1439" height="850" alt="Screenshot 2025-10-23 160041" src="https://github.com/user-attachments/assets/cbf2b030-13d8-4818-9037-81a334649f50" />

Excel Dashboard:


<img width="1165" height="583" alt="Screenshot 2025-10-23 160244" src="https://github.com/user-attachments/assets/3cc9a110-3c15-4d2a-a51a-b222030a966f" />


<img width="1165" height="582" alt="Screenshot 2025-10-23 160346" src="https://github.com/user-attachments/assets/4c45cd88-4025-4aa4-a4df-9487621eaa38" />


<img width="1871" height="632" alt="Screenshot 2025-10-23 160444" src="https://github.com/user-attachments/assets/cf0efe24-c958-4a39-b77c-40ad6c2a42bb" />



Python File Visual With Code :

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
import plotly.express as px

df = pd.read_excel("/content/drive/MyDrive/financial_loan_data_excel.xlsx")

print("No of Rows :", df.shape[0])
No of Rows : 38576

print("No of Columns :", df.shape[1])
No of Columns : 24

df.dtypes

<img width="339" height="662" alt="Screenshot 2025-10-23 160926" src="https://github.com/user-attachments/assets/be1a9c50-a9b2-4df2-8c18-dee38844f99a" />



## Total Loan Application



total_loan_application = df['id'].count()
print("Total Loan Applications :", total_loan_application)
Total Loan Applications : 38576



## MTD Total Loan Application


latest_issue_date = df['issue_date'].max()
latest_year = latest_issue_date.year
latest_month = latest_issue_date.month

mtd_data = df[(df['issue_date'].dt.year == latest_year) & (df['issue_date'].dt.month == latest_month)]

mtd_total_loan_application = mtd_data['id'].count()

print(f"MTD Loan Applications (for {latest_issue_date.strftime('%B %Y')}): {mtd_total_loan_application}")

MTD Loan Applications (for December 2021): 4314



## Total Funded Amount


total_funded_amount = df['loan_amount'].sum()
total_funded_amount_millions = total_funded_amount / 1000000
print("Total Funded Amount : ${:.2f}M". format(total_funded_amount_millions))
Total Funded Amount : $435.76M



## MTD - Total Funded Amount


latest_issue_date = df['issue_date'].max()
latest_year = latest_issue_date.year
latest_month = latest_issue_date.month

mtd_data = df[(df['issue_date'].dt.year == latest_year) & (df['issue_date'].dt.month == latest_month)]

mtd_total_funded_amount = mtd_data['loan_amount'].sum()
mtd_total_funded_amount_millions = mtd_total_funded_amount / 1000000

print("MTD Total Funded Amount: ${:.2f}M".format(mtd_total_funded_amount_millions))

MTD Total Funded Amount: $53.98M


##  Total Amount Received


total_received_amount = df['total_payment'].sum()
total_received_amount_millions = total_received_amount / 1000000
print("Total Received Amount : ${:.2f}M". format(total_received_amount_millions))
Total Received Amount : $473.07M


## MTD - Total Received Amount


latest_issue_date = df['issue_date'].max()
latest_year = latest_issue_date.year
latest_month = latest_issue_date.month

mtd_data = df[(df['issue_date'].dt.year == latest_year) & (df['issue_date'].dt.month == latest_month)]

mtd_total_received_amount = mtd_data['total_payment'].sum()
mtd_total_received_amount_millions = mtd_total_received_amount / 1000000
print("MTD Total Received Amount: ${:.2f}M".format(mtd_total_received_amount_millions))
MTD Total Received Amount: $58.07M


## Average DTI Rate

avg_dti_rate = df['dti'].mean()*100
print("Average Debt to Interest Rate (Dti) : {:.2f}%".format(avg_dti_rate))
Average Debt to Interest Rate (Dti) : 13.33%


## Average Interest Rate

avg_int_rate = df['int_rate'].mean()*100
print("Average Interest Rate : {:.2f}%".format(avg_int_rate))
Average Interest Rate : 12.05%




## Good Loan Metrics


good_loans = df[df['loan_status'].isin(["Fully Paid", "Current"])]

total_loan_applications = df['id'].count()

good_loan_applications = good_loans['id'].count()
good_loan_funded_amount = good_loans['loan_amount'].sum()
good_loan_received_amount = good_loans['total_payment'].sum()

good_loan_funded_amount_millions = good_loan_funded_amount / 1000000
good_loan_received_amount_millions = good_loan_received_amount / 1000000

good_loan_percentage = good_loan_applications / total_loan_applications * 100

print("Good Loan Applications:", good_loan_applications)
print("Good Loan Funded Amount: ${:.2f}M".format(good_loan_funded_amount_millions))
print("Good Loan Received Amount: ${:.2f}M".format(good_loan_received_amount_millions))
print("Percentage of Good Loan Applications: {:.2f}%".format(good_loan_percentage))

Good Loan Applications: 33243
Good Loan Funded Amount: $370.22M
Good Loan Received Amount: $435.79M
Percentage of Good Loan Applications: 86.18%




## Bad Loan Metrics


bad_loans = df[df['loan_status'] == 'Charged Off']

total_loan_applications = df['id'].count()

bad_loan_applications = bad_loans['id'].count()
bad_loan_funded_amount = bad_loans['loan_amount'].sum()
bad_loan_received_amount = bad_loans['total_payment'].sum()

bad_loan_funded_amount_millions = bad_loan_funded_amount / 1000000
bad_loan_received_amount_millions = bad_loan_received_amount / 1000000

bad_loan_percentage = bad_loan_applications / total_loan_applications * 100

print("Bad Loan Applications:", bad_loan_applications)
print("Bad Loan Funded Amount: ${:.2f}M".format(bad_loan_funded_amount_millions))
print("Bad Loan Received Amount: ${:.2f}M".format(bad_loan_received_amount_millions))
print("Percentage of Bad Loan Applications: {:.2f}%".format(bad_loan_percentage))

Bad Loan Applications: 5333
Bad Loan Funded Amount: $65.53M
Bad Loan Received Amount: $37.28M
Percentage of Bad Loan Applications: 13.82%

## Monthly Trends by Issue Date for Total Funded Amount


monthly_funded = (
    df.sort_values('issue_date')
    .assign(month_name=lambda x: x['issue_date'].dt.strftime('%b %Y'))
    .groupby('month_name', sort=False)['loan_amount']
    .sum()
    .div(1_000_000)
    .reset_index(name='loan_amount_millions')
)

plt.figure(figsize=(10,5))
plt.fill_between(monthly_funded['month_name'], monthly_funded['loan_amount_millions'], color='skyblue', alpha=0.5)
plt.plot(monthly_funded['month_name'], monthly_funded['loan_amount_millions'], color='blue', linewidth=2)

for i, row in monthly_funded.iterrows():
  plt.text(i, row['loan_amount_millions'] + 0.1, f"{row['loan_amount_millions']:.2f}",
           ha='center', va='bottom', fontsize=9, rotation=0, color='black')

plt.title('Total Funded Amount by Month', fontsize=14)
plt.xlabel('Month')
plt.ylabel('Funded Amount ($ Millions)')
plt.xticks(ticks=range(len(monthly_funded)), labels=monthly_funded['month_name'], rotation=45)
plt.grid(True, linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="989" height="490" alt="image" src="https://github.com/user-attachments/assets/22134780-c017-420a-b286-5f215d4a2de4" />




### Monthly Trends by Issue Date for Total Amount Received  


monthly_received = (
    df.sort_values('issue_date')
    .assign(month_name=lambda x: x['issue_date'].dt.strftime('%b %Y'))
    .groupby('month_name', sort=False)['total_payment']
    .sum()
    .div(1_000_000)
    .reset_index(name='received_amount_millions')
)

plt.figure(figsize=(10,5))
plt.fill_between(monthly_received['month_name'], monthly_received['received_amount_millions'], color='lightgreen', alpha=0.5)
plt.plot(monthly_received['month_name'], monthly_received['received_amount_millions'], color='green', linewidth=2)

for i, row in monthly_received.iterrows():
  plt.text(i, row['received_amount_millions'] + 0.1, f"{row['received_amount_millions']:.2f}",
           ha='center', va='bottom', fontsize=9, rotation=0, color='black')

plt.title('Total Received Amount by Month', fontsize=14)
plt.xlabel('Month')
plt.ylabel('Received Amount ($ Millions)')
plt.xticks(ticks=range(len(monthly_received)), labels=monthly_received['month_name'], rotation=45)
plt.grid(True, linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="989" height="490" alt="image" src="https://github.com/user-attachments/assets/68e9b607-16dc-483d-946c-e58ff643f3cb" />



### Monthly Trend by Issue Date for Total Loan Applications

monthly_applications = (
    df.sort_values('issue_date')
    .assign(month_name=lambda x: x['issue_date'].dt.strftime('%b %Y'))
    .groupby('month_name', sort=False)['id']
    .count()
    .reset_index(name='loan_applications_count')
)

plt.figure(figsize=(10,5))
plt.fill_between(monthly_applications['month_name'], monthly_applications['loan_applications_count'], color='orange', alpha=0.5)
plt.plot(monthly_applications['month_name'], monthly_applications['loan_applications_count'], color='darkred', linewidth=2)

for i, row in monthly_applications.iterrows():
  plt.text(i, row['loan_applications_count'] + 0.1, f"{row['loan_applications_count']}",
           ha='center', va='bottom', fontsize=9, rotation=0, color='black')

plt.title('Total Loan Applications by Month', fontsize=14)
plt.xlabel('Month')
plt.ylabel('Number of Applications')
plt.xticks(ticks=range(len(monthly_applications)), labels=monthly_applications['month_name'], rotation=45)
plt.grid(True, linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="989" height="490" alt="image" src="https://github.com/user-attachments/assets/217cbad0-0bd2-46a4-946e-e86983eb04c1" />



### Regional Analysis by State for Total Funded Amount

state_funding = df.groupby('address_state')['loan_amount'].sum().sort_values(ascending=True)
state_funding_thousands = state_funding / 1000

plt.figure(figsize=(10,8))
bars = plt.barh(state_funding_thousands.index, state_funding_thousands.values, color='lightcoral')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 10, bar.get_y() + bar.get_height() / 2,
           f'{width:,.0f}K', va='center', fontsize=9)

plt.title('Total Funded Amount by State (in $ Thousands)')
plt.xlabel('Funded Amount ($ \ 000)')
plt.ylabel('State')
plt.tight_layout()
plt.show()


<img width="983" height="790" alt="image" src="https://github.com/user-attachments/assets/89fb7e0a-719f-40cf-bcfd-1956e1e8d70c" />




### Regional Loan Analysis by State for Total Received Amount


state_receiving = df.groupby('address_state')['total_payment'].sum().sort_values(ascending=True)
state_receiving_thousands = state_receiving / 1000

plt.figure(figsize=(10,8))
bars = plt.barh(state_receiving_thousands.index, state_receiving_thousands.values, color='lightpink')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 10, bar.get_y() + bar.get_height() / 2,
           f'{width:,.0f}K', va='center', fontsize=9)

plt.title('Total Received Amount by State (in $ Thousands)')
plt.xlabel('Received Amount ($ \ 000)')
plt.ylabel('State')
plt.tight_layout()
plt.show()


<img width="983" height="790" alt="image" src="https://github.com/user-attachments/assets/2261c4ae-f04d-42a3-a3dc-18e1bc1ee5dd" />



### Regional Analysis by State for Total Loan Applications

state_applications = df.groupby('address_state')['id'].count().sort_values(ascending=True)


plt.figure(figsize=(10,8))
bars = plt.barh(state_applications.index, state_applications.values, color='lightcoral')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 10, bar.get_y() + bar.get_height() / 2,
           f'{width:,.0f}', va='center', fontsize=9)

plt.title('Total Loan Applications by State')
plt.xlabel('Loan Applications ')
plt.ylabel('State')
plt.tight_layout()
plt.show()


<img width="989" height="790" alt="image" src="https://github.com/user-attachments/assets/df2b4eaa-1f60-4301-8e4c-b3d47dd48129" />




### Loan Term Analysis by Total Funded Amount
term_funding_millions = df.groupby('term')['loan_amount'].sum() / 1000000

plt.figure(figsize=(10,5))
plt.pie(
    term_funding_millions,
    labels=term_funding_millions.index,
    autopct = lambda p: f"{p:.1f}%\n${p*sum(term_funding_millions)/100:.1f}M",
    startangle=90,
    wedgeprops={'width':0.4}
)
plt.gca().add_artist(plt.Circle((0,0), 0.70, color='white'))
plt.title('Total Funded Amount by Term(in $ Millions)')
plt.show()


<img width="489" height="427" alt="image" src="https://github.com/user-attachments/assets/a1672c83-b7f7-45c1-a3a2-1e8ffd9b1383" />




### Loan Term Analysis by Total Received Amount
term_receiving_millions = df.groupby('term')['total_payment'].sum() / 1000000

plt.figure(figsize=(10,5))
plt.pie(
    term_receiving_millions,
    labels=term_receiving_millions.index,
    autopct = lambda p: f"{p:.1f}%\n${p*sum(term_receiving_millions)/100:.1f}M",
    startangle=90,
    wedgeprops={'width':0.4}
)
plt.gca().add_artist(plt.Circle((0,0), 0.70, color='white'))
plt.title('Total Received Amount by Term(in $ Millions)')
plt.show()


<img width="490" height="427" alt="image" src="https://github.com/user-attachments/assets/03623bc2-bfe0-4975-871a-f2e5aa2c7a45" />



### Loan Term Analysis by Total Loan Applications
term_applications = df.groupby('term')['id'].count()

plt.figure(figsize=(10,5))
plt.pie(
    term_applications,
    labels=term_applications.index,
    autopct = lambda p: f"{p:.1f}%\n{p*sum(term_applications)/100:,}",
    startangle=90,
    wedgeprops={'width':0.4}
)
plt.gca().add_artist(plt.Circle((0,0), 0.70, color='white'))
plt.title('Term Applications')
plt.show()


<img width="470" height="490" alt="image" src="https://github.com/user-attachments/assets/1ff4aad0-5ac3-4c19-a918-c935a567fe33" />



### Employee Length by Total Funded Amount 

emp_funding_thousands = df.groupby('emp_length')['loan_amount'].sum().sort_values() / 1000

plt.figure(figsize=(10, 6))
bars = plt.barh(emp_funding_thousands.index, emp_funding_thousands, color='purple')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 5, bar.get_y() + bar.get_height() / 2,
           f"${width:,.0f}K", va='center', fontsize=9)
  
plt.title("Total Funded Amount by Employee Length")
plt.xlabel("Funded Amount ($ Thousands)")
plt.grid(axis='x', linestyle='--', alpha=0.5)
plt.tight_layout()
plt.show()


<img width="986" height="590" alt="image" src="https://github.com/user-attachments/assets/f775a161-87fe-4b8a-9d0c-b846c0633ef5" />



### Employee Length by Total Received Amount
emp_receiving_thousands = df.groupby('emp_length')['total_payment'].sum().sort_values() / 1000

plt.figure(figsize=(10, 6))
bars = plt.barh(emp_receiving_thousands.index, emp_receiving_thousands, color='purple')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 5, bar.get_y() + bar.get_height() / 2,
           f"${width:,.0f}K", va='center', fontsize=9)
  
plt.title("Total Received Amount by Employee Length")
plt.xlabel("Received Amount ($ Thousands)")
plt.grid(axis='x', linestyle='--', alpha=0.5)
plt.tight_layout()
plt.show()


<img width="986" height="590" alt="image" src="https://github.com/user-attachments/assets/fe908542-2753-4f9d-ab67-e0b2c38ec436" />



### Employee Length by Total Loan Application



emp_application = df.groupby('emp_length')['id'].count().sort_values()

plt.figure(figsize=(10, 6))
bars = plt.barh(emp_application.index, emp_application, color='purple')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 5, bar.get_y() + bar.get_height() / 2,
           f"{width:,.0f}", va='center', fontsize=9)
  
plt.title("Total Loan Application by Employee Length")
plt.xlabel("Loan Application")
plt.grid(axis='x', linestyle='--', alpha=0.5)
plt.tight_layout()
plt.show()

<img width="989" height="590" alt="image" src="https://github.com/user-attachments/assets/ffb460af-3c9f-4e50-adaa-86b7c78385e4" />



### Loan Purpose by Total Funded Amount


purpose_funding_millions = df.groupby('purpose')['loan_amount'].sum().sort_values() / 1000000

plt.figure(figsize=(10,6))
bars = plt.barh(purpose_funding_millions.index, purpose_funding_millions, color='skyblue')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 0.1, bar.get_y() + bar.get_height() / 2,
           f"${width:,.0f}M", va='center', fontsize=9)
  
plt.title("Total Funded Amount by Loan Purpose ($ Millions)", fontsize=14)
plt.xlabel("Funded Amount ($ Millions)")
plt.grid(axis='x', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="987" height="590" alt="image" src="https://github.com/user-attachments/assets/d07ec215-2c8a-4cd6-9ffb-028ee3611e50" />



### Loan Purpose by Total Received Amount
purpose_receiving_millions = df.groupby('purpose')['total_payment'].sum().sort_values() / 1000000

plt.figure(figsize=(10,6))
bars = plt.barh(purpose_receiving_millions.index, purpose_receiving_millions, color='skyblue')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 0.1, bar.get_y() + bar.get_height() / 2,
           f"${width:,.0f}M", va='center', fontsize=9)
  
plt.title("Total Received Amount by Loan Purpose ($ Millions)", fontsize=14)
plt.xlabel("Received Amount ($ Millions)")
plt.grid(axis='x', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="987" height="590" alt="image" src="https://github.com/user-attachments/assets/7866ac77-3def-47d3-9a63-b04c41691bec" />



### Loan Purpose by Total Loan Application

purpose_application = df.groupby('purpose')['id'].count().sort_values()

plt.figure(figsize=(10,6))
bars = plt.barh(purpose_application.index, purpose_application, color='skyblue')

for bar in bars:
  width = bar.get_width()
  plt.text(width + 0.1, bar.get_y() + bar.get_height() / 2,
           f"{width:,.0f}", va='center', fontsize=9)
  
plt.title("Total Loan Applications by Purpose", fontsize=14)
plt.xlabel("Loan Applications")
plt.grid(axis='x', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()


<img width="988" height="590" alt="image" src="https://github.com/user-attachments/assets/0aec5b36-c0d5-4657-bced-6d53e582215a" />




### Home Ownership by Total Funded Amount
home_funding = df.groupby('home_ownership')['loan_amount'].sum().reset_index()
home_funding['loan_amount_millions'] = home_funding['loan_amount'] / 1000000

fig = px.treemap(
    home_funding,
    path=['home_ownership'],
    values='loan_amount_millions',
    color='loan_amount_millions',
    color_continuous_scale='Blues',
    title='Total Funded Amount by Home Ownership ($ Millions)'
)

fig.show()


<img width="621" height="525" alt="newplot" src="https://github.com/user-attachments/assets/bf629bd0-c497-4bdf-a2df-7bfe51880c02" />



### Home Ownership by Total Received Amount
home_receiving = df.groupby('home_ownership')['total_payment'].sum().reset_index()
home_receiving['total_payment_millions'] = home_receiving['total_payment'] / 1000000

fig = px.treemap(
    home_receiving,
    path=['home_ownership'],
    values='total_payment_millions',
    color='total_payment_millions',
    color_continuous_scale='Blues',
    title='Total Received Amount by Home Ownership ($ Millions)'
)

fig.show()

<img width="621" height="525" alt="newplot (1)" src="https://github.com/user-attachments/assets/599f5efa-c194-46db-827e-e8d33e107e3f" />






### Home Ownership by Total Loan Applications
home_application = df.groupby('home_ownership')['id'].count().reset_index(name='application_count')


fig = px.treemap(
    home_application,
    path=['home_ownership'],
    values='application_count',
    color='application_count',
    color_continuous_scale='Blues',
    title='Total Loan Applications by Home Ownership '
)

fig.show()


<img width="621" height="525" alt="newplot (2)" src="https://github.com/user-attachments/assets/b3360b92-fd29-4826-8e72-e1836526c976" />









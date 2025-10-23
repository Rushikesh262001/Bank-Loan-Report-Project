select DISTINCT loan_status from bank_loan_data;

SELECT 
(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)
/
COUNT(id) as Bad_Loan_Percentage
from bank_loan_data;

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

SELECT 
   loan_status,
   COUNT(id) as MTD_Total_Applications,
   SUM(loan_amount) as MTD_Total_Loan_Amount,
   SUM(total_payment) as MTD_Total_Received_Amount,
   ROUND(AVG(int_rate * 100),2) as MTD_Avg_Int_Rate,
   ROUND(AVG(dti * 100),2) as MTD_Avg_Dti
FROM 
   bank_loan_data
WHERE 
   MONTH(issue_date) = 12
GROUP BY
   loan_status;


SELECT
    MONTH(issue_date) as Month_Number,
    DATENAME(MONTH,issue_date) AS Month_Name,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    MONTH(issue_date),DATENAME(MONTH,issue_date)
ORDER BY 
    MONTH(issue_date);


SELECT
    address_state,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    address_state
ORDER BY 
    address_state;

SELECT
    emp_title,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    emp_title
ORDER BY 
    emp_title;
SELECT
    emp_length,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    emp_length
ORDER BY 
    emp_length;

SELECT
    purpose,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    purpose
ORDER BY 
    COUNT(id) desc;



SELECT
    home_ownership,
    COUNT(id) as Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    bank_loan_data
GROUP BY 
    home_ownership
ORDER BY 
    COUNT(id) desc;
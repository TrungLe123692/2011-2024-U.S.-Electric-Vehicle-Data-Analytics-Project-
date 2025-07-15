# Avearge Electric Range 
SELECT 
    ROUND(AVG(Electric_Range), 2) AS Average_Electric_Range_Miles
FROM 
    ev_data;
    
# Total Number of Electric Vehicles 
SELECT 
    COUNT(*) AS Total_Electric_Vehicles
FROM 
    ev_data;
    
# Total BEV (Battery Electric Vehicle) Counts and Percentage 
SELECT 
    COUNT(*) AS Total_BEV_Vehicles,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 1) AS Percent_of_Total
FROM 
    ev_data
WHERE 
    Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)';
    
# Total PHEV (Plug-in Hybrid Vehicles) Count and Percentage
SELECT 
    COUNT(*) AS Total_PHEV_Vehicles,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 1) AS Percent_of_Total
FROM 
    ev_data
WHERE 
    Electric_Vehicle_Type = 'Plug-in Hybrid Electric Vehicle (PHEV)';
    
# Total Vehicles by Model Year 
SELECT 
    Model_Year,
    COUNT(*) AS Vehicles_Sold
FROM 
    ev_data
GROUP BY 
    Model_Year
ORDER BY 
    Model_Year ASC;
    
# Total Vehicles by State
SELECT 
    State,
    COUNT(*) AS Total_Registered
FROM 
    ev_data
GROUP BY 
    State
ORDER BY 
    Total_Registered DESC;
    
# Top 10 Make by Number of Vehicles 
SELECT 
    Make,
    COUNT(*) AS Vehicle_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent_of_Total
FROM 
    ev_data
GROUP BY 
    Make
ORDER BY 
    Vehicle_Count DESC
LIMIT 10;

# CAFV Egilibility Breakdown
SELECT 
    Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility AS CAFV_Status,
    COUNT(*) AS Vehicle_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent
FROM 
    ev_data
GROUP BY 
    Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility
ORDER BY 
    Vehicle_Count DESC;
    
# Total Vehicles by Model, Make and, EV Type 
SELECT 
    Model,
    Make,
    Electric_Vehicle_Type AS EV_Type,
    COUNT(*) AS Total_Vehicles,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_data), 2) AS Percent_of_Total
FROM 
    ev_data
GROUP BY 
    Model, Make, EV_Type
ORDER BY 
    Total_Vehicles DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
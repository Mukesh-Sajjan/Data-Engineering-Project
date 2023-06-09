# Powerlifting Meets Data Pipleine

A data pipleline for batch processing of 2 CSV file (Open Power Lifting and Meets)

Web --> Prefect --> GCS --> DBT --> BigQuery --> Looker Studio

# Objective

The project is intended to build a data pipeline for batch processing every week for Meets.csv and OpenPowerlifting.csv that was loaded from web to gcs using prefect tool with python script and then ingested over to BigQuery datawarehouse. Further, there are transformationx done to join these 2 csv files using meetid to bring the information together from both the files using inner join and tranforming the datatype of the existing columns. This transformation helped to come up with a new Powerliftingmaster table in BigQuery which was then connected to Looker Studio to build the dashboard.

# Dataset

[Powerlifting dataset](https://www.kaggle.com/datasets/dansbecker/powerlifting-database/code?resource=download) was downloaded from Kaggle that provides 2 csv data files where meetid is common to both files and can be used to join and integrate the fields to create one master file. Meets file provides the information about the events and the places where those events were organized. Open Powerlifting file provides the information on athletes, games they participated, ranking etc. 

# Tools and Technologies

* Cloud - Google Cloud Platform 
* Orchestration and Batch processing - Prefect 
* Transformation - dbt 
* Data Lake - Google Cloud Storage 
* Data Warehouse - BigQuery 
* Data Visualization - Looker Studio  
* Language - Python

# Architecture

<img width="592" alt="image" src="https://user-images.githubusercontent.com/123493239/230129451-4be2774f-9c24-4412-a8b2-2e9b77e9a935.png">

# Final Dashboard

<img width="617" alt="image" src="https://user-images.githubusercontent.com/123493239/230129925-49634466-2618-4b3e-bba9-33cfdc0a2504.png">


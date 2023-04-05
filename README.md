# Powerlifting Meets Data Pipleine

A data pipleline for batch processing of 2 CSV file (Open Power Lifting and Meets) with Prefect --> GCS --> DBT --> BigQuery --> Looker Studio

# Objective

The project is intended to build a data pipeline for batch processing every week for Meets.csv and OpenPowerlifting.csv that will be loaded from web to gcs using prefect tool with python script and then loaded over to BigQuery datawarehouse. Further, there are transformation done to join these 2 csv files using meetid to bring the information together from both the files using inner join and tranforming the datatype of the existing columns. This transformation helped to come up with a new Powerliftingmaster table in BigQuery which was then connected to Looker Studio to build the dashboard.


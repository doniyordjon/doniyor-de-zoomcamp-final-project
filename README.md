# Final Project for de-zoomcamp 2024

The project is an end-to-end data pipeline that takes data from an API, loads it into a data warehouse, transforms it using dbt, and visualizes it using Looker Studio.

### Dataset
For this exercise, I used a Kaggle dataset called [LinkedIn Job Postings - 2023](https://www.kaggle.com/datasets/arshkon/linkedin-job-postings)

### Dataset description
Every day, thousands of companies and individuals turn to LinkedIn in search of talent. This dataset contains a nearly comprehensive record of 33,000+ job postings listed over the course of 2 days, months apart. Each individual posting contains 27 valuable attributes, including the title, job description, salary, location, application URL, and work-types (remote, contract, etc), in addition to separate files containing the benefits, skills, and industries associated with each posting. The majority of jobs are also linked to a company, which are all listed in another csv file containing attributes such as the company description, headquarters location, and number of employees, and follower count.

### Project details
**The project heavily relies on the cloud. I used the following services:**
- GCP Virtual Machine Instance (Processing)
- Docker
- Terraform (Infrastructure as a Service)
- Mage (Data Pipeline - ETL)
- GCP Storage Bucket (Data Lake)
- Big Query (Data Warehouse)
- DBT (to manage data transformations)
- Looker Studio is free and comes with a Google account

I did the whole process in a virtual machine, for this I created a virtual machine in Google Cloud, created a service account, and installed an SSH key. Next, I connected to the virtual machine through Visual Studio Code. I also installed Anaconda, Docker and Terraform there. To create the GCP Storage Bucket (data lake) and Big Query (data warehouse), I deployed Terraform. Connected to Mage via Docker-compose.yml. See settings [here](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/docker-terraform)

I saved all my actions as a [screenshot](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/blob/main/screens/screens%20how%20create%20VM.pptx), you can read it or repeat it yourself.

For the sake of this project and to make it easier to access this data without using the Kaggle API, I have uploaded this data to my GitHub repository in the [dataset](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/dataset) folder.

[Mage](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/mage)

I used Mage to load data from the API into the BigQuery.

I have developed two pipelines (batch pipelines):

[Pipeline1](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/mage/pipeline_1)
I used this pipeline to load the original datasets named "job_postings.csv", then fill in the empty rows, leave the required columns and remove duplicates.

[Pipeline2](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/mage/pipeline_2)
I used this pipeline to load the original datasets named "companies.csv", then left the required columns and removed duplicates.

### DBT

After I ran the pipelines to load the data into BQ, I used dbt (a data building tool) to transform the data and create analytical models. dbt is a tool that allows you to write SQL queries and manage dependencies between tables.

https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/tree/main/dbt

I also locally added another company_industries.csv file to SEEDS DBT, I also used it to build the final data

![image](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/assets/121426236/bd376755-d0fb-4800-bc2b-0961c54e01ab)


Manufacturing data is stored in the “dbt_doniyor” dataset in BigQuery.

You can find out how to create a project in DBT, connect it with BigQuery and your Github repository in my [screenshots](https://github.com/doniyordjon/doniyor-de-zoomcamp-final-project/blob/main/screens/screens%20how%20create%20dbt%20project.pptx) and repeat it yourself.

### Looker
Finally, I [visualized](https://lookerstudio.google.com/reporting/cc4fc7da-97fe-4dfd-9ab3-16fc6cd5852c) the data using Looker using data from the “merged_data” table from the production dataset in BigQuery. Looker Studio is a web-based tool that allows you to explore and visualize data using a drag-and-drop interface.

*I tried to use all the technologies that were shown in the course, although logically they could have been reduced.*



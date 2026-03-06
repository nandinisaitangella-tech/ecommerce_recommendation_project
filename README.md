# E-Commerce Recommendation System  
Database-Driven Recommendation Pipeline Using Python and PostgreSQL  

## Description  

This project implements an end-to-end ecommerce recommendation pipeline using Python and PostgreSQL. The system ingests raw product and customer behavior datasets, loads them into a relational database, performs data cleaning and transformation, and applies segmentation and rule-based recommendation logic.

Rather than analyzing flat CSV files directly, the project integrates PostgreSQL as a structured storage layer. This enables scalable querying, structured schema management, and a cleaner workflow. The pipeline is modular and implemented step-by-step through Jupyter notebooks to ensure clarity and reproducibility.

---

## Technologies Used  

- Python 3  
- PostgreSQL  
- SQLAlchemy  
- Pandas  
- NumPy  
- python-dotenv  
- Jupyter Notebook  

---

## Data  

The project uses two CSV datasets: a product dataset and a customer behavior dataset. These files are loaded into PostgreSQL tables using SQLAlchemy for structured processing. Large raw datasets are excluded from version control due to size limitations.

---

## Project Structure  

The repository is organized into separate directories for notebooks, SQL scripts, and raw data. The `notebooks` folder contains the stepwise pipeline implementation. The `sql` folder contains schema-related scripts. Database credentials are managed securely using environment variables stored in a `.env` file.

---

## Installation  

Ensure PostgreSQL is installed and running. After cloning the repository, install dependencies using:

```
pip install -r requirements.txt
```

Create a `.env` file in the root directory and define:

```
DB_USER=your_username
DB_PASS=your_password
DB_HOST=localhost
DB_NAME=your_database_name
```

Make sure the database is created before running the notebooks.

---

## Machine Learning Model

A machine learning model is implemented to automatically predict the most suitable recommendation strategy for customers based on their behavioral attributes. Features such as age, engagement score, impulse buying score, return rate, and premium subscription status are used as inputs to the model.

A Random Forest Classifier is trained on the processed dataset to learn patterns between customer behavior and the appropriate recommendation strategy. The trained model can then predict personalized recommendations for new customers, helping automate and improve the recommendation process in an e-commerce environment.

---

## Usage  

Execute the notebooks sequentially. The initial notebook loads and inspects the data. The next notebook establishes the database connection and loads the datasets into PostgreSQL. Subsequent notebooks perform cleaning, segmentation, and recommendation logic implementation.

---

## Summary

This project presents a structured ecommerce recommendation pipeline built using Python and PostgreSQL. Raw product and customer behavior data are ingested, stored in a relational database, cleaned, and transformed to support segmentation and recommendation logic. The workflow follows a modular ETL approach and emphasizes secure credential management, database integration, and reproducible analysis. The implementation serves as a foundation for scalable recommendation systems and can be extended with advanced machine learning models or deployment strategies.chine learning models or deployment strategies.

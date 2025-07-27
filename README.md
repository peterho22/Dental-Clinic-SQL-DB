Dental-Clinic-SQL-DB

Overview

This project is a fully normalized SQL database designed to manage a simulated dental clinic’s operations. It includes tables for patients, employees (dentists and hygienists), visits, payment methods (insurance/self-pay), and dental procedures.
The database enforces referential integrity through foreign keys and supports secure, efficient data handling — a key aspect of healthcare and cybersecurity best practices.

Features

    Normalized Database Design: Organized into multiple related tables for patients, staff, visits, and procedures.

    Referential Integrity: Foreign key constraints to maintain accurate relationships between entities.

    Sample Data Inserts: Pre-populated with realistic data for testing queries and relationships.

    Comprehensive Queries: Includes examples for:

        Listing insured vs. self-paying patients

        Tracking patient visits and procedures

        Identifying patients over a certain age

        Sorting hygienists or dentists alphabetically

Technologies Used

    Database System: Microsoft SQL Server

    Query Language: SQL

    Concepts Practiced:

        Data normalization

        Foreign keys and constraints

        Complex joins

        Data filtering and aggregation

Database Structure

Main Entities:

    Persons – Core personal info (name, DOB, contact, address)

    Employees – Staff data linked to Persons (Dentists & Hygienists)

    Patients – Patient data linked to Persons

    Insurance & SelfPaying – Payment methods

    Visits & DentalRecords – Visit history and x-rays/procedure records

    Procedures & ProceduresPerVisit – Treatments performed per visit

How to Use

    Clone or download this repository.

    Open the SQL file (dental_clinic_database.sql) in SQL Server Management Studio (SSMS) or any SQL-compatible client.

    Execute the script in this order:

        CREATE TABLE statements

        INSERT sample data

        SELECT queries to verify results

Learning Outcomes

    Designed a normalized relational database structure

    Implemented foreign keys and constraints for data integrity

    Gained hands-on experience in query building and multi-table joins

    Practiced secure data modeling principles aligned with cybersecurity practices

Author

Peter Ho – Junior Cybersecurity Student at Kennesaw State University

Focused on database security, network defense, and real-world cybersecurity applications.

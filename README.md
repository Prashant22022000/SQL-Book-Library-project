📚 Library Management System – SQL Project

This project demonstrates how to design, build, and analyze a Library Management System using SQL. It simulates real-world scenarios in a digital library, covering data modeling, record manipulation, and business intelligence reporting.
🗂️ Dataset & Tables

The project uses CSV files for initial data and includes the following tables:

    books – List of all books with details like title, category, price, author, etc.

    branch – Library branch info including manager and contact.

    employees – Employees managing book issues and returns.

    members – Registered library members.

    issued_status – Logs of books issued.

    return_status – Logs of books returned.

⚙️ Setup Instructions

    Create Database & Tables
    Run data base creation.sql to:

        Create the libaray_p1 database.

        Create all core tables.

        Apply foreign key constraints.

    Import Data
    Use tools like pgAdmin or MySQL Workbench to import:

        books.csv

        branch.csv

        employees.csv

        members.csv

        issued_status.csv

        return_status.csv

    Execute Queries
    Run:

        intermediate Q 1-10.sql for CRUD operations & mid-level tasks.

        advance Q.sql for analytics and business insights.

🧪 Intermediate SQL Tasks (1–10)

These queries cover basic operations like:

    Insert, Update, Delete

    Find books by employee

    Group by issued count

    Create CTAS summary table

    Join tables to track members, categories, and revenue

    Calculate rental income by category

    Track new member registrations

    Branch manager mapping with employees

📊 Advanced SQL Tasks (11–17)

These go beyond querying into business analysis:
🔎 Highlights

    Task 11: Create a table of books with high rental price (>7)

    Task 12: List books not yet returned

    Task 13: Identify overdue members (420+ days late)

    Task 15: Branch performance report (issued count, returns, revenue)

    Task 16: Create active_members table with CTAS

    Task 17: Top 3 employees by number of book issues processed

📂 Repository Structure

.
├── books.csv
├── branch.csv
├── employees.csv
├── members.csv
├── issued_status.csv
├── return_status.csv
├── data base creation.sql            # DB & schema setup
├── intermediate Q 1-10.sql           # Basic-intermediate tasks
├── advance Q.sql                     # Advanced analysis
└── README.md                         # This documentation

🛠️ Technologies Used

    SQL (PostgreSQL / MySQL compatible)

    Relational Database Modeling

    CTAS, Window Functions, Aggregation

    Data Cleaning & ETL

    Analytical Query Design

🧠 Key Business Insights

    Active members & overdue users help target engagement strategies.

    Branch-wise revenue allows management to allocate resources efficiently.

    Top performing employees help identify valuable staff.

    Popular categories and books influence future acquisitions.

✅ Learning Objectives

    Relational database design

    SQL for business intelligence

    Using joins, CTEs, and window functions effectively

    CTAS for summary reporting

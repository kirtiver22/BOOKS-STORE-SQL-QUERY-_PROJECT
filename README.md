# 📚 Online Bookstore Database Analysis using SQL

[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![pgAdmin 4](https://img.shields.io/badge/GUI-pgAdmin_4-326690?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.pgadmin.org/)
[![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)](https://en.wikipedia.org/wiki/SQL)

---

## 📌 Project Overview
This project contains end-to-end data analysis for an **Online Bookstore System** developed in PostgreSQL using pgAdmin 4. It demonstrates relational schema design, data querying, multi-table joins, aggregations, and business metrics evaluation like inventory turnover and customer value.

---

## 📁 ## 🗄️ Database Schema

### 1. `Books`
| Column | Type | Constraints |
| :--- | :--- | :--- |
| `book_id` | INT | PRIMARY KEY |
| `title` | VARCHAR(100) | NOT NULL |
| `stock` | INT | NOT NULL |
| `price` | NUMERIC(10,2)| NOT NULL |

### 2. `Customers`
| Column | Type | Constraints |
| :--- | :--- | :--- |
| `customer_id` | INT | PRIMARY KEY |
| `name` | VARCHAR(100) | NOT NULL |
| `email` | VARCHAR(100) | UNIQUE |

### 3. `Orders`
| Column | Type | Constraints |
| :--- | :--- | :--- |
| `order_id` | INT | PRIMARY KEY |
| `customer_id` | INT | FOREIGN KEY (`Customers.customer_id`) |
| `book_id` | INT | FOREIGN KEY (`Books.book_id`) |
| `quantity` | INT | NOT NULL |
| `order_date` | DATE | NOT NULL |

---

## 🚀 Key Business Problems & ANALTICAL INSIGHTS
### Business Problems & Analytical Insights

---

### 1. Inventory Management & Stock Optimization

* **Business Problem 1: Stockout & Overselling Risk**
* *Question:* How many units of each book remain after fulfilling all orders, and which titles are at risk of stockouts?
* *Insight:* Calculating `Remaining Stock = Initial Stock - Total Units Sold` identifies critically low or negative inventory balances. This flags fast-moving titles that need immediate supplier replenishment before customer backorders occur.


* **Business Problem 2: Dead Stock & Capital Lockup**
* *Question:* Which books have zero or near-zero sales velocity while holding large physical inventory?
* *Insight:* Highlights non-performing titles occupying warehouse space. The business can bundle these titles with bestsellers, apply clearance discounts, or reduce reorder quantities to free up working capital.



---

### 2. Revenue & Catalog Performance

* **Business Problem 3: Revenue Drivers & Product Mix**
* *Question:* Which genres and specific titles generate the highest share of total revenue?
* *Insight:* Validates the 80/20 rule: a concentrated subset of popular genres (e.g., Fiction and Fantasy) produces the majority of overall revenue. Marketing spend and homepage showcase slots should be prioritized for these high-margin categories.


* **Business Problem 4: Pricing Strategy & Price Sensitivity**
* *Question:* What is the average selling price per genre, and does premium pricing reduce overall order volumes?
* *Insight:* Premium titles in high-demand categories maintain consistent sales volume despite higher price points, indicating inelastic demand and potential margin-expansion opportunities.


* **Business Problem 5: Author Performance & Sourcing**
* *Question:* Which authors drive the highest volume of book sales?
* *Insight:* Identifies top-performing authors to guide advance licensing deals, exclusive catalog releases, and tailored promotional campaigns.



---

### 3. Customer Acquisition, Value & Retention

* **Business Problem 6: Customer Segmentation & Lifetime Value (LTV)**
* *Question:* Who are the highest-spending customers, and what proportion of revenue do they contribute?
* *Insight:* Isolates high-value VIP buyers ("whales") who contribute disproportionately to total revenue. These accounts warrant dedicated loyalty rewards, personalized recommendations, and exclusive early-access perks.


* **Business Problem 7: Repeat Purchase & Retention Rates**
* *Question:* How many customers place repeat orders (2+ orders) versus one-off purchases?
* *Insight:* Evaluates customer retention health. A high one-time buyer ratio signals the need for automated post-purchase email flows, cross-sell discounts, and remarketing triggers.



---

### 4. Geographic & Operational Trends

* **Business Problem 8: High-Value Regional Markets**
* *Question:* Which cities and countries generate the highest total revenue and order frequency?
* *Insight:* Pinpoints high-density customer clusters. Logistics teams can optimize localized warehousing, reduce delivery fulfillment lead times, and run location-specific marketing campaigns.


*  **Business Problem 9:  Sales Velocity & Order Frequency**
* *Question:* What is the distribution of order sizes (single-item vs. bulk multi-unit orders)?
* *Insight:* Identifies average order quantity trends. High single-unit purchases suggest introducing volume threshold incentives (e.g., "Buy 2, Get 10% Off" or free shipping minimums) to lift Average Order Value (AOV).

# E-commerce-Database-Design-and-Optimization

## Overview

This project implements an e-commerce database schema using PostgreSQL. The schema includes tables for customers, products, categories, orders, and order items.
The database schema is designed to be in third normal form (3NF) to ensure data integrity and optimize query performance.

## Setup

1. **Database Schema Creation**: Execute the `schema.sql` script in a PostgreSQL database to create the required tables.
2. **Data Population**: Run the `data.sql` script to populate the database with sample data.
3. **Query Optimization**: Refer to the `queries.sql` script for optimized SQL queries.

## Database Schema

The database schema consists of the following tables:

- `customers`: Stores customer information.
- `products`: Contains details about products including name, price, and category.
- `categories`: Represents product categories.
- `orders`: Records customer orders with order dates.
- `order_items`: Tracks individual items ordered within each order.

## Normalization Techniques

Normalization has been applied to the database schema to minimize redundancy and ensure data consistency. Relationships between tables are established using
foreign key constraints.

## Optimized Queries

The `queries.sql` file contains optimized SQL queries for common e-commerce operations such as retrieving product details, calculating total sales, and fetching
customer orders.

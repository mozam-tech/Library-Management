# Library-Management 
# 📚 Library Management System (MySQL)

A simple but complete MySQL-based Library Management System designed for beginner-to-intermediate learners. It covers essential functionality such as managing authors, books, members, loans, and categories.

## 🧾 Description

This project simulates the core features of a basic library system, including:

- Registering authors and books
- Tracking book loans and returns
- Managing library members
- Organizing books by categories
- Ensuring data integrity with constraints and foreign keys

It’s ideal for learning SQL relationships, constraints, and building a normalized relational database.

## 🛠️ Features

- ✅ One-to-Many: Authors → Books
- ✅ One-to-Many: Members → Loans
- ✅ Many-to-Many: Books ↔ Categories
- ✅ Sample Data Insertions
- ✅ Constraints for data validation
- ✅ Clean and readable SQL script

## 🗃️ Database Schema Overview

| Table Name        | Description                              |
|------------------|------------------------------------------|
| `authors`         | Stores author details                    |
| `books`           | Stores book records and inventory data   |
| `members`         | Stores library member info               |
| `loans`           | Tracks borrowed and returned books       |
| `categories`      | Organizes books into categories          |
| `book_categories` | Junction table for books and categories  |

---

## ▶️ How to Set Up

1. **Open MySQL Workbench** (or your preferred SQL environment).
2. **Create a new schema** (optional):  
   ```sql
   CREATE DATABASE library;
   USE library;

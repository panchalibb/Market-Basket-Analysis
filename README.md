# Market-Basket-Analysis

This project performs a Market Basket Analysis using the Apriori algorithm to uncover product combinations that are frequently purchased together. These insights can be used to improve product placement, cross-selling strategies, and marketing decisions.

## Problem Statement

Retailers often have large volumes of transaction data, but struggle to convert it into actionable insights. By identifying which products are commonly bought together, businesses can optimize sales strategies such as:
- Product bundling
- Cross-promotions
- Personalized recommendations

## Objective

Use association rule mining to identify frequently co-purchased product combinations and generate actionable rules based on:
- Support
- Confidence
- Lift

## Tools & Technologies

- Python
- Pandas, NumPy
- mlxtend (Apriori, association rules)
- Matplotlib, Seaborn (visualizations)
- NetworkX (network graph visualization)
- Excel (initial data cleaning)
  
## Dataset Overview

The dataset contains retail transaction records with the following columns:
- InvoiceNo: Unique identifier for each transaction
- Description: Product name
- Quantity: Number of items purchased
- InvoiceDate: Date of transaction
- UnitPrice: Price per item
- CustomerID: Unique ID for each customer
- Country: Customer's country

## Workflow Summary

### Step 1: Data Cleaning (Excel)
- Removed nulls in `CustomerID` and `Description`
- Removed canceled transactions (those with 'C' in `InvoiceNo`)
- Removed rows with negative or zero `Quantity`
- Removed duplicates
- Standardized product names using `TRIM` and `LOWER`
- Removed duplicate items within the same invoice

### Step 2: Preprocessing (Python)
- Filtered data to a specific region (e.g., UK)
- Converted transactional data to basket format using one-hot encoding

### Step 3: Frequent Itemset Mining
- Used `mlxtend.apriori()` with `min_support=0.01`
- Extracted frequent item combinations

### Step 4: Association Rule Generation
- Applied `association_rules()` with metrics: support, confidence, and lift
- Filtered strong rules with `confidence > 0.5` and `lift > 1.2`

## Visualizations

- Bar Chart of Top 10 Rules by Support, Confidence, and Lift
- Heatmap of Lift between Antecedents and Consequents
- Scatter Plot (Support vs Confidence, bubble = Lift)
- Network Graph of Product Associations

## Key Insights

- Items like *Milk*, *Bread*, and *Butter* often appear together
- High lift values suggest strong non-random co-purchasing behavior
- Certain product pairs show 80–90% confidence of being bought together


## Business Impact

By leveraging these rules:
- Bundle frequently co-purchased items
- Reorganize store layouts or app menus
- Run personalized promotions for high-lift rules
- Improve targeting in recommendation engines



# Restaurant Order Analysis

### Project Overview

This project, **Restaurant Order Analysis**, is focused on analyzing restaurant order data to identify the most and least popular menu items and types of cuisine. By examining trends in customer preferences and spending patterns, the project aims to provide actionable insights for optimizing menu offerings and enhancing customer satisfaction.

### Dataset

The analysis uses the following table:

- **Order Details Table**  
  - **order_details_id**: Unique identifier for each order detail entry (SMALLINT, Primary Key)
  - **order_id**: Unique identifier for each order (SMALLINT)
  - **order_date**: Date of the order (DATE)
  - **order_time**: Time of the order (TIME)
  - **item_id**: Identifier for the menu item ordered (SMALLINT)

### Project Objectives and Tasks

The analysis is organized around three main objectives, each with specific tasks that contribute to a comprehensive understanding of menu performance and customer behavior.

---

### Objective 1: Explore the Items Table

**Goal**: Develop a thorough understanding of the menu items and their pricing.

**Tasks**:
- Find the number of items listed on the menu.
- Identify the least and most expensive items on the menu.
- Count the number of Italian dishes on the menu, and determine the least and most expensive items within this cuisine.
- Calculate the number of dishes within each category and the average price per category.

**Insights**:
This analysis reveals the price range and distribution of menu items, helping identify the most and least costly offerings, along with insights into the diversity and average pricing within each cuisine type.

---

### Objective 2: Explore the Orders Table

**Goal**: Gain insights into order patterns by examining the order dates, frequency, and item counts.

**Tasks**:
- Determine the date range of the orders in the dataset.
- Calculate the total number of orders and items ordered within this date range.
- Identify the orders with the highest item counts and count how many orders contained more than 12 items.

**Insights**:
These tasks highlight the ordering activity over time, indicating peak order dates, average order size, and exceptionally large orders, which may reflect special events or high customer demand periods.

---

### Objective 3: Analyze Customer Behavior

**Goal**: Understand customer ordering preferences and high-spend behavior through a combined analysis of orders and menu items.

**Tasks**:
- Merge the menu_items and order_details tables for a consolidated view of orders.
- Determine the least and most ordered items and identify their categories.
- Identify the top 5 highest spend orders and list the items within each.
- Bonus: Provide detailed insights on the top 5 highest spend orders, including the specific items ordered.

**Insights**:
This analysis provides insights into popular menu items and high-value orders, helping to identify which dishes drive customer interest and how top-spending customers interact with the menu. This information can support targeted marketing efforts and menu optimization.

---

### Summary of Findings

The **Restaurant Order Analysis** project offers valuable insights into menu and customer ordering trends, helping to pinpoint high-performing items, preferred cuisines, and patterns in high-value orders. These findings can inform pricing strategies, menu adjustments, and marketing initiatives aimed at enhancing customer engagement and restaurant profitability.

---

### How to Use This Analysis

The insights derived from this analysis can help restaurant managers and marketers:
- Tailor the menu to customer preferences by retaining or promoting popular dishes.
- Re-evaluate underperforming items for potential removal or rebranding.
- Target high-spending customers with personalized offers or loyalty rewards.

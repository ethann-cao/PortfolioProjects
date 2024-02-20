# Video Game Sales Analysis Project
## About

Welcome to the Video Game Sales Analysis project! 🎮 This repository hosts an in-depth exploration into the sales performance of video game consoles during the 7th (Wii, PS3, Xbox 360) and 8th (Wii U, PS4, Xbox One) generations. The gaming industry has witnessed remarkable evolution during these periods, and this project aims to provide valuable insights into the success and impact of some of the most iconic consoles.

## Purposes Of The Project

This dataset is intended for use in analyzing and understanding the sales and critical reception of video games. Researchers, analysts, and enthusiasts can explore various aspects, including regional sales patterns, the influence of genres, and the correlation between critic and user scores.

## About Data

The dataset was obtained from the [Kaggle Video Game Sales with Ratings] (https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings). The data contains 16 columns and 788 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| Name                    | Name of the game                        | TEXT           |
| Platform                | Console on which the game is runnning   | TEXT           |
| Year_of_Release         | Year of the game released               | NUMBER         |
| Genre                   | Game's category                         | TEXT           |
| Publisher               | Publisher                               | TEXT           |
| NA_Sales                | Game sales in North America             | NUMBER         |
| EU_Sales                | Game sales in the European Union        | NUMBER         |
| JP_Sales                | Game sales in Japan                     | NUMBER         |
| Other_Sales             | Game sales in the rest of the world     | NUMBER         |
| Global_Sales            | Total sales in the world                | NUMBER         |
| Critic_Score            | Aggregate score by Metacritic staff     | NUMBER         |
| Critic_Count            | The number of critics used              | NUMBER         |
| User_Score              | Score by Metacritic's subscribers       | NUMBER         |
| User_Count              | Number of users who gave the user_score | NUMBER         |
| Rating                  | The ESRB ratings                        | NUMBER         |

### Analysis List

1. Sales Trends Over Time

> Analyze how global sales have evolved over the years, highlighting trends and fluctuations in the gaming industry.

2. Platform Performance Comparison

> Compare the sales performance of different gaming platforms (consoles) to understand their impact on the market.

3. Genre Influence on Sales

> Investigate the correlation between game genres and sales figures, uncovering which genres dominate the market.

4. ESRB Rating Insights

> Investigate the influence of ESRB ratings on sales, exploring the preferences of different age groups.

5. Publisher Performance Analysis
   
> Analyze the contribution of different publishers to the gaming industry and their impact on sales.

## Approach Used

1. **Data Wrangling:** This is the first step where inspection of data is done to make sure **NULL** values and missing values are detected and data replacement methods are used to replace, missing or **NULL** values.

> 1. Import kaggle database

> 3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set **NOT NULL** for each field, hence null values are filtered out.

2. Generated some new columns from existing ones.

> 1. Add a new column named `adjusted_user_rating`, the current user rating system was out of 10, making it difficult to compare to the critic score.

2. Exploratory Data Analysis (EDA)

3. **Conclusion:**

## Business Questions To Answer

1. What is the overall trend in global video game sales over the years?
2. Are there specific years or periods that stand out in terms of sales growth or decline?
3. How do sales compare between different gaming platforms (Wii, PS3, Xbox 360, Wii U, PS4, Xbox One)?
4. Which platform had the highest total global sales?
5. Is there a correlation between critic scores and sales? User scores?
6. How do ESRB ratings correlate with sales? Are certain ratings more favorable for sales?
7. Which publishers have the highest total sales? Are there notable differences in performance among publishers?
8. Are there publishers that consistently release top-selling games?
9. Is there a relationship between the number of user reviews and game sales?

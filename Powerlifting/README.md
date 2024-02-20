# Powerlifting Database - Exploring Athletic Differences Between Genders

## About

Welcome to the Powerlifting Database repository! 🏋️ This dataset provides a comprehensive collection of information about powerlifting competitions, lifters, and their performance. Whether you're an athlete, researcher, or enthusiast, this dataset opens the door to exploring the fascinating world of powerlifting through data analysis.

## Purposes Of The Project

This portfolio project dives into the world of powerlifting, aiming to understand the athletic differences between male and female lifters. The analysis includes key aspects such as age trends, equipment usage, weight classes, and performance variations in squat, bench press, and deadlift.

## Dataset Overview

The Powerlifting Database includes a range of attributes for each competition entry, offering insights into the performances of male and female lifters. Here's a focused overview of key columns related to gender differences:

| Column Name        | Description                              | Data Type     |
|--------------------|------------------------------------------|---------------|
| Name               | Lifter's name                            | Text          |
| Sex                | Gender of the lifter                     | Text          |
| Equipment          | Type of equipment used (Raw, Equipped)   | Text          |
| Age                | Age of the lifter                        | Number        |
| WeightClass        | Weight class the lifter competes in      | Text          |
| Squat1Kg, Squat2Kg, Squat3Kg | Three attempts for squat in kilograms | Number  |
| Bench1Kg, Bench2Kg, Bench3Kg | Three attempts for bench press in kilograms | Number |
| Deadlift1Kg, Deadlift2Kg, Deadlift3Kg | Three attempts for deadlift in kilograms | Number |
| TotalKg            | Total weight lifted by the lifter         | Number        |

### Exploring Athletic Differences Between Genders

1. **Total Weight Lifted:**
   - The average total weight lifted by male and female lifters is compared, highlighting potential differences in overall strength.

2. **Age and Performance:**
   - The relationship between age and powerlifting performance is explored for both genders, identifying trends and potential age-related influences.

3. **Equipment Usage Patterns:**
   - The analysis delves into the types of equipment used by male and female lifters, offering insights into variations in performance based on equipment choices.

4. **Weight Class Distribution:**
   - The distribution of lifters across different weight classes is examined for males and females, with a focus on understanding the prevalence and characteristics of each weight class.

## Running the Analysis

To explore the detailed analysis and findings, check out the [PowerliftingReport.ipynb](https://github.com/ethann-cao/PortfolioProjects/blob/Master/Powerlifting/PowerliftingReport.ipynb) notebook. Clone the repository and navigate to the Powerlifting folder:

```bash
git clone https://github.com/your-username/powerlifting-database.git
cd powerlifting-database/analysis

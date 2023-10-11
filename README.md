# ECNS-460-Industry-vs-Compensation
This is a repository for the ECNS 460 Final project about the industry productivity, vs workers compensation by industry. We plan on looking into relationships between these two datasets to see if there are any trends between productivity and compensation, by industry, and other useful insights.

ECNS 460
Phase 1
Hans Petersen
Steven Ohms
10/11/2023



Data Analysis Project: Assessing Industry Productivity and Worker Compensation in the United States (2021)

Topic Description:
This project aims to assess relationships and trends between industry productivity and worker compensation for the year 2021. Productivity measures the efficiency of industries in generating economic output, while worker compensation reflects the wages received by employees. The findings of this project may offer insights between industry productivity and worker compensation. 

Motivation:
Analyzing the relationship between industry productivity and worker compensation could provide useful information for policymakers, labor organizations, and businesses. The findings of this project can allow for better informed economic decisions to be made, specifically in relation to labor market policies, wage negotiations, and economic development initiatives. Furthermore, the prospect of having access to this much data, can not only provide useful insights, but also seems very exciting.

Research Questions:
How does industry productivity vary across different sectors in the US in 2021?
Is there a relationship between productivity and worker compensation, and if so, how is it shaped?
Which industries stand out as outliers in terms of productivity and worker compensation compared to the industry averages?

Datasets:
Dataset 1: Labor productivity and costs measures; Detailed industries (URL)
Variables: Labor Productivity, Unit Labor Costs, Sectoral Output.
Coverage: United States, 1987 - 2022
Description: This dataset provides industry-level economic data, focusing on measures of productivity.
Dataset 2: Industry Employment and Wages - QCEW (URL)
Variables: Industry, Ownership (government or private), Average number of Employees, Average Weekly Wage.
Coverage: United States, 2021
Description: This dataset contains information on worker compensation by industry, 

Dataset Relationship:
The first dataset, Industry Productivity Data, offers insights into the productivity of United States industries. This data is then analyzed alongside the Worker Compensation Data, which provides details about worker compensation within these industries. By comparing the two datasets, we can evaluate the connection between industry productivity and worker compensation in the United States. The Industry Employment and wages dataset contains data from only 2021, we would have to trim the data from the Labor Productivity to match the 2021 timeframe. This in turn would also make our data purely cross-sectional, and not a combination of time series, and cross sectional. In order to inner join the dataset, we would have to join by industry. One tricky thing that will need to be done when cleaning is to group the industry attribute so that we can join on these values, as they are labeled differently in each dataset. 



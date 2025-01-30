

-- QUESTION 1: How many rows are in the data_analyst_jobs table?

SELECT COUNT(title)
FROM data_analyst_jobs;

-- 1793

___________________________________________________________________________________________________________________________________________________


-- QUESTION 2: Write a query to look at just the first 10 rows.                 What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- ExxonMobil

___________________________________________________________________________________________________________________________________________________


-- QUESTION 3: How many postings are in Tennessee?                   How many are there in either Tennessee or Kentucky?

-- PART 1
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN';

-- 21 postings

-- PART 2
SELECT count(title)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

-- 27 postings

___________________________________________________________________________________________________________________________________________________


-- QUESTION 4: How many postings in Tennessee have a star rating above 4?

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating >4;

-- 3 postings

___________________________________________________________________________________________________________________________________________________


-- QUESTION 5: How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 151 postings

___________________________________________________________________________________________________________________________________________________


-- QUESTION 6: Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating desc;

-- Nebraska has the highest average rating

___________________________________________________________________________________________________________________________________________________


-- QUESTION 7: Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs;

-- There are 881 unique job titles

___________________________________________________________________________________________________________________________________________________


-- QUESTION 8: How many unique job titles are there for California companies?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE location = 'CA';

-- OR

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- 230 unique job titles for California companies

___________________________________________________________________________________________________________________________________________________


-- QUESTION 9: Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more than 5000 reviews across all locations?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

-- 41 Companies overall and 40 companies with names

___________________________________________________________________________________________________________________________________________________


-- QUESTION 10: Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating desc;

-- General Motors has the highest average star rating and their rating is 4.199

___________________________________________________________________________________________________________________________________________________


-- QUESTION 11: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- OR

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; -- I like using this way because it allows me to do a quick check

-- 774 job titles include the word 'Analyst'

___________________________________________________________________________________________________________________________________________________


-- QUESTION 12: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- There are only 4 positions that do not include those words and they all have the word 'Tableau' in common.

____________________________________________________________________________________________________________________________________________________


-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

-- Disregard any postings where the domain is NULL.
-- Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
-- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- PART 1
SELECT domain, count(title) AS jobs_number
FROM data_analyst_jobs
WHERE domain is NOT NULL AND skill ILIKE'%SQL%' AND days_since_posting > 21
GROUP BY domain
ORDER BY jobs_number desc;

-- 1: Internet & Software, 62 jobs
-- 2: Banks & Financial Services, 61 jobs
-- 3: Consulting & Business Services, 57 jobs
-- 4: Health Care, 52 jobs

_________________________________________________________________________________________________________________________________________________


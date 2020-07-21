Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
	i. 	    Attribute table =		10000
	ii. 	Business table =		10000
	iii. 	Category table =		10000
	iv. 	Checkin table =			10000
	v. 	    elite_years table =		10000
	vi. 	friend table = 			10000
	vii. 	hours table =			10000
	viii. 	photo table = 			10000
	ix. 	review table = 			10000
	x. 	    tip table = 			10000
	xi. 	user table =			10000
	


2. Find the total number of distinct records for each of the keys listed below:

	i. 	    Business =			10000 	(id)
	ii. 	Hours =				1562 	(business_id)
	iii. 	Category =			2643    (business_id)
	iv. 	Attribute =			1115	(business_id)
	v. 	    Review =			10000	(id),		8090 (business_id), 	9581 (user_id)
	vi. 	Checkin = 			493 	(business_id)
	vii. 	Photo =				10000	(id),		6493 (business_id)
	viii. 	Tip = 				537	(user_id),      3979 (business_id)
	ix. 	User = 				10000	(id)
	x. 	    Friend = 			11	(user_id)
	xi. 	Elite_years =	                2780	(user_id)
	


3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
		select id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, 
			   compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, 
			   compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos
		from  user
		where 	id is null
				or name is null
				or review_count is null
				or yelping_since is null
				or useful is null
				or funny is null
				or cool is null
				or fans is null
				or average_stars is null
				or compliment_hot is null
				or compliment_more is null
				or compliment_profile is null
				or compliment_cute is null
				or compliment_list is null
				or compliment_note is null
				or compliment_plain is null
				or compliment_cool is null
				or compliment_funny is null
				or compliment_writer is null
				or compliment_photos is null
	

	
4. Find the minimum, maximum, and average value for the following fields:

	i. Table: Review, Column: Stars
		min: 1		max: 5		avg: 3.7082
		
	ii. Table: Business, Column: Stars
		min: 1.0	max: 5.0	avg: 3.6549
	
	iii. Table: Tip, Column: Likes
		min: 0		max: 2		avg: 0.0144
	
	iv. Table: Checkin, Column: Count
		min: 1		max: 53		avg: 1.9414
	
	v. Table: User, Column: Review_count
		min: 0		max: 2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		select city, sum(review_count)
		from business
		group by city
		order by sum(review_count) desc
	
	Copy and Paste the Result Below:
		+-----------------+-------------------+
		| city            | sum(review_count) |
		+-----------------+-------------------+
		| Las Vegas       |             82854 |
		| Phoenix         |             34503 |
		| Toronto         |             24113 |
		| Scottsdale      |             20614 |
		| Charlotte       |             12523 |
		| Henderson       |             10871 |
		| Tempe           |             10504 |
		| Pittsburgh      |              9798 |
		| MontrÃ©al       |              9448 |
		| Chandler        |              8112 |
		| Mesa            |              6875 |
		| Gilbert         |              6380 |
		| Cleveland       |              5593 |
		| Madison         |              5265 |
		| Glendale        |              4406 |
		| Mississauga     |              3814 |
		| Edinburgh       |              2792 |
		| Peoria          |              2624 |
		| North Las Vegas |              2438 |
		| Markham         |              2352 |
		| Champaign       |              2029 |
		| Stuttgart       |              1849 |
		| Surprise        |              1520 |
		| Lakewood        |              1465 |
		| Goodyear        |              1155 |
		+-----------------+-------------------+

	
6. Find the distribution of star ratings to the business in the following cities:

	i. Avon
	
		SQL code used to arrive at answer:
			select stars as [Star Rating], count(stars) as [Count]
			from business b
			where city = 'Avon'
			group by stars
		
		Copy and Paste the Resulting Table Below (2 columns - star rating and count):
			+-------------+-------+
			| Star Rating | Count |
			+-------------+-------+
			|         1.5 |     1 |
			|         2.5 |     2 |
			|         3.5 |     3 |
			|         4.0 |     2 |
			|         4.5 |     1 |
			|         5.0 |     1 |
			+-------------+-------+
	
	
	ii. Beachwood

		SQL code used to arrive at answer:
			select stars as [Star Rating], count(stars) as [Count]
			from business b
			where city = 'Beachwood'
			group by stars
		
		Copy and Paste the Resulting Table Below (2 columns - star rating and count):
			+-------------+-------+
			| Star Rating | Count |
			+-------------+-------+
			|         2.0 |     1 |
			|         2.5 |     1 |
			|         3.0 |     2 |
			|         3.5 |     2 |
			|         4.0 |     1 |
			|         4.5 |     2 |
			|         5.0 |     5 |
			+-------------+-------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
		select name, review_count
		from user
		order by review_count desc
		limit 3
		
	Copy and Paste the Result Below:
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+


8. Does posing more reviews correlate with more fans?
		- No
		
	Please explain your findings and interpretation of the results:
		- N/A
		
		SQL code:
			select name, review_count, fans
			from user
			order by fans desc
			limit 10
		
		Results:
			+-----------+--------------+------+
			| name      | review_count | fans |
			+-----------+--------------+------+
			| Amy       |          609 |  503 |
			| Mimi      |          968 |  497 |
			| Harald    |         1153 |  311 |
			| Gerald    |         2000 |  253 |
			| Christine |          930 |  173 |
			| Lisa      |          813 |  159 |
			| Cat       |          377 |  133 |
			| William   |         1215 |  126 |
			| Fran      |          862 |  124 |
			| Lissa     |          834 |  120 |
			+-----------+--------------+------+
	
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: more reviews with the word "love"

	
	SQL code used to arrive at answer:
		select (select count(text)
				from review
				where text like "%love%") as  love_text, 

			   (select count(text) 
				from review
				where text like "%hate%") as hate_text
		
		
		Results:
		+-----------+-----------+
		| love_text | hate_text |
		+-----------+-----------+
		|      1780 |       232 |
		+-----------+-----------+
	
	
		OR:
		
		SELECT 'love' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%love%'
		UNION
		SELECT 'hate' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%hate%'
		
		+------+-------------+
		| Word | Total Count |
		+------+-------------+
		| hate |         232 |
		| love |        1780 |
		+------+-------------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		select name, fans
		from user
		order by fans desc
		limit 10
	
	Copy and Paste the Result Below:
		+-----------+------+
		| name      | fans |
		+-----------+------+
		| Amy       |  503 |
		| Mimi      |  497 |
		| Harald    |  311 |
		| Gerald    |  253 |
		| Christine |  173 |
		| Lisa      |  159 |
		| Cat       |  133 |
		| William   |  126 |
		| Fran      |  124 |
		| Lissa     |  120 |
		+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
	
	yes

ii. Do the two groups you chose to analyze have a different number of reviews?

	yes         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

	Fitness is more popular and people avoid visiting a Smoke Shop in the city of Tempe


SQL code used for analysis:
	select * from business inner join hours on id = business_id where city = 'Tempe'
	select * from business inner join category on id = business_id where city = 'Tempe'
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         
        +-------------------+---------+
	| avg(review_count) | is_open |
	+-------------------+---------+
	|     23.1980263158 |       0 |
	|     31.7570754717 |       1 |
	+-------------------+---------+

ii. Difference 2:
         
        +---------------+---------+
	|    avg(stars) | is_open |
	+---------------+---------+
	| 3.52039473684 |       0 |
	| 3.67900943396 |       1 |
	+---------------+---------+
         
SQL code used for analysis:

	select avg(review_count) from business group by is_open
	select avg(stars) from business group by is_open
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
         Find the relationship between review and Category of Business

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
         
	 We need data from review table, category table and business table to find the relation between categories and reviews and find what categories attain what kind of reviews                  
                  
iii. Output of your finished dataset:
         
+----------------+----------------+----------------+------------------------+
|   avg(r.funny) |  avg(r.useful) |    avg(r.cool) | category               |
+----------------+----------------+----------------+------------------------+
|            6.0 |            6.0 |            4.0 | Active Life            |
|            0.0 |           0.25 |            0.0 | American (Traditional) |
|            0.0 |            0.0 |            0.0 | Arts & Entertainment   |
|            0.5 |            3.0 |            1.0 | Asian Fusion           |
|            0.0 | 0.333333333333 |            0.0 | Barbeque               |
|            0.0 | 0.333333333333 |            0.0 | Bars                   |
|            6.0 |            6.0 |            4.0 | Beaches                |
|            0.0 |            0.5 |            0.0 | Breakfast & Brunch     |
|            0.5 |            3.0 |            1.0 | Chinese                |
|            0.0 |            2.0 |            1.0 | Desserts               |
|            0.5 |            0.5 |            0.5 | Ethnic Food            |
|            0.5 |            0.5 |            0.5 | Farmers Market         |
| 0.166666666667 | 0.666666666667 | 0.333333333333 | Food                   |
|            0.5 |            0.5 |            0.5 | Fruits & Veggies       |
|            0.0 |            0.0 |            0.0 | Indian                 |
|            0.5 |            3.0 |            1.0 | Malaysian              |
|            0.5 |            0.5 |            0.5 | Market Stalls          |
|            0.5 |            0.5 |            0.5 | Meat Shops             |
|            0.0 |            0.0 |            0.0 | Music Venues           |
|            0.0 |           0.25 |            0.0 | Nightlife              |
|            0.5 |            3.0 |            1.0 | Noodles                |
|            0.0 |            0.0 |            0.0 | Pakistani              |
|            6.0 |            6.0 |            4.0 | Parks                  |
|            0.5 |            0.5 |            0.5 | Public Markets         |
| 0.111111111111 | 0.888888888889 | 0.222222222222 | Restaurants            |
+----------------+----------------+----------------+------------------------+
(Output limit exceeded, 25 of 32 total rows shown)         


iv. Provide the SQL code you used to create your final dataset:

	select avg(r.funny),avg(r.useful),avg(r.cool),c.category from (business b inner join category c on b.id = c.business_id) inner join review r on r.business_id = b.id group by category;
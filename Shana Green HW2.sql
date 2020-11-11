/*	Shana Green
	SQL Bridge
	HW 2
    Due 07/26/2020
*/

/*
1. Videos table.  Create one table to keep track of the videos. This table should include a unique ID, 
the title of the video, the length in minutes, and the URL.  
Populate the table with at least three related videos from YouTube or other publicly available resources. 

*/
CREATE TABLE `videos` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `length` float(16),
  `URL` varchar(256)
);

/*
2. Create and populate Reviewers table.  Create a second table that provides at least two user 
reviews for each of at least two of the videos. These should be imaginary reviews that include 
columns for the user’s name (“Asher”, “Cyd”, etc.), the rating (which could be NULL, 
or a number between 0 and 5), and a short text review (“Loved it!”).  
There should be a column that links back to the ID column in the table of videos.
*/

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
 
 `rating` int(1),
  `review` varchar (100),
  `v_id` int(11),
  constraint FOREIGN KEY (`v_id`) REFERENCES `Videos` (`id`) 
);


insert into `videos` (`title`,`length`,`URL`) values(
"How To Install MySQL on Windows 10", 24.17,
"https://www.youtube.com/watch?v=WuBcTJnIuzo");
insert into `videos` (`title`,`length`,`URL`) values(
"How to Make Login Form in PHP and MySQL" ,12.52, 
"https://www.youtube.com/watch?v=aIsu9SPcGbU");
insert into `videos` (`title`,`length`,`URL`) values(
"MySQL Database Tutorial - 22 - How To Join Tables",8.28,
"https://www.youtube.com/watch?v=6BfofgkrI3Y");
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'John',4,'Great Video',1);
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'Michael',5,'Perfect!',1);
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'David',3,'I did not like it.',2);
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'Michael',1,'Worst how-to video of my life!',2
);
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'John',2,'I still do not understand how to do this!',3);
insert into `reviews` (`user_name`,`rating`,`review`,`v_id`) values(
'David',5,'This video helped me learn more about MySQL!',3);

/*
3. Report on Video Reviews.  Write a JOIN statement that shows information from both tables. 
*/
SELECT * FROM videos;
SELECT * FROM reviews;

SELECT * FROM videos JOIN reviews;
# Homework feedback: ﻿﻿﻿﻿﻿﻿﻿﻿﻿Change previous statement to SELECT * FROM videos JOIN reviews where videos.id = reviews.v_id ;


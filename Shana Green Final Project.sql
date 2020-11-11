/*	Shana Green
	SQL Bridge
	Final Project
    Due 08/01/2020
*/

DROP TABLE IF EXISTS grps;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS group_rooms;

CREATE TABLE grps (
grp_id INT PRIMARY KEY,
grp_name VARCHAR(30)
);

CREATE TABLE users (
user_id INT PRIMARY KEY,
user_name VARCHAR(30),
grp_id INT
);

CREATE TABLE rooms (
room_id INT PRIMARY KEY,
room_name VARCHAR(30) 
);

CREATE TABLE group_rooms(
group_room_id INT PRIMARY KEY,
grp_id INT,
room_id INT
);

INSERT INTO grps (grp_id, grp_name) VALUES (1,'I.T.');
INSERT INTO grps (grp_id, grp_name) VALUES (2,'Sales');
INSERT INTO grps (grp_id, grp_name) VALUES (3,'Administration');
INSERT INTO grps (grp_id, grp_name) VALUES (4,'Operations');
									 
SELECT * FROM grps;

INSERT INTO users(user_id, user_name , grp_id) VALUES (1,'Modesto', 1);
INSERT INTO users(user_id, user_name , grp_id) VALUES (2,'Ayine', 1);
INSERT INTO users(user_id, user_name , grp_id) VALUES (3,'Christopher', 2);
INSERT INTO users(user_id, user_name , grp_id) VALUES (4,'Cheong woo', 2);
INSERT INTO users(user_id, user_name , grp_id) VALUES (5,'Saulat',3);
INSERT INTO users(user_id, user_name , grp_id) VALUES (6,'Heidy', NULL);

SELECT * FROM users;

INSERT INTO rooms(room_id, room_name) VALUES(1,'101');
INSERT INTO rooms(room_id, room_name) VALUES(2,'102');
INSERT INTO rooms(room_id, room_name) VALUES(3,'Auditorium A');
INSERT INTO rooms(room_id, room_name) VALUES(4,'Auditorium B');

SELECT * FROM rooms;

INSERT INTO group_rooms(group_room_id,grp_id, room_id) VALUES(1,1,1);
INSERT INTO group_rooms(group_room_id,grp_id, room_id) VALUES(2,1,2);
INSERT INTO group_rooms(group_room_id,grp_id, room_id) VALUES(3,2,2);
INSERT INTO group_rooms(group_room_id,grp_id, room_id) VALUES(4,2,3);

SELECT * FROM group_rooms;

# 1. All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

SELECT u.user_name, g.grp_name FROM users u RIGHT JOIN grps g ON u.grp_id = g.grp_id;


# 2.All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.

SELECT r.room_name, gp.grp_name FROM rooms r 
LEFT OUTER JOIN group_rooms g ON r.room_id = g.room_id
LEFT OUTER JOIN  grps gp ON gp.grp_id = g.grp_id;

# 3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.

SELECT u.user_name, gp.grp_name, r.room_name FROM users u
INNER JOIN grps gp ON u.grp_id = gp.grp_id
INNER JOIN group_rooms gr ON gr.grp_id = gp.grp_id
INNER JOIN rooms r ON gr.room_id = r.room_id
ORDER BY u.user_name ASC, gp.grp_name ASC, r.room_name ASC;

#Heidy is a new hire and will not be listed in this query. Saulat is in Administration, but he was not assigned a room.


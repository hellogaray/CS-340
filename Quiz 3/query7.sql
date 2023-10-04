-- Delete all people whose age is NULL. Then, list all such people whose age is NOT NULL. -- 13 points
DELETE FROM bsg_people
WHERE bsg_people.age IS NULL;

SELECT * FROM bsg_people;

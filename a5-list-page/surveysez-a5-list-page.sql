/*
second of SurveySez tables
  02/14/2023
  
  Here are a few notes on things below that may not be self evident:
  
  INDEXES: You'll see indexes below for example:
  
  INDEX SurveyID_index(SurveyID)
  
  Any field that has highly unique data that is either searched on or used as a join should be indexed, which speeds up a  
  search on a tall table, but potentially slows down an add or delete
  
  TIMESTAMP: MySQL currently only supports one date field per table to be automatically updated with the current time.  We'll use a 
  field in a few of the tables named LastUpdated:
  
  LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP
  
  The other date oriented field we are interested in, DateAdded we'll do by hand on insert with the MySQL function NOW().
  
  CASCADES: In order to avoid orphaned records in deletion of a Survey, we'll want to get rid of the associated Q & A, etc. 
  We therefore want a 'cascading delete' in which the deletion of a Survey activates a 'cascade' of deletions in an 
  associated table.  Here's what the syntax looks like:  
  
  FOREIGN KEY (SurveyID) REFERENCES winter2023_surveys(SurveyID) ON DELETE CASCADE
  
  The above is from the Questions table, which stores a foreign key, SurveyID in it.  This line of code tags the foreign key to 
  identify which associated records to delete.
  
  Be sure to check your cascades by deleting a survey and watch all the related table data disappear!
  
  
*/


SET foreign_key_checks = 0; #turn off constraints temporarily

#since constraints cause problems, drop tables first, working backward
DROP TABLE IF EXISTS winter2023_responses_answers; 
DROP TABLE IF EXISTS winter2023_responses;
DROP TABLE IF EXISTS winter2023_answers;
DROP TABLE IF EXISTS winter2023_questions;
DROP TABLE IF EXISTS winter2023_surveys;
  
#all tables must be of type InnoDB to do transactions, foreign key constraints
CREATE TABLE winter2023_surveys(
SurveyID INT UNSIGNED NOT NULL AUTO_INCREMENT,
AdminID INT UNSIGNED DEFAULT 0,
Title VARCHAR(255) DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
TimesViewed INT DEFAULT 0,
Status INT DEFAULT 0,
PRIMARY KEY (SurveyID)
)ENGINE=INNODB; 

#assigning first survey to AdminID == 1
-- 1
INSERT INTO winter2023_surveys VALUES (NULL,1,'Our First Survey','This is the first survey and serves as a test.',NOW(),NOW(),0,0); 
-- 2
INSERT INTO winter2023_surveys VALUES (NULL,1,'Drawing Survey','The purpose of this survey is to gain insight about peoples drawing habits, preferences, and opinions. You can help me understand what types of subjects and styles you enjoy ',NOW(),NOW(),0,0); 
-- 3
INSERT INTO winter2023_surveys VALUES (NULL,1,'Spongebob Survey','In order to understand Spongebob fans, we need to know how they think. Are you a spongebob fan? Then answer the questions in this survey and contribute to our understanding of Spongebob fans.  ',NOW(),NOW(),0,0); 

#foreign key field must match size and type, hence SurveyID is INT UNSIGNED
CREATE TABLE winter2023_questions(
QuestionID INT UNSIGNED NOT NULL AUTO_INCREMENT,
SurveyID INT UNSIGNED DEFAULT 0,
Question TEXT DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (QuestionID),
INDEX SurveyID_index(SurveyID),
FOREIGN KEY (SurveyID) REFERENCES winter2023_surveys(SurveyID) ON DELETE CASCADE
)ENGINE=INNODB;

-- 1
INSERT INTO winter2023_questions VALUES (NULL,1,'Do you enjoy listening to music?','We really want to know if you enjoy music.',NOW(),NOW());
-- 2
INSERT INTO winter2023_questions VALUES (NULL,1,'Do you enjoy watching movies','We want to know what kinds of movies you like.',NOW(),NOW());
-- 3
INSERT INTO winter2023_questions VALUES (NULL,1,'Do you play video games','We want to know what games you play.',NOW(),NOW());

-- 4
INSERT INTO winter2023_questions VALUES (NULL,2,'How often do you draw?','How many times does a person typically draw.',NOW(),NOW());
-- 5
INSERT INTO winter2023_questions VALUES (NULL,2,'What style of art do you enjoy','What genres and art styles do preople prefer. ',NOW(),NOW());
-- 6
INSERT INTO winter2023_questions VALUES (NULL,2,'If you draw what is your preferred drawing medium?','What tools do artists like to use.',NOW(),NOW());

-- 7
INSERT INTO winter2023_questions VALUES (NULL,3,'What is the name of Spongebobs best friend in your opinion?','Desc',NOW(),NOW());
-- 8
INSERT INTO winter2023_questions VALUES (NULL,3,'What is Spongebobs occupation?','Desc',NOW(),NOW());
-- 9
INSERT INTO winter2023_questions VALUES (NULL,3,'What is the song that spongebob plays around a campfire?','Desc',NOW(),NOW());


CREATE TABLE winter2023_answers(
AnswerID INT UNSIGNED NOT NULL AUTO_INCREMENT,
QuestionID INT UNSIGNED DEFAULT 0,
Answer TEXT DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
Status INT DEFAULT 0,
PRIMARY KEY (AnswerID),
INDEX QuestionID_index(QuestionID),
FOREIGN KEY (QuestionID) REFERENCES winter2023_questions(QuestionID) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO winter2023_answers VALUES (NULL,1,'Yes, I listen to music any chance I get.','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,1,'Only sometimes.','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,1,'I prefer a podcast.','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,1,'No I dont like music.','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,2,'I enjoy Drama','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,2,'I enjoy Sci-Fi','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,2,'I enjoy Horror','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,2,'I enjoy Psychological Thrillers','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,2,'No, I prefer a tv-show','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,2,'I dont consume media','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,3,'Yes I like First Person Shooters','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,3,'Yes I enjoy single player games','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,3,'Yes I enjoy multiplayer games with friends','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,3,'Pineapple','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,3,'No I do not enjoy gaming','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,4,'I draw every day','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,4,'I draw every few days','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,4,'I draw occasionally','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,4,'I dont draw','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,5,'I enjoy pop art','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,5,'Surreal art is my cup of tea','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,5,'Manga style is where its at!','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,5,'I enjoy art from the classical masters','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,6,'I Draw digitally','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,6,'I enjoy working with graphite','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,6,'I like graphite and charcoal','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,6,'Paints are superior','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,7,'Squidward','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,7,'Gary','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,7,'Patrick Star','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,7,'Sandy Cheeks','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,7,'Bubble Buddy','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,8,'Certified Fry Cook','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,8,'Artist','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,8,'Security','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,8,'Vocalist','',NOW(),NOW(),0);

INSERT INTO winter2023_answers VALUES (NULL,9,'Sweet Victory','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,9,'Ripped Pants','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,9,'C.A.M.P.F.I.R.E.S.O.N.G Song','',NOW(),NOW(),0);
INSERT INTO winter2023_answers VALUES (NULL,9,'F.U.N','F is for friends who do stuff together, U is for URANIUM... BOMB!',NOW(),NOW(),0);

CREATE TABLE winter2023_responses(
ResponseID INT UNSIGNED NOT NULL AUTO_INCREMENT,
SurveyID INT UNSIGNED NOT NULL DEFAULT 0,
DateAdded DATETIME,
PRIMARY KEY (ResponseID),
INDEX SurveyID_index(SurveyID),
FOREIGN KEY (SurveyID) REFERENCES winter2023_surveys(SurveyID) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO winter2023_responses VALUES (NULL,1,NOW());


CREATE TABLE winter2023_responses_answers(
RQID INT UNSIGNED NOT NULL AUTO_INCREMENT,
ResponseID INT UNSIGNED DEFAULT 0,
QuestionID INT DEFAULT 0,
AnswerID INT DEFAULT 0,
PRIMARY KEY (RQID),
INDEX ResponseID_index(ResponseID),
FOREIGN KEY (ResponseID) REFERENCES winter2023_responses(ResponseID) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO winter2023_responses_answers VALUES (NULL,1,1,1);
INSERT INTO winter2023_responses_answers VALUES (NULL,1,2,5);
INSERT INTO winter2023_responses_answers VALUES (NULL,1,3,6);
INSERT INTO winter2023_responses_answers VALUES (NULL,1,3,7);
INSERT INTO winter2023_responses_answers VALUES (NULL,1,3,8);
SET foreign_key_checks = 1; #turn foreign key check back on

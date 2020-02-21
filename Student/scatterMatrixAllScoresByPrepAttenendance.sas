PROC SQL;
CREATE TABLE WORK.query AS
SELECT gender , test_preparation_course , math_score , reading_score , writing_score FROM WORK.IMPORT;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC PRINT DATA=WORK.details;
RUN;

PROC sgscatter  DATA = work.import;
   matrix math_score reading_score writing_score
   / group = test_preparation_course;

   title 'Math score vs. reading score vs. writing score for students by test preperation course attendance';
RUN; 
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

proc ttest data = work.import ;
   paired reading_score*math_score;
   run;
  
proc ttest data = work.import ;
   paired reading_score*writing_score;
   run;

proc ttest data = work.import ;
   paired math_score*writing_score;
   run;

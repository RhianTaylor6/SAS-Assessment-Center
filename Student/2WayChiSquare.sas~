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

proc freq data = work.import;
tables gender*math_score 
/chisq 
;
run;

proc freq data = work.import;
tables gender*reading_score 
/chisq 
;
run;

proc freq data = work.import;
tables gender*writing_score 
/chisq 
;
run;
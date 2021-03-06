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

PROC MEANS DATA = work.import;
CLASS test_preparation_course ;
VAR math_score;

PROC MEANS DATA = work.import;
CLASS test_preparation_course ;
VAR reading_score;

PROC MEANS DATA = work.import;
CLASS test_preparation_course ;
VAR writing_score;
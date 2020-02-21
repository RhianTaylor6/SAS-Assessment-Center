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

PROC ANOVA DATA = work.import;
CLASS gender;
MODEL math_score = gender;
RUN;

PROC ANOVA DATA = work.import;
CLASS gender;
MODEL reading_score = gender;
RUN;

PROC ANOVA DATA = work.import;
CLASS gender;
MODEL writing_score = gender;
RUN;
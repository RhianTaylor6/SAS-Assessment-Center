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

proc ttest data = work.import sides = 2 alpha = 0.05 h0 = 0;
   title "Two sample t-test example";
   class gender; 
   var math_score;
   run;
  
proc ttest data = work.import sides = 2 alpha = 0.05 h0 = 0;
   title "Two sample t-test example";
   class gender; 
   var reading_score;
   run;

proc ttest data = work.import sides = 2 alpha = 0.05 h0 = 0;
   title "Two sample t-test example";
   class gender; 
   var writing_score;
   run;  
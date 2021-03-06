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

proc univariate data = work.import noprint;
histogram math_score
/ 
normal ( 
   mu = est
   sigma = est
   color = blue
   w = 2.5 
)
barlabel = percent
midpoints = 0 to 100 by 5;
run;

ods noproctitle;
ods graphics / imagemap=on;

/* Exploring Data */
proc univariate data=work.import;
	ods select Histogram;
	var math_score;
	class gender;
	histogram math_score / normal;
run;

proc univariate data=work.import;
	ods select Histogram GoodnessOfFit QQPlot;
	var math_score;

	/* Checking for Normality */
	histogram math_score / normal(mu=est sigma=est);
	qqplot math_score / normal(mu=est sigma=est);
run;
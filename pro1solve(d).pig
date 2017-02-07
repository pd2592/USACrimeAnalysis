crimes_arrest_date = foreach usacrimes generate $2, $8;

filtered_crimes_arrest_date = filter crimes_arrest_date by $1==true;

todate_filtered_crimes_arrest_date = foreach filtered_crimes_arrest_date generate ToDate($0,'MM/dd/yyyy HH:mm:ss a'), $1;


req_date_filtered = FILTER todate_filtered_crimes_arrest_date BY $0 < ToDate('2015-10-31','yyyy-MM-dd');

req_date_filtered_2 = FILTER req_date_filtered BY $0 > ToDate('2014-09-30','yyyy-MM-dd');

res = group req_date_filtered_2 by $1;

result = foreach res generate COUNT($1);

dump result;

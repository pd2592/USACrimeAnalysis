crimes_arrest_district = foreach usacrimes generate $5, $8;

filter_theft = filter crime_arrest_district by $0=='THEFT';

countres = filter filter_theft by $1==true;

countresult = group countres all;

result = foreach countresult generate COUNT($1);

dump result;

REGISTER '/usr/local/pig/lib/piggybank.jar';

usacrimes = LOAD 'crimesusa' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX');

group_usacrimes_by_fbi = group usacrimes by $14;

count_cases_each_fbi = foreach group_usacrimes_by_fbi generate group, COUNT($1);

filter_count_fbi = filter count_cases_each_fbi by $0==26;

dump filter_count_fbi;

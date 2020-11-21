#Script started on Πεμ 15 Ιούν 2017 10:45:09 πμ EEST
#AWK is a language for processing text files
#AWK was created at Bell Labs released in 1977
#Named after Alefred Aho, Peter Weinberger and Brian Kernighan
#TAPL - The AWK Programming Language
#It is also available in windows as GAWK
#!/bin/bash

# AWK is a field processor
# Unlike grep it will parse each field in a document on each line, where grep would return you 
# the entire line

#awk '-flags /pattern/ {functions}' file

##A file is trated as a sequence of records and by default each line is a record.
## Each word a field

#awk '{print $1}' test.txt # prints first word from every line of test.txt
#awk '{print $1, $2}' test.txt # prints first & seconds words
#awk '{print $1.$2}' test.txt # returns first & seconds words (no spaces in between)
#awk '{print $1 $2}' test.txt # returns first & seconds words (no spaces in between)
#awk '{if($1 ~/123/) print}' test.txt # prints lines that have '123' somewhere in them
#awk '/the/' test.txt # returns every line containing the word 'the'
#awk '/^the/' test.txt # returns every line starting with 'the'
#awk '/the$/' test.txt
#awk '/[0-9]/' test.txt # returns every line only containing numbers
#awk '/[a-z]/' test.txt # retuns every line only containing lower case chars
#awk '/hel+o/' test.txt
#awk '/abc|123/' test.txt #eg. abc123, abcdef123 123abc, returns any lines with abc or 123
#awk 'END{print NR}' file1 file2 # print No of lines

## awk variables..
## FS = Input field separator value
## OFS = Output field separator value
## NF = Number of fields on the current line
## NR = Number of records in the current line
## RS = Record separator value
## ORS = Output record separator
## FILENAME = Current file name being processed and probably a few more :0)

## {functions go int curly brackets}
#awk '{print NR}' test.txt # prints line number for every line processed

##END means the statement that follows should be executed once AWK has finished processing
#awk 'END{print NR}' test.txt # counts line in a file (similar to 'wc -l')
##We use BEGIN to perform actions before the file is processed
#awk 'BEGIN{print "the start"};{print};END{print "the end"}' test.txt

## '~' regular expression match
#awk '{if(NR~/^2$/)print}' test.txt # would print line 2 from test.txt
#awk '{if(NR~2)print}' test.txt # would print any line containing number 2
## '!~' negated match
#awk '{if(NR==2)print}' test.txt # would print only line 2 from test.txt
#awk '{if(NR!=2)print}' test.txt

# AWK Flags
# -F"separator_symbol"		(without the quotes)
#		separator_symbol will be the symbol used to separate the words (instead of space)
#		By default separator_symbol is the [SPACE] and [TAB] characters
#		The separator Symbol separates fields
#
# alternatively use:
#
# FS="separator_symbol" 
#		which marks new symbol separator
#
# -f awk_commands_file file_to_operate_at
# 	usage:
# awk -f parse_awk_commands_test.awk test.txt
#


awk -F":" '
BEGIN { 
print  "==============================================================="
printf "%-8s %-3s %+6s %-15s %-15s\n","User","UID","GID","Home","Shell"
print  "==============================================================="
}
NR==1,NR==10 { printf "%-8s %3d %6d %-15s %-15s\n",$1,$3,$4,$6,$7 } ' /etc/passwd


# Combining grep and awk
#grep -i test test.txt | awk '{if($1 ~ /^[0-9]/) print}' test.txt

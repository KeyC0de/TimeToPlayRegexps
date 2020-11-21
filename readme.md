<h1 align="center">
	<a href="https://github.com/KeyC0de/TimeToPlayRegexps">Time to Play RegExps</a>
</h1>
<hr>


Playing with regular expressions. My personal notes on regexps, awk, sed, grep and C++ regexps, Java regexps, Python regexps, Bash (linux shell) regexps, Javascript (regexps), PHP (regexps) etc.

Regular expressions are sequences of characters and symbols to be searched for within a longer piece of text.

Regular expression lies inside slashes: /regExp/ (match precise string here)

To create a pattern that matches only those numbers:
```
917-555-1234
and
646.867-5309
stop it!
```

use `\d{3}[-.]\d{3}[-.]\d{4}`

**<u>Meta Characters</u>**

* \g : global matching, matches found in entire text
* \G : matches the end of previously successful match
* \i : case insensitive matching
* \m : enabled multiline mode
* \A : match whole text
* \d : any digit \in {0,1,...,9}
* \D : any non-digit
* \w : any character \in {A-Z, a-z, 0-9}
* \W : any non-character
* \s : any whitespace eg. tab, space
* \S : any non-whitespace
* \. : literal dot character (the backslash `\` makes literal any metacharacter)
* \[ , \] : literal brackets only matching
* \(sequence) : matches sequence literally <u>and</u> "captures"

**<u>Quantifier Meta Characters</u>**

\regexp\{quantifier-meta-character} : they always go after the main regexp

* * : 0 or more (greedy wildcard)
* *? : non-greedy version (matches separated strings)
* + : 1 or more orccurrences, eg. given this regex: colou?rs? : the u and s are optional in the search string, matches: colour, color, colours, colors
* {min,max} : matches at least min occurrences and maximum max occurrences
* {min,} : at least min occurrences
* {number} : eg sw{6} : find all 6 letter/number occurrences
* {n,} : finds all n or more occurring matches

**<u>Position Meta Characters</u>**

* $ : ending the match
* \b : word boundary
* \B : non-word boundary
* ^ : beginning

eg \b\w{4,6}\b : all words between 4 & 6 (arithmetic or numeric characters)

**<u>Character Class</u>**

Stuff that appears in between square brackets [stuff] (stuff is a character class).

eg. l[yi C]nk : matches sequences of characters that contain a y or an i or a SPACE or an opening parentheses and are enclosed between a starting 'l' character and two closing "nk" characters - lynk, link, l nk, lCnk

* [a-z] : any character (only one) between a and z
* [0-5] : any number between 0 and 5
* [^abc] : any character except a or b or c which is located at the beginning of a word. ^ is a special character inside a character class only when it is the first symbol in the character class

eg
\b[A-Z][a-z]+\b : match a single capital letter, followed by 1 or more lower case letters in a word

**<u>Alternation</u>**

To match any of these email addresses:
```
daniel@shiffman.net
daniel.shiffman@gmail.com
daniel.shiffman@nyu.edu
```

* [\w.]+@\w+\.(net|com|edu) : any number of characters/numbers or a dot followed by an @ symbol, followed by any number of characters/numbers, followed by a dot followed by "net", or "com", or "edu"

**<u>Groups</u>**

Optionally selectin a group of text.</br>
\d{3}-(\d{3})-(\d{4}) : picks a string that starts with 3 numbers, followed by a dash and optionally followed by a group of 3 numbers

Most regex flavors support up to 99 capturing groups (aka captures).

**<u>Back References</u>**

Useful for "replacement" patterns (or `$#`)</br>
In a match to refer to a group you have already specified <u>again</u>, use \# (\1 or \2 eg.) where # is the number of the group in the regexp. This is called back referencing.

eg `([a-c])x\1x\1` matches axaxa, bxbxb or cxcxc

**<u>Lookahead & Lookbehind assertions</u>**

Negative Lookahead:</br>

* q(?!u) : matches a `q` that is not followed by a `u`. Only `q` is part of the match

Positive Lookahead:</br>

* q(?=u) : matches a `q` that is followed by a `u`. Only `q` is part of the match

eg Monday\s(?=Wednesday)

Negative Lookbehind:</br>

* (?<!a)b : matches a `b` that is not preceded by an `a`

Positive Lookbehind:</br>

* (?<=a)b : matches a `b` that is preceded by an `a`


**<u>grep</u>**

* grep -E[otherFlags] [pattern] [file] : displays lines matching a pattern
* -n : display line numbers
* -i : ignore case sensitivity
* egrep [flags] [pattern] [file] : extended grep (same as grep -E)

egrep (one)|(two) : matches `one` OR `two` (it's similar to `?` for multiple characters)


**<u>Bash (linux shell)</u>**

```bash
pattern="^[0-9]{8}$";
if [[ $date =~ $pattern ]]; then
	echo "date is valid"

# =~ is the regexp-match operator
```


**<u>Python Regexps</u>**

```python
robj = re.compile(r'\d{3}-d{3}-d{4}')	# create regex object based on "compiled" query
matches = robj.search('Numbers:213-456-5678,432-901-9111') # match regex with string provided
matches.group(k) # pick match(es) desired -if \in group(0) more than 1.
# by default .search() returns 1st match only
```

Python regexps are greedy by default, ie. in ambiguous situations they match the longest find.</br>
To make a regexp non-greedy append `?` eg `r'...?'`


```python
robj.findall(str) # instead of .search(str) to return all matches
robj.compile( regexp, re.I) # case insensitive mathcing
robj.sub(strPattern, string) # replace regex with strPattern(1st match only) in string
robj.sub(lambda x:repls[x.group()], string) # replace multiple matches in string - repls = {pat1:repl1, pat2:repl2}
```


**<u>Java regexps</u>**

Java regexps try to match the entire string.

```java
java.util.regex.*;
String str = "whatever...";
Pattern pat = Pattern.compile("\\b[A-Za-z]\\b");
Matches matches = pat.matcher(str);

while(matches.find())
{
	if (matches.group.length() != 0)
	{
		System.out.println(matches.group());
	}
	System.out.println("Start index=" + matches.start() + " End index = " + matches.end() );
}


// replace all spaces with ", " in str:
Pattern pat2 = Pattern.compile("\\s");
Matches matches2 = pat2.matcher(str);
System.out.println(matches2.replaceAll(", ")"))
```


**<u>Javascript regexps</u>**

```javascript
regexp.test(exression)
// eg. document.write(/cats/i.test("Cats are funny.")) -> outputs true
expression.replace(regexp, replaceStr)
// eg document.write("Cats are friendly".replace(/cats/gi,"dogs")) -> outputs dogs are friendly
```


**<u>PHP regexps</u>**

```php
$regexp = "/[a-z]/";
$field = "Undercover Brother";
preg_match($regexp, $field)
ereg[i]($pattern, $replacement, $str)	// replace
```


**<u>C++ regexps</u>**

```c++
#include <regex>
string s;
cin >> str;
regex e("abc(a){2}", regex_constants::icase);	// [[:w:]] word + number matching
bool match = regex_match( str, e );	// [[:d:]] number match
bool match2 = regex_search( str, e );	// \. literal , matches as 2nd argument (it's an overload)
std::match_results<std::string> matches	... // [^cd] not c and not d
```


# Contribute

Please submit any bugs you find through GitHub repository 'Issues' page with details describing how to replicate the problem. If you liked it or you learned something new give it a star, clone it, laugh at it, contribute to it whatever. I appreciate all of it. Enjoy.


# License

Distributed under the GNU GPL V3 License. See "GNU GPL license.txt" for more information.


# Contact

email: *nik.lazkey@gmail.com*</br>
website: *www.keyc0de.net*

lab
===

To learn and compare all the web-related fundamentals for each language:

1. The language syntax
2. Manipulation of strings, ISO dates, arrays and dictionaries
3. Reading of HTTP parameters
4. Unit testing
5. Basic profiling
6. Access to PostgreSQL database

Table of contents:

| Experiment                      | JS        | Perl      | PHP       | Python    |
| ---------------------------     |:---------:| ---------:| ---------:| ---------:|
| Assignment val/ref              | Tested    | Tested    | Tested    | Tested    |
| Substring count                 | Tested    | YES       | YES       | YES       |
| Dates                           | YES       | YES       | YES       | YES       |
| Array key exists                | Tested    | Tested    | Tested    | Tested    |
| Array merge                     | Tested    | Tested    | Tested    | Tested    |
| Array keys                      | Tested    | Tested    | Tested    | Tested    |
| Explode                         | Tested    | Tested    | Tested    | Tested    |
| Assign array to variables       | Tested    | Tested    |           |           |
| Map access                      | Tested    | Tested    | Tested    | Tested    |
| HTML forms                      | YES(1)    | YES       | YES       | YES       |
| OO: same class dif. object      | n/a       | n/a       | YES       | n/a       |
| OO: same superclass dif. object | n/a       | n/a       | YES       | n/a       |
| Strictly triangular matrix      | Tested    | Tested    | Tested    | Tested    |
| Profiling: no DB                | YES       | YES       | YES       | YES       |
| Profiling: DB                   | YES       | YES       | YES       | YES       |
| Async: no DB                    |           |           |           |           |
| Async: DB                       |           |           |           |           |

Legend
------

* YES: Implemented, without unit tests.
* Tested: Implemented, with unit tests.
  * For JS: QUnit
  * For Perl: Test::More
  * For PHP: PHPUnit
  * For Python: unittest
* (1): Both client, and server versions. Server is Node.js & Express.
* Profiling
  * For JS: Node.js + perf + FlameGraph
  * For Perl: NYTProf
  * For PHP: Xhprof
  * For Python: cProfile + Gprof2Dot

lab
===
Table of contents:

| Experiment                      | JS        | Perl      | PHP       | Python    |
| ---------------------------     |:---------:| ---------:| ---------:| ---------:|
| Assignment val/ref              | Tested    | Tested    | Tested    | Tested    |
| Array key exists                | Tested    | Tested    | Tested    | Tested    |
| Array merge                     | Tested    | Tested    | Tested    | Tested    |
| Array keys                      | Tested    | Tested    | Tested    | Tested    |
| Explode                         | Tested    | Tested    | Tested    | Tested    |
| Map access                      | Tested    | Tested    | Tested    | Tested    |
| HTML forms                      | YES(1)    | YES       | YES       | YES       |
| OO: same class dif. object      | n/a       | n/a       | YES       | n/a       |
| OO: same superclass dif. object | n/a       | n/a       | YES       | n/a       |
| Strictly triangular matrix      | Tested    | Tested    | Tested    | Tested    |
| Profiling: no DB                |           | YES       | YES       |           |
| Profiling: DB                   |           | YES       | YES       |           |

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
  * For Perl: NYTProf
  * For PHP: Xhprof


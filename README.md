# Prime Table Printer

## Funding Circle Coding Challenge 

### Objective 

Write a program that prints out a multiplication table of the first 10 prime numbers. 
   
   - The program must run from the command line and print one table to STDOUT. 
   
   - The first row and column of the table should have the 10 primes, with each cell containing the product of the primes for the corresponding row and column. 

### Running

Make sure you have execute permissions for `print_table_of_primes`:

```Bash
chmod 0755 print_table_of_primes
```

install dependencies by running:

```Bash
bundle install
```

and finally run:

```Bash
./print_table_of_primes [OPTIONS]
```

If you want to run this script from anywhere you have to add it to your `$PATH`:

```Bash
mkdir -p /usr/local/bin/
ln -s $PWD/print_table_of_primes /usr/local/bin/
```

### Options

    -r, --rows=NUM_OF_ROWS           How many rows should prime table contain
    -c, --columns=NUM_OF_COLUMNS     How many columns should prime table contain
    -h, --help                       Prints this help

### Examples


```Bash
print_table_of_primes -r 6 -c 4
```
Output:
```
+----+----+----+----+----+
|    | 2  | 3  | 5  | 7  |
+----+----+----+----+----+
| 2  | 4  | 6  | 10 | 14 |
| 3  | 6  | 9  | 15 | 21 |
| 5  | 10 | 15 | 25 | 35 |
| 7  | 14 | 21 | 35 | 49 |
| 11 | 22 | 33 | 55 | 77 |
| 13 | 26 | 39 | 65 | 91 |
+----+----+----+----+----+
```

Default value for `-rows` and `-columns` is 10.

### Optimization notes

Library uses simple _trial division test_ to determine prime numbers: 
To find out whether a given number *n* is a prime number it has to try to divide it by number *m* which goes from 2 to _sqrt(n)_. 

To find first *N*
prime numbers this process has to be done for every number from 2 to *N*, skipping every even number since even numbers can't be by definition primes. 

Since table has rows and columns both consisting of prime numbers we would have to calculate prime numbers twice. That's why prime numbers are cached in memory.

### Testing

Prime table printer is tested under RSpec:

```Bash
bundle exec rspec
```

Coverage report is generated into `coverage` folder.
# bank

Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

# Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00


# Plan

1000, 10-01-2012 => 10/01/2012 || 1000.00 || || 1000.00
2000, 13-01-2012 => 13/01/2012 || 2000.00 || || 3000.00
500, 14-01-2012 => 14/01/2012 || || 500.00 || 2500.00

DEPOSIT DISPLAY
1000 => 1000.00 *
2000 => 2000.00 *
-2000 => ERROR: invalid amount (edge) *
"2000" => ERROR: incorrect format (edge)

DATE DISPLAY
10-01-2012 => 10/01/2012
13-01-2012 => 13/01/2012
13/01/2012 => ERROR: wrong format (edge)
31/02/2012 => ERROR: date does not exist (edge)

##Eventually, could have a display method that can be used for both i.e. polymorphism

BALANCE
deposit(1000) => 1000

deposit(1000), deposit(2000) => 3000

deposit(1000), deposit(2000), withdraw(500) => 2500

PRINT_ENTRY
deposit(1000), add_date("10-01-2012") => 10/01/2012 || 1000.00 || || 1000.00

deposit(2000), add_date("10-01-2012") => 13/01/2012 || 2000.00 || || 3000.00

# Bank

## Introduction
A command-line app to create a bank account, make deposits and withdrawals, and print your statement. It is a solution to [this practice tech test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

## How to use
1. Clone this reposotiory
2. `bundle install` to install dependencies

From your command line:
1. Start IRB with command `irb`
2. Load app `require './bank`
3. Create an account `account = Account.new`
4. To make a deposit:
- First, add the date in the correct format e.g. `account.add_date("10-01-2020")`
- Then, add the amount to deposit e.g. £1000 would be `account.deposit(1000)`
5. To make a withdrawal:
- First, add the date in the correct format e.g. `account.add_date("13-05-2020")`
- Then, add the amount to deposit e.g. £1000 would be `account.deposit(500)`
6. To print your statement, run `account.statement.printer`

## Run tests
1. Run `rspec` from command line to check tests. The app has 100% test coverage.
2. Run `rubocop` from command line to check linter.

## Development

### Acceptance criteria
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

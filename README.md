### setup

git clone this repository


Run IRB


Use the following commands to carry out account functions

Account.deposit(Amount)
Accpount.withdraw(Amount)
Account.display(Amount)


### Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- eposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

### User Stories

A client can deposit a sum of money and the amount be credited to their account and balance updated

A client can withdraw a sum of money from their account and the amount be debited and balance updated

When depositing money the date of the transaction should be logged

A client should be able to print their bank statement, seeing the date of each transaction,
crdit/debit amount of the transaction and balance after transaction. Formateting of columns should be as
per the below

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

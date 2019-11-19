## Overview
A small pogramme to manage deposits, withdrawls into a bank account and associated statement of account.

Each line of the statement is transaction on the account, itemising the date
of transaction, debit/credit amount and the account balance after the transaction.

Although not specified explicitly the account is created with a starting balance
of 0. This is set as a constant and can be amended as required. Addionally, it
was assumed that their is no overdraft on the default account. As such a withdrawl
that would result in the account balance being less tehan 0 is blocked. However,
this can also be amended by changing the OVERDRAFT_LIMIT constant

Depending on client specification, the code could be improved by storing the
information of each transaction (date, amount, balance) as individual items,
rather than a single long string. However, as it stands the specification does not require the individual elements of each transaction to be accesed.

### Setup

Git clone this repository
```https://github.com/smasonmalik/Bank_tech_test.git```

Run ```Bundle install``` from cmd line

Run ```rspec``` from cmd line to run unit tests and check test coverage

### Run programme
The programme can be run in IRB<br>
To start require account file in IRB<br>
```2.6.3 :001 > require './lib/account'```<br>
Create a new account passing account users' name as argument<br>
```2.6.3 :002 > account = Account.new('JBloggs')```<br>
Deposit money into the account<br>
```2.6.3 :003 > account.deposit(100)```<br>
Withdraw money from the account<br>
```2.6.3 :004 > account.withdraw(50)```<br>
Print account statement
```2.6.3 :005 > account.print_statement
date || credit || debit || balance
19/11/2019 || || 50.00 || 50.00
19/11/2019 || 100.00 || || 100.00
```

### Client Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
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

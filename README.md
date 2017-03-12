# Bank Tech Test

[![Build Status](https://travis-ci.org/treborb/bank_tech_test.svg?branch=master)](https://travis-ci.org/treborb/bank_tech_test)
[![codecov](https://codecov.io/gh/treborb/bank_tech_test/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/bank_tech_test)

### [Makers Academy] (http://www.makersacademy.com) - Week 10 Solo Practice Tech Test

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Rspec](http://rspec.info/)

## Jump To
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests)

## The brief

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

## <a name="install">Installation</a>

```
$ git clone https://github.com/treborb/bank_tech_test.git
$ cd bank_tech_test
$ rvm 2.3.3
$ gem install bundler
$ bundle
```

## <a name="usage">Usage</a>

#### Load up your favourite REPL (e.g. irb)

```
$ irb
```

#### In the REPL
```ruby
$ require './lib/account'
$ account = Account.new
$ account.deposit("10/01/2012",1000)
$ account.deposit("13/01/2012",2000)
$ account.withdraw("14/01/2012",500)
$ account.statement
```

## <a name="tests">Running the tests</a>

```ruby
$ rspec
```

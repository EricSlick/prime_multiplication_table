# PrimeMultiplicationTable

Objective

Write a program that prints out a multiplication table of the first 10 prime numbers.

The program must run from the command line and print one table to STDOUT.

The first row and column of the table should have the 10 primes, with each cell containing the product of the primes for the corresponding row and column.

Notes

• Consider complexity. How fast does your code run? How does it scale?
• Consider cases where we want N primes.
• Do not use the Prime class from stdlib (write your own code).
• Write tests. Try to demonstrate TDD/BDD.


Thought Process and Coding Process

Usually, a candidate talks through this process. I'm taking the time to write out the process I went through in the order I took them. I indicate approximate times for each step since it was not one continuous effort.

1. Familiarize and Analyze: analyze the problem, research parts that are unfamiliar to get a general idea of what it will take to solve
  I. Identify and deal with parts of the requirements that I'm unfamiliar with
    A. Unfamiliar with logarithms surrounding finding prime numbers so spent a good deal of time researching this till I felt comfortable I understood enough to make a reasonable decision
      a.http://en.wikipedia.org/wiki/Sieve_of_Atkin
        1. this looks promising
      b.http://mathforum.org/isaac/problems/prime2.html
      c.http://www.gamedev.net/topic/403264-solved-program-to-test-if-a-number-is-prime/
        1. Under Wiggin's comment, this one looks fast for larger values of N and is an implementation of the Sieve of Atkin? http://en.wikipedia.org/wiki/Sieve_of_Atkin
      d. I researched more sites, but decided it wasn't useful to list them all
      e. I spent some time doing thought experiments to see if I could reason out variants on the solutions I studied.
      f. Decided that Wiggin's example would be the right solution to start with. Not necessarily the best, but have reasonable expectations it will be fine. Can change later as needed.
  II Story Map User Interaction with Stakeholder
    A This is small enough that I don't really need to do this. But for demonstration purposes, I'm showing soething here I like to do whenever possible since it creates greater certainty between the product owner (non-coder) and the programmer on what is being built and what it will (roughly) look like to the end user
      a. User Requirements
       1. from command line, input a command with an optional parameter
       2. the return is a formatted table showing the prime numbers as a multiplications table. The default is 10 prime numbers
      b. a gem (easy to set up, a bit easier to implement tests and allows reuse and running from the command line)
        1. doing this one since it is easy to set up a gem and will likely save time than setting rspec up manually

  TIME: Spent about 45 minutes (high estimate, nearly all on researching prime number algorithms)

2. Break out the requirements into a Story Map (maybe a bit overkill, but helpful in understanding how the user interacts and understanding what's being built before starting to write tests

goal: a formatted multiplication table of N number of prime numbers (note: exactly how this will look is left to the programmer's imagination)
user: reviewer
Step 1: Install the program
          a. Get the code from github
          b. cd into the root folder
          c. bundle install (to make demoing it easier)
Step 2: Interface is the Command Line (ie, the Terminal or Console)
        User Input
          a. From Terminal/Console Type 'prime_mult <value>'  (value is optional -- default is 10)
        User Output
          a. a formatted multiplications table is printed to STDOUT (to the console/terminal) for the user to see and do what they want with it.
            1. though the look of the table is not directly specified, it's presumed that user comfort is expected. This should not result in a hard to read table. Formatting should be aligned and ways to help the eye find the right prime and the right multiple

3. Now that I understand the problem domain and have a reasonable understanding of how the user will interact with it and what output they expect to see, it's time to consider the technical design.  By this time, ideas an possibilities are swirling in my mind, so it's probably an easy thing to block out the technical design
  A. bin holds script that runs the program (note: expect this to be relatively easy, but will be doing research to ensure I'm going this the right way)
  B. A main class will hold the one runnable method by the user.
  C. Functionality will be given to a utility module or class that implements the following
    1. Identify all primes between 1 and N (default 10)
    2. Build the multiplication table
    3. Format the table for user output

4. Ready to start coding.  I don't need to have an exacting and detailed design worked out, just enough blocked out to understand the general architecture/structure

5. TDD (test first ... red/green/refactor/green)
  Version 1: MVP (minimum viable product: the first version that has only enough functionality to meet the minimal requirements of the test)
  1. input value N
  2. find list of primes up to N
  3. build a 2D array with the primes and their multiples
  4. build a format into a human readable version
  5. output back to the user
  Version 2: Consider solutions to formatting issues with output on N > a reasonable screen width
             Consider Speed: how solution scales from N = 10 to N as N increases. Is it reasonable and does it need to be faster. This is kind of an arbitrary thing, but we're really talking about N^2 vs N Vs NLog(multiple versions) and what's reasonable)
             Pick an upper number that's the program considers reasonable and only code for that so we have an upper limit until we get input back from the end user/product owners

  notes: 3 and 4 could technically be one step as the internal representation isn't important; ony the user output.

6. BDD (test the output is correct): I anticipate this may have its challenges since I want to not just test that the results are what I want, but that the formatting is human readable.
  notes: test that things are at the right index position in the output array?  if I have colors, this will not be trivial.
  1. the expected user command is there
  2. early thoughts on tests: output has each thing in the right position (primes in the right location, column and row dividers in right place. If colors are used, the right colors are embedded, etc.

7. Demonstrable Code
  1. Self testing, self feedback, updates

8. Thought about the future
  1. optimization possibilities
  2. user output alternatives
  3. programmatic usage of table  (ie, API and usefulness for other programs)

Coding
A. TDD (frame out some tests)
  1. create mult table exists in a class object
  2. outputs to stdout with a valid table (hard coded table)
  3. able to return a list of primes (10, pre-defined list)
  4. tests passing
  5. Time 1 hour
B. TDD (refactor table building)
  1. build table instead of hard coded
  2. tests passing
  3. time 1.5 hours
  4. notes: refactor led to additional changes, including abstracting out getting primes and when to build a new list.
C. TDD (running from the console)
  1. bin/script.rb test
  2. realized output wasn't as expected. Embedded carriage returns don't seem to be working
  3. Bug: '\n' does not interpolate but "\n" does
  4. Time 1 hour

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'prime_multiplication_table'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prime_multiplication_table

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/prime_multiplication_table/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

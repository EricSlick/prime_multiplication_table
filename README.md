# PrimeMultiplicationTable Coding Test

## How to Run The Tests and Run the prime multiplications table generator
1. get the code from github
<code>
  git clone git@github.com/EricSlick:prime_multiplication_table
</code>


## The Test and My Notes/Thoughts on the Process
This is the code I wrote for a coding test. I specify the test requirements and then write out the steps as if I was in the room with the reviewers talking through how I approached the problem. In this case, I wrote this code over the weekend as I had time. The time it took I added into the notes below. Times are approximate.

### Objective

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

2. Story Map (Understanding Requirements and Identifying Acceptance Criteria and Correct Behavior (partially fills BDD but outside code))

Break out the requirements into a Story Map (maybe a bit overkill, but helpful in understanding how the user is expected to interact with the feature and what he will get in return.  This goes a long way toward creating a common understanding between the coder and the product owner so there is less chance for misunderstanding

goal: a formatted multiplication table of N number of prime numbers (note: exactly how this will look is left to the programmer's imagination)
user: reviewer/s who gave me this test
Step 1: User Prepares to run the test
          a. Get the code from github
          b. cd into the root folder
          c. bundle install ()
          d. rake install
Step 2: Interface is the Command Line (ie, the Terminal or Console)
        User Input
          a. From Terminal/Console Type './bin/prime_mult_table <value>'  (value is optional -- default is 10)
        User Output
          a. a formatted multiplications table is printed to STDOUT (to the console/terminal)
            1. though the look of the table is not directly specified, it's presumed that user comfort is expected. This should not result in a hard to read table. Formatting should be aligned and use ways to help the eye find the right prime and the right multiple
        User Running Tests
          a. type rspec

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

Coding (fleshing out the Framework and Refactoring)
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
C. TDD/BDD (running from the console)
  1. bin/script.rb test
  2. realized output wasn't as expected. Embedded carriage returns don't seem to be working
  3. Bug: '\n' does not interpolate but "\n" does
  4. Time 1 hour
  5. rspec failing tests for stdout: use open3 to capture stdout
  6. all tests passing
  7. This directly tests the output that the user sees, so this is essentially a user view test and is suitable for confirming Behavior
D TDD (refactor prime number selector)
  1. change from hard coded list to use generated primes (N primes)
  3. spent a good amount of time exploring the theory and algorithms for finding primes and tried my hand at figuring out something new (why not ;)
  4. finally chose to implement an algorithm found here (under jyothu http://stackoverflow.com/questions/11673968/how-do-i-generate-the-first-n-prime-numbers) with one slight modification (stop checking divisors if it's over half way to the number being checked)
  5. test covers up to 1000 primes
  6. Time 3 hours (most of that was playing around with trying to figure out an approach on my own)

I chose to stop here because I had no more time.

Things I considered would be good ideas to pursue
A. Optimization Thoughts (speed)
  1. Definitely a better algorithm for generating primes
  2. As primes are generated, store the results instead of re-creating them (ie, build a table and only generate more primes as needed)
  3. Start with a "primed" prime table up to some reasonable limit and use that with the prime generator as backup
  4. The Prime.p_1000 table is a string array but would be better as an integer array (since it was really only for tests in the end, didn't change it out of convenience)
B. Output
  1. Tables grow larger than the width of the screen pretty quickly, so storing in a file would be useful
  2. Print out the results in sections, so that the table displays only as much as fits on the screen and the rest it displays on a new line
  3. highlighting or coloring rows to help the eye navigate the rows to find the desired product
C. Expanded Utility
  1. The api allows usefulness from other programs through the gem, but a more formal approach may be worth considering
  2. The gem was a convenience for this test, though it does make it a more flexible utility. Perhaps just a library would be appropriate, however.
  3. comma delimited output to a file for exporting to a spreadsheet.






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

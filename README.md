Oyster Card
==================

## Afternoon challenge Oyster Card
First introduction to pair programming, implementing the follwoing practices:

- Create a gemfile & initialize rspec
- Working with user stories
- Domain Modeling
- Feature and Unit testing
- Isolating test with doubles and mocks
- Debugging
- Class extraction

Goals:
- Use all of week 1's skills (don't underestimate the importance of this)
- Break one class into two classes that work together, while maintaining test coverage
- Unit test classes in isolation using mocking
- Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
- Review another person's code and give them meaningful feedback

## Setup

1. **Fork** this [boris-bike repository](https://github.com/CorinneBosch/Oyster-Card/) 
2. Then clone **your** fork to your computer.
3. Ensure you have `Ruby` and `rspec` installed. Check ruby version with `ruby-v`
4. Install bundler if you haven't already.
$ gem install bundler 
5. Install the gems required by this repository.
`$ bundle install`

## Interact with the program

You can frature test and run the boris-bike program in any `code editor` or `IRB`. 

## Run test 

To test all units and features at once in your terminal.
Print out the format documentation with the -fd shortcut.

$ rspec
$ rspec -fd

To test inividual unit test in your terminal:

$ rspec spec/oyster_card_spec.rb -fd
$ rspec spec/station_spec.rb -fd

## The oyster card challenge is built upon the following user stories:

```
In order to use public transport
As a customer
I want money on my card

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers.
As a customer
I need to touch in and out.

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

Source of challege requirements: [Makersacadeny - GitHub](https://github.com/makersacademy/course/tree/main/oystercard)

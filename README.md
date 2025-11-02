# String Calculator TDD Kata

A Test-Driven Development exercise implementing a string-based calculator. This project demonstrates TDD principles through iterative development of a string calculator that handles various input formats.

## Learning Objectives

Through this kata, I practiced:
- Writing tests before implementation (Red-Green-Refactor cycle)
- Iterative feature development
- Test case organization and structure
- Edge case handling
- Error scenarios and exceptions
- Code refactoring while maintaining test coverage

## The Problem

Create a calculator that takes a string input and returns a sum, following these rules:

1. Empty string returns 0
2. Single number returns that number
3. Two numbers separated by comma returns their sum
4. Handle unknown amount of numbers
5. Handle newlines as valid delimiters
6. Support custom delimiters: `//[delimiter]\n[numbers]`
7. Calling add with negatives throws an exception
8. Numbers bigger than 1000 are ignored
9. Support multiple delimiters: `//[delim1][delim2]\n`

## Development Process

The solution was built following TDD principles:

1. Write a failing test (Red)
2. Write minimal code to make it pass (Green)
3. Refactor while keeping tests green
4. Repeat for next feature

## Running the Tests

This project uses RSpec for testing. To run the tests:

```bash
bundle install
bundle exec rspec
```

For more detailed output:
```bash
bundle exec rspec --format=documentation
```

## Implementation Highlights

- Clean separation of concerns (parsing vs calculation)
- Input validation and error handling
- Regular expression pattern matching
- String manipulation
- Exception handling
- Method call tracking
- Modular code design

## Code Structure

- `lib/string_calculator.rb` - Main calculator implementation
- `lib/string_input_parser.rb` - Input parsing logic
- `spec/string_calculator_spec.rb` - Test suite
- `spec/spec_helper.rb` - RSpec configuration

### Design Principles

This project follows SOLID principles:

1. **Single Responsibility Principle (SRP)**
   - Separated input parsing (`StringInputParser`) from calculation logic (`StringCalculator`)
   - Each class has a clear, focused purpose

2. **Code Organization**
   - Input parsing is handled by `StringInputParser`
   - Core calculation logic remains in `StringCalculator`
   - Clear separation of concerns for better maintainability

## Key Learnings

- Start with the simplest test case
- Make small, incremental changes
- Let the tests drive the design
- Refactor only when tests are green
- Keep track of edge cases
- Write readable, maintainable tests
- Apply SOLID principles for better code organization
- Separate concerns for improved maintainability
- Use modular design for better code structure

## Getting Started

1. Clone the repository
2. Run `bundle install`
3. Run the tests with `bundle exec rspec`
4. Try adding new test cases in `spec/string_calculator_spec.rb`
5. Watch them fail (Red)
6. Implement the feature in `lib/string_calculator.rb`
7. Watch them pass (Green)
8. Refactor if needed

## Next Steps

Going to try these extensions to practice TDD further:
- Add support for multiplication
- Handle floating point numbers
- Add support for parentheses
- Implement order of operations

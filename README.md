# Simple-Calculator

## Overview
This project implements a simple calculator interpreter in five different programming languages: Rust, Ada, Perl, Scheme, and Prolog. The interpreter supports variables, assignments, and basic arithmetic expressions and Error Handling.

## Features
- Arithmetic operations: Addition (`+`), Subtraction (`-`), Multiplication (`*`), and Division (`/`).
- Variable assignments (e.g., `x = 5`).
- Expression evaluation using assigned variables.
- Operator precedence and parentheses are considered in all implementations except Perl.
- Error handling for invalid inputs.

## Implementation Details
Each language follows a similar approach to parsing and evaluating expressions:
Tokenization: The input is tokenized into numbers, operators, and variables.
Parsing: Expressions are parsed into an internal representation (e.g., an abstract syntax tree or direct evaluation method).
Evaluation: The parsed expressions are evaluated based on operator precedence and variable values (except in Perl, which follows a simpler evaluation method).
Error Handling: Detects invalid syntax, division by zero, and undefined variables.

## Installation & Usage
Below are the instructions for setting up and running the calculator in each language.

### Rust
#### Prerequisites:
- Install Rust and Cargo: [Rust Installation](https://www.rust-lang.org/tools/install)

#### Run the Interpreter:
```sh
rustc calculator.rs
./calculator
```

### Ada
#### Prerequisites:
- Install GNAT (Ada Compiler): [AdaCore GNAT](https://www.adacore.com/download)

#### Compile and Run:
```sh
gnatmake calculator.adb
./calculator
```

### Perl
#### Prerequisites:
- Install Perl: [Perl Installation](https://www.perl.org/get.html)

#### Run the Interpreter:
```sh
perl calculator.pl
```

### Scheme
#### Prerequisites:
- Install a Scheme interpreter (e.g., MIT/GNU Scheme, Racket)

#### Run the Interpreter:
```sh
racket calculator.scm (i used Racket)
```

### Prolog
#### Prerequisites:
- Install SWI-Prolog: [SWI-Prolog Download](https://www.swi-prolog.org/download/stable)

#### Run the Interpreter:
```sh
swipl
[calculator.pl].
```

## Project Structure
```
calculator_interpreter/
├── rust/         # Rust implementation
│   ├── src/
│   ├── Cargo.toml
│   ├── README.md
├── ada/          # Ada implementation
│   ├── calculator.adb
│   ├── README.md
├── perl/         # Perl implementation
│   ├── calculator.pl
│   ├── README.md
├── scheme/       # Scheme implementation
│   ├── calculator.scm
│   ├── README.md
├── prolog/       # Prolog implementation
│   ├── calculator.pl
│   ├── README.md
├── README.md     # Main project README
```

## Error Handling
The interpreter includes error handling for:
- Syntax errors (e.g., missing operators, incorrect expressions)
- Undefined variable usage
- Division by zero

## Why rust
With the help of rust programming language we can write code that can deals with low-level details of memory management, data representation, and concurrency.
-  Rust is a statically typed language, which means that it must know the types of all variables at compile time

- Cargo - the included dependency manager and build tool, makes adding, compiling, and managing dependencies painless and consistent across the Rust ecosystem. 

### Mutable vs Immutable

```sh
let apples = 5; // immutable
let mut bananas = 5; // mutable
```
- In Rust, variables are immutable by default, meaning once we give the variable a value, the value won't change.
- To make a variable mutable, we add mut before the variable name
- The & indicates that this argument is a reference, which gives you a way to let multiple parts of your code access one piece of data without needing to copy that data into memory multiple times, For now, like variables, references are immutable by default.
```
  io::stdin()
        .read_line(&mut guess)
```
you need to write &mut guess rather than &guess to make it mutable.
- Constants - Like immutable variables, constants are values that are bound to a name and are not allowed to change, but there are a few differences between constants and variables.
`First, you aren’t allowed to use mut with constants. Constants aren’t just immutable by default—they’re always immutable. `

### Shadowing
```
fn main() {
    let x = 5;

    let x = x + 1;

    {
        let x = x * 2;
        println!("The value of x in the inner scope is: {x}");
    }

    println!("The value of x is: {x}");
}
```
- The value of x in the inner scope is: 12
The value of x is: 6
- Shadowing is different from marking a variable as mut, because we’ll get a compile-time error if we accidentally try to reassign to this variable without using the let keyword.
- The other difference between mut and shadowing is that because we’re effectively creating a new variable when we use the let keyword again, we can change the type of the value but reuse the same name


### Handling Result Type
- Result is an enumeration, often called an enum, which is a type that can be in one of multiple possible states. We call each possible state a variant.
- Result has an 'expect' method that you can call. If this instance of Result is an Err value, expect will cause the program to crash and display the message that you passed as an argument to expect.


### Crate
Remember that a crate is a collection of Rust source code files. The project we’ve been building is a binary crate, which is an executable. The rand crate is a library crate, which contains code intended to be used in other programs and can't be executed on its own.

- In the Cargo.toml file, everything that follows a header is part of that section that continues until another section starts. In [dependencies] you tell Cargo which external crates your project depends on and which versions of those crates you require

Cargo.lock file
- When you build a project for the first time, Cargo figures out all the versions of the dependencies that fit the criteria and then writes them to the Cargo.lock file. When you build your project in the future, Cargo will see that the Cargo.lock file exists and use the versions specified there rather than doing all the work of figuring out versions again. This lets you have a reproducible build automatically.
- When you do want to update a crate, Cargo provides the command update, which will ignore the Cargo.lock file and figure out all the latest versions that fit your specifications in Cargo.toml.

### Data Types - scalar and compound.
- Rust has four primary scalar types: integers, floating-point numbers, Booleans, and characters. 
- Compound types can group multiple values into one type. Rust has two primitive compound types: tuples and arrays.
1) A tuple is a general way of grouping together a number of values with a variety of types into one compound type. Tuples have a fixed length: once declared, they cannot grow or shrink in size.
2) The Array Type - Unlike a tuple, every element of an array must have the same type. Unlike arrays in some other languages, arrays in Rust have a fixed length.
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


### Ownership - stack and heap
The heap is less organized: when you put data on the heap, you request a certain amount of space. The memory allocator finds an empty spot in the heap that is big enough, marks it as being in use, and returns a pointer, which is the address of that location. Because the pointer to the heap is a known, fixed size, you can store the pointer on the stack, but when you want the actual data, you must follow the pointer.

#### Ownership rules
 - Each value in Rust has an owner.
 - There can only be one owner at a time.
 - When the owner goes out of scope, the value will be dropped.

 Strings - With the String type, in order to support a mutable, growable piece of text, we need to allocate an amount of memory on the heap, unknown at compile time, to hold the contents.

 When a variable goes out of scope, Rust calls a special function for us. This function is called drop, and it’s where the author of String can put the code to return the memory. Rust calls drop automatically at the closing curly bracket.

 ``` let x = 5;
    let y = x;
```

<img src="./resources/string.svg" width="250" height="250" />

```
 let s1 = String::from("hello");
    let s2 = s1;

    println!("{}, world!", s1);
```
To ensure memory safety, after the line let s2 = s1, Rust considers s1 as no longer valid. Therefore, Rust doesn’t need to free anything when s1 goes out of scope.
That solves our problem! With only s2 valid, when it goes out of scope, it alone will free the memory, and we’re done.


but the code we show above for integer seems to contradict what we just learned: we don’t have a call to clone, but x is still valid and wasn’t moved into y.

The reason is that types such as integers that have a known size at compile time are stored entirely on the stack, so copies of the actual values are quick to make. That means there’s no reason we would want to prevent x from being valid after we create the variable y.


### References and Borrowing
we can provide a reference to the String value. A reference is like a pointer in that it’s an address we can follow to access the data stored at that address; that data is owned by some other variable. Unlike a pointer, a reference is guaranteed to point to a valid value of a particular type for the life of that reference.
```
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}

```

Below code will print 'hello world'

```
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
    println!("{}", s)
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

The Rules of References:

    - At any given time, you can have either one mutable reference or any number of immutable references.
    - References must always be valid.


### Structs 
Rust also supports structs that look similar to tuples, called tuple structs. 

Tuple structs have the added meaning the struct name provides but don’t have names associated with their fields; rather, they just have the types of the fields

```
struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

fn main() {
    let black = Color(0, 0, 0);
    let origin = Point(0, 0, 0);
}
```

### Enum
This can be combined
```
    enum IpAddrKind {
        V4,
        V6,
    }

    struct IpAddr {
        kind: IpAddrKind,
        address: String,
    }
```


#### Packages

- Packages: A Cargo feature that lets you build, test, and share crates
- Crates: A tree of modules that produces a library or executable
- Modules and use: Let you control the organization, scope, and privacy of paths
- Paths: A way of naming an item, such as a struct, function, or module

#### Collections
Most other data types represent one specific value, but collections can contain multiple values. Unlike the built-in array and tuple types, the data these collections point to is stored on the heap, which means the amount of data does not need to be known at compile time and can grow or shrink as the program runs

- A vector allows you to store a variable number of values next to each other.
- A string is a collection of characters.
- A hash map allows you to associate a value with a particular key.


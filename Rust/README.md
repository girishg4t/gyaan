## Why rust
With the help of rust programming language we can write code that can deals with low-level details of memory management, data representation, and concurrency.
-  Rust is a statically typed language, which means that it must know the types of all variables at compile time

- Cargo - the included dependency manager and build tool, makes adding, compiling, and managing dependencies painless and consistent across the Rust ecosystem. 

Three ways of borrowing
- borrowing immutably
- borrowing mutably
- taking ownership

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

#### Error Handling
Rust groups errors into two major categories: recoverable and unrecoverable errors.
Rust doesn’t have exceptions. Instead, it has the type Result<T, E> for recoverable errors and the panic! macro that stops execution when the program encounters an unrecoverable error.

```
use std::fs::File;
use std::io;
use std::io::Read;

fn read_username_from_file() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    Ok(s)
}
```
If the value of the Result is an Ok, the value inside the Ok will get returned from this expression, and the program will continue. If the value is an Err, the Err will be returned from the whole function as if we had used the return keyword so the error value gets propagated to the calling code.


#### Generics
Specifying Multiple Trait Bounds with the + Syntax
we wanted notify to use display formatting as well as summarize on item: we specify in the notify definition that item must implement both Display and Summary. We can do so using the + syntax:
```
pub fn notify(item: &(impl Summary + Display)) {
```
The + syntax is also valid with trait bounds on generic types:
```
pub fn notify<T: Summary + Display>(item: &T) {
```

Each generic has its own trait bounds, so functions with multiple generic type parameters can contain lots of trait bound information between the function’s name and its parameter list, making the function signature hard to read.

Rust has alternate syntax for specifying trait bounds inside a where clause 
```
fn some_function<T, U>(t: &T, u: &U) -> i32
    where T: Display + Clone,
          U: Clone + Debug
{
```

LIfetime
```
fn main() {
    let string1 = String::from("abcd");
    let string2 = "xyz";

    let result = longest(string1.as_str(), string2);
    println!("The longest string is {}", result);
}
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

```
The function signature now tells Rust that for some lifetime 'a, the function takes two parameters, both of which are string slices that live at least as long as lifetime 'a. The function signature also tells Rust that the string slice returned from the function will live at least as long as lifetime 'a. 


The Static Lifetime

One special lifetime we need to discuss is 'static, which denotes that the affected reference can live for the entire duration of the program. All string literals have the 'static lifetime, which we can annotate as follows:

```
let s: &'static str = "I have a static lifetime.";

```

#### Closures
 This illustrates how closure syntax is similar to function syntax except for the use of pipes and the amount of syntax that is optional:

 ```
fn  add_one_v1   (x: u32) -> u32 { x + 1 }
let add_one_v2 = |x: u32| -> u32 { x + 1 };
let add_one_v3 = |x|             { x + 1 };
let add_one_v4 = |x|               x + 1  ;
```

```
    let example_closure = |x| x;

    let s = example_closure(String::from("hello"));
    let n = example_closure(5);
```
The first time we call example_closure with the String value, the compiler infers the type of x and the return type of the closure to be String. Those types are then locked into the closure in example_closure, and we get a type error if we try to use a different type with the same closure.


#### Iterators
In Rust, iterators are lazy, meaning they have no effect until you call methods that consume the iterator to use it up. 

#### Smart Pointers

Smart pointers, on the other hand, are data structures that act like a pointer but also have additional metadata and capabilities. 
'String' and 'Vec<T>'  Both these types count as smart pointers because they own some memory and allow you to manipulate it.

most common smart pointers in the standard library:

- Box<T> for allocating values on the heap
- Rc<T>, a reference counting type that enables multiple ownership
- Ref<T> and RefMut<T>, accessed through RefCell<T>, a type that enforces the borrowing rules at runtime instead of compile time

Box<T> - 

   - When you have a type whose size can’t be known at compile time and you want to use a value of that type in a context that requires an exact size
   - When you have a large amount of data and you want to transfer ownership but ensure the data won’t be copied when you do so
   - When you want to own a value and you care only that it’s a type that implements a particular trait rather than being of a specific type
The Box<T> type is a smart pointer because it implements the Deref trait, which allows Box<T> values to be treated like references. When a Box<T> value goes out of scope, the heap data that the box is pointing to is cleaned up as well because of the Drop trait implementation.

Rc<T>, the Reference Counted Smart Pointer - 
In the majority of cases, ownership is clear: you know exactly which variable owns a given value. However, there are cases when a single value might have multiple owners. For example, in graph data structures, multiple edges might point to the same node, and that node is conceptually owned by all of the edges that point to it. 

You have to enable multiple ownership explicitly by using the Rust type Rc<T>, which is an abbreviation for reference counting. 
The Rc<T> type keeps track of the number of references to a value to determine whether or not the value is still in use. If there are zero references to a value, the value can be cleaned up without any references becoming invalid.

We use the Rc<T> type when we want to allocate some data on the heap for multiple parts of our program to read and we can’t determine at compile time which part will finish using the data last. 

example :
```
enum List {
    Cons(i32, Rc<List>),
    Nil,
}

use crate::List::{Cons, Nil};
use std::rc::Rc;

fn main() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    let b = Cons(3, Rc::clone(&a));
    let c = Cons(4, Rc::clone(&a));
}

```

RefCell<T> - Enforcing Borrowing Rules at Runtime
Unlike Rc<T>, the RefCell<T> type represents single ownership over the data it holds. So, what makes RefCell<T> different from a type like Box<T>?

With references and Box<T>, the borrowing rules’ invariants are enforced at compile time. With RefCell<T>, these invariants are enforced at runtime. With references, if you break these rules, you’ll get a compiler error. With RefCell<T>, if you break these rules, your program will panic and exit.


Similar to Rc<T>, RefCell<T> is only for use in single-threaded scenarios and will give you a compile-time error if you try using it in a multithreaded context. 



   - Rc<T> enables multiple owners of the same data; Box<T> and RefCell<T> have single owners.
    - Box<T> allows immutable or mutable borrows checked at compile time; Rc<T> allows only immutable borrows checked at compile time; RefCell<T> allows immutable or mutable borrows checked at runtime.
    - Because RefCell<T> allows mutable borrows checked at runtime, you can mutate the value inside the RefCell<T> even when the RefCell<T> is immutable.


#### Concurrency
- Creating a New Thread with spawn
To create a new thread, we call the thread::spawn function and pass it a closure containing the code we want to run in the new thread.
```
use std::thread;
use std::time::Duration;

fn main() {
     let handle = thread::spawn(|| {
        for i in 1..10 {
            println!("hi number {} from the spawned thread!", i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..5 {
        println!("hi number {} from the main thread!", i);
        thread::sleep(Duration::from_millis(1));
    }
}
```
- Waiting for All Threads to Finish Using join Handles
A JoinHandle is an owned value that, when we call the join method on it, will wait for its thread to finish.

```
    handle.join().unwrap();
```
- Using move Closures with Threads
We'll often use the move keyword with closures passed to thread::spawn because the closure will then take ownership of the values it uses from the environment, thus transferring ownership of those values from one thread to another. 

```
use std::thread;

fn main() {
    let v = vec![1, 2, 3];

    let handle = thread::spawn(move || {
        println!("Here's a vector: {:?}", v);
    });

    handle.join().unwrap();
}
```

- Channel - Using Message Passing to Transfer Data Between Threads
```
use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let val = String::from("hi");
        tx.send(val).unwrap();
    });

    let received = rx.recv().unwrap();
    println!("Got: {}", received);
}
```

- Atomic Reference Counting with Arc<T> 

Fortunately, Arc<T> is a type like Rc<T> that is safe to use in concurrent situations. The a stands for atomic, meaning it’s an atomically reference counted type. 

```
use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();

            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}
```

Send - 
The Send marker trait indicates that ownership of values of the type implementing Send can be transferred between threads. Almost every Rust type is Send, but there are some exceptions, including Rc<T>: this cannot be Send because if you cloned an Rc<T> value and tried to transfer ownership of the clone to another thread, both threads might update the reference count at the same time

Sync - 
The Sync marker trait indicates that it is safe for the type implementing Sync to be referenced from multiple threads.


    
Basic Questions

    What is Rust and what are its primary features?
    How does Rust ensure memory safety without a garbage collector?
    What is ownership in Rust and why is it important?
    Explain the difference between String and &str in Rust.
    What are Option and Result types in Rust? How do they differ?
    How do you handle errors in Rust?
    What is the purpose of the Cargo tool in Rust?
    What are lifetimes in Rust and why are they necessary?
    How do you define and use a struct in Rust?
    What are traits and how are they used in Rust?

Intermediate Questions

    Explain the concept of borrowing and mutable borrowing in Rust.
    How do you implement concurrency in Rust?
    What is a trait object and when would you use one?
    Describe the use of unsafe in Rust. When is it appropriate to use it?
    What are some common patterns for error handling in Rust?
    How do you perform pattern matching in Rust?
    Explain the difference between Rc and Arc.
    What is the Drop trait and when would you implement it?
    How do you implement a custom iterator in Rust?
    What is the purpose of the std::sync::mpsc module?

Advanced Questions

    Explain how Rust's type system helps in writing safe concurrent programs.
    How does Rust's borrowing mechanism prevent data races?
    Describe how you can use async/await for asynchronous programming in Rust.
    What are some of the limitations of Rust's borrow checker and how can you work around them?
    Discuss the concept of zero-cost abstractions in Rust.
    How would you implement a thread-safe shared state in Rust?
    Explain what macros are in Rust and how they differ from functions.
    What is the purpose of the Pin type in Rust?
    How do you manage dependencies in a Rust project?
    What are some common strategies for optimizing Rust code for performance?

Practical Tasks

    Write a function that takes a list of integers and returns the sum of all elements.
    Implement a simple CLI tool using the clap crate that takes user input and prints it.
    Create a simple web server using the rocket or actix-web crate that serves a static HTML page.
    Write a program that reads a file and counts the number of lines, words, and characters.
    Implement a custom trait and demonstrate its use with a struct.
    Create a multi-threaded program that calculates the factorial of a number using threads.
    Write a function that uses pattern matching to handle different Result and Option values.
    Implement a simple key-value store using a HashMap.
    Write a Rust program that sends messages between threads using channels.
    Create a simple static site generator that reads Markdown files and outputs HTML files.

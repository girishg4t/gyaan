
# Interview prepration reference
## GoLang references

### Links
1. https://tour.golang.org/
2. https://golang.org/ref/spec
3. https://golang.org/doc/effective_go.html
4. https://golang.org/doc/code.html

### Blogs

#### Syntax
* https://blog.golang.org/declaration-syntax

#### Defer
* https://blog.golang.org/defer-panic-and-recover

#### Slices
* https://blog.golang.org/slices-intro

#### Go Playground Overview
* https://blog.golang.org/playground

#### Unit Testing
* https://blog.alexellis.io/golang-writing-unit-tests

#### Mock HTTP requests
* https://www.thegreatcodeadventure.com/mocking-http-requests-in-golang

### Packages

#### Logging
* https://github.com/uber-go/zap
* http://github.com/sirupsen/logrus

#### Testing
* https://golang.org/pkg/testing
* https://github.com/stretchr/testify

#### UUID Generator
* http://github.com/google/uuid

#### Manage Goroutines Lifecycle
* https://github.com/oklog/run

### Go coding style
* https://github.com/uber-go/guide/blob/master/style.md
#### Go Advicer
* https://github.com/cristaloleg/go-advice

Go is compiled and statically typed programming language   
Built in concurrency with go routines  
Built in garbage collection and memory safety  

## Advantage of go
Simple syntax  
Easy to write concurrent programs  
Compiled language(The source code is compiled to a native binary)  
Fast compilation  
Static linking (statically typed language)  
Garbage collection  
No Classes, no inheritance, no assertions, no exceptions  
Open source  

## Disadvantage of golang
Error handling  
Package management   

A new, open source programming language
Concurrent, garbage-collected, build fast at scale

Fast  
Build quickly  
Run quickly   
Productive   

  
## Go CLI   
Go Run -> compile and executes one or two file  
Go build -> Compile the program  
Go fmt -> format the code  
Go install  -> compiles and install  a package  
Go get -> Downloads the raw source code of someone else’s package  
Go test -> runs any tests assoicated with the current project  

Package => a project workspace, so each source code can have many files and but they should have package name same to compile that into one package  

Executable package or reusable package so it depends on name  
Package main is used to create some executable file and any other name means we are creating reusable package  

So in executable package should have function main inside it  

### Basic go types
Bool  
String  
Int  
Float64  

:= this is used only for new variable  
```code
for i , card := range cards{  
  fmt.Println(i, card)  
}  
```
Type deck []string 

Receiver function :  set’s up method on the variable we create 
Any variable of type “deck” now gets access to the print method  

Func (d, deck) print(){

So deck above signifies that to which type this function is attached to


If the variable is not needed then replace with _  

Byte Slice : is string  

new() vs make() :  
The builtin new(T) function allocates “zeroed” storage for a new item of type T and returns its address, a value of type *T. In Go terminology, it returns a pointer to a newly allocated zero value of type T.  
The make() function, on the other hand, is a special built-in function that is used to initialize slices, maps, and channels. Note that make() can only be used to initialize slices, maps, and channels, and that, unlike the new() function, make() does not return a pointer.  

Error : value of type error, no error then we get nil  

Go testing : new file_test.go  
Testing should start with the word “test” 
  
Struct : collection of different property which are related together  
If no value assigned the empty value are assigned  
E.g. string “” int 0 float 0 bool false

We can embed one struct into other  

##### Go is pass by value
Pointers:  & variable give me the memory address of the value of this variable is pointing at  
           * pointer give me the value this memory address is pointing at  

This is type description it means we’re working with a pointer to a person  
func(pointerToPerson *person) updateName(){  
*pointerToPerson  

This is an operator - it means We want to manipulate the value The pointer is referencing  

Turn address into value with *address  
Turn value into address with &value  

The two newInt functions below have identical behaviors
```
func newInt() *int {            func newInt() *int {
    return new(int)                 var dummy int
}                                   return &dummy
                                }
```                                


#### To handle list
Array => Fixed length list of things  
Slice => An array that can grow or shrink, every element in slice must have the same type  

Arrays : can’t be resized  
Slices : can go and shrink, it create 2 data structure for us 1) slice [ ptr to head, capacity, length] and array internally  


Array in go is also pass by value  

Maps : [ key => value ] pair (Object in javascript)  
Key : all the same type  
Value : all the same type  

Concrete Type : map, struct, int, string, englishBot  


Channels =>  
Go routine => if go keyword is specified then new go routine(thread) is get started  

Go Scheduler => scheduler runs one routine until it finishes or makes a blocking call   

#### Concurrency : 


Parallelism :
 

Channel : if we create channel of string, we can use to share the data of type strings  
Channel are used to communicate between main routine and go routens 
![Input Image](./nature.jpeg)


Receiving messages from go routine is a blocking code  

## Interview question in golang
1) Why Golang  
2.1) What are primitive data types
https://technobeans.com/2019/01/03/3-interesting-primitive-data-types-in-golang/
2) What is Goroutine  
3) How to communicate between goroutines  
4) What is mutex?  =>  
    We've seen how channels are great for communication among goroutines.

    But what if we don't need communication? What if we just want to make sure only one goroutine can access a variable at a time to avoid conflicts?

    This concept is called mutual exclusion, and the conventional name for the data structure that provides it is mutex

5) What is synchronization  
6) How to achieve concurrency in Go  
- https://codeburst.io/why-goroutines-are-not-lightweight-threads-7c460c1f155f  
- Concurrency in Golang is the ability for functions to run independent of each other. A goroutine is a function that is capable of running concurrently with other functions. When you create a function as a goroutine, it has been treated as an independent unit of work that gets scheduled and then executed on an available logical processor. The Golang runtime scheduler has feature to manages all the goroutines that are created and need processor time. The scheduler binds operating system's threads to logical processors in order to execute the goroutines. By sitting on top of the operating system, scheduler controls everything related to which goroutines are running on which logical processors at any given time.
7) What is Channels in go?  =>  
Channels are the pipes that connect concurrent goroutines. You can send values into channels from one goroutine and receive those values into another goroutine.
8) What are the Types of Channels?  =>  
 Like array, slice and map, each channel type has an element type. A channel can only transfer values of the element type of the channel.
Channel types can be bi-directional or single-directional. Assume T is an arbitrary type,

    chan T denotes a bidirectional channel type. Compilers allow both receiving values from and sending values to bidirectional channels.
    chan<- T denotes a send-only channel type. Compilers don't allow receiving values from send-only channels.
    <-chan T denotes a receive-only channel type. Compilers don't allow sending values to receive-only channels.

9) What is Buffered Channel and Unbuffered Channel explain?  =>  
There are two types of channels based on their behavior of data exchange: unbuffered channels and buffered channels. An unbuffered channel is used to perform synchronous communication between goroutines while a buffered channel is used for perform asynchronous communication. An unbuffered channel provides a guarantee that an exchange between two goroutines is performed at the instant the send and receive take place. A buffered channel has no such guarantee.
10) How to avoid deadlock in a goroutine?  =>  
When you trying to read or write data from the channel but the channel does not have value. So, it blocks the current execution of the goroutine and passes the control to other goroutines, but if there is no other goroutine is available or other goroutines are sleeping due to this situation program will crash. This phenomenon is known as deadlock
11) How Goroutines Works?  =>  
If a goroutine is blocking, the runtime will start a new OS thread to handle the other goroutines until the blocking one stops blocking.
12) What is methods in Go?  

13) What anonymous function?  
14) What Variadic function?  
15) Variadic functions can be called with any number of trailing arguments
16) Explain Slices in Go in detail how they differ from another language?  
17) What is Closures in go?  
18) What is interface in Go?  
    Interfaces let us write functions that are more flexible and adaptable because they are not tied to the details of one particular implementation. Go’s interfaces so distinctive is that they are satisfied implicitly. In other words, there’s no need to declare all the interfaces that a given concrete type satisfies; simply possessing the necessary methods is enough
```
package main

import (  
    "fmt"
)

type SalaryCalculator interface {  
    CalculateSalary() int
}

type Permanent struct {  
    empId    int
    basicpay int
    pf       int
}

type Contract struct {  
    empId    int
    basicpay int
}

//salary of permanent employee is the sum of basic pay and pf
func (p Permanent) CalculateSalary() int {  
    return p.basicpay + p.pf
}

//salary of contract employee is the basic pay alone
func (c Contract) CalculateSalary() int {  
    return c.basicpay
}

/*
total expense is calculated by iterating through the SalaryCalculator slice and summing  
the salaries of the individual employees  
*/
func totalExpense(s []SalaryCalculator) {  
    expense := 0
    for _, v := range s {
        expense = expense + v.CalculateSalary()
    }
    fmt.Printf("Total Expense Per Month $%d", expense)
}

func main() {  
    pemp1 := Permanent{
        empId:    1,
        basicpay: 5000,
        pf:       20,
    }
    pemp2 := Permanent{
        empId:    2,
        basicpay: 6000,
        pf:       30,
    }
    cemp1 := Contract{
        empId:    3,
        basicpay: 3000,
    }
    employees := []SalaryCalculator{pemp1, pemp2, cemp1}
    totalExpense(employees)

}
```
The biggest advantage of this is that totalExpense can be extended to any new employee type without any code changes. Let's say the company adds a new type of employee Freelancer with a different salary structure. This Freelancer can just be passed in the slice argument to totalExpense without even a single line of code change to the totalExpense function.  
19) Does go support OOP?  
20) Explain the OOPs concept.  
21) How to create a basic server in Go?  
22) What are the basic data structures in Go?  
23) What is reflection  
24) What is byte [] slice  
25) How to create a Public/Private function in go (Access modifier in Go?)  
26) Does go function return multiple values?  
27)Difference between concurrency and Parralism?  
28) What is a map in go?  
29) Difference between new and make?  
30) What is Worker Pool?  
31) How map prints data  
32) What is rune?  
In the past, we only deal with one character set that is known as ASCII or the American Standard Code for Information Interchange. Here we use 7 bits to represent 128 characters, including upper and lowercase English letters, digits, and a variety of punctuations and device-control characters. Due to this a large number of the population of the world is not able to use their own writing system on the computer. So to solve this problem Unicode is invented. It is a superset of ASCII and contains all the characters present in the world’s writing system including accents and other diacritical marks, control codes like tab and carriage return, and assigns each one a standard number called a Unicode code point, or in Go language, a rune. The rune type is an alias of int32.

Important Points:

- Always remember a string is a sequence of bytes not of a rune. But it is possible that a string may contain Unicode text encoded in UTF-8 and as we knew that the go source code in always encodes as UTF-8 so, there is no need to encode the string in UTF-8.
- UTF-8 encodes all the Unicode in between 1 to 4 bytes, where 1 byte is used for ASCII and rest used for the rune.
- ASCII contains total 256 elements. In which 128 are characters and 0-127 are identified as code points. Here code point refers to the element which represents a single value.
33) How Append function Works?  
34) What is the REST API?  
35) What is Middleware?  
36) What is microservices?  
37) How to handle error in go?   
38) What is the Defer keyword?  
1. A deferred function’s arguments are evaluated when the defer statement is evaluated.  
```go
func a() {
    i := 0
    defer fmt.Println(i)
    i++
    return
}
```
The deferred call will print “0”
2. Deferred function calls are executed in Last In First Out order after the surrounding function returns.  
```go
func b() {
    for i := 0; i < 4; i++ {
        defer fmt.Print(i)
    }
}
```
This function prints “3210”  
3. Deferred functions may read and assign to the returning function’s named return values.  
```go
func c() (i int) {
    defer func() { i++ }()
    return 1
}

```
This function returns 2  
    If a deferred func evaluates to nil, execution panics when the surrounding func ends not when defer is called.
39) What is Recover?  
    Recover is a built-in function that regains control of a panicking goroutine. Recover is only useful inside deferred functions. During normal execution, a call to recover will return nil and have no other effect. If the current goroutine is panicking, a call to recover will capture the value given to panic and resume normal execution.
40) Difference between function and method?  
41) What is the empty interface?  
42) What is struct type?  
43) What is Enum in go?  
44) What is Go Module?  
45) How to manage dependency in Go?  
46) What is Packages in go?  
47) What is Select in go?  
48) What is IOTA?   
49) What is panic in go how to handle it?  
50) Do you know net/http package?  
51) What is JSON Encoding and Decoding?  

**************
What is Package Context in Go" and how we are using it? 

What is the type Assertion?

How Go's interface is different from Java Interface

Design database design for particular system consider normalization

What is Docker and Kubernetes?

What is AWS

Inline function in Go?

Inline struct in Go?

What is GORM?

What is Gorilla Mux?

Difference between Switch and Select in Go?

What is First-Class Function in Go?

How to define an anonymous function in Go?

How to define an anonymous struct in Go?

Function closures in Go

What is Pass by Value and Pass by Reference?

What is Slice Capacity and Length?

What is struct composition?

What is a nested struct?

How to delete elements from Slice?

What is Nil Interface

What is Zero Value, Write down for all basic types?

What is Atoi and Itoa ?

What is gRPC?

***************************************
Liberary and usage
- Zap => Blazing fast, structured, leveled logging (provide parent and child level logging system)  
https://github.com/uber-go/zap
- gorilla/mux => A powerful HTTP router and URL matcher for building Go web servers with gorilla
it does complex request routing like segmenting a request URL into single parameters  
https://github.com/gorilla/mux
- Ginkgo and Gomega => Ginkgo is a Go testing framework built to help you efficiently write expressive and comprehensive tests and Gomega is a assertion library.  
https://github.com/onsi/ginkgo   
https://github.com/onsi/ginkgo  
- Gorm => The fantastic ORM library for Golang, aims to be developer friendly   
https://github.com/go-gorm/gorm



### Internals of goroutines and channels  
https://www.notion.so/Internals-of-goroutines-and-Channels-ab82d73925054211a2fa7e3d4a7c54a2
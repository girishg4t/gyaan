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
  
For i , card := range cards{  
  fmt.Println(i, card)  
}  

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

Need to check
1) Experience with the full site of Go frameworks and tools, including:
(a) Dependency management tools such as Godep, Sltr, etc
(b) Go's templating language
(c) Go's code generation tools, such as Stringer
(d) Popular Go web Frameworks, such as Revel
(e) Router packages, such as Gorilla Mux
2) Ability to write clean and effective Godoc comments
3) Familiarity with code versioning tools.
4) Knowledge of shell scripts, hypervisors such as ESX/Hyper-V/KVM.
5) Exposure to various public & private cloud, such as AWS & Azure.
6) Good expertise on and Unix/Linux platforms and hands-on experience with Ansible playbooks
7) Good to have (Hands-on experience): VMware, AWS, Virtual networking, Azure, Docker, Kubernetes
8) Proven skills in developing modern responsive web applications. Please include in any of your CodeSandbox or Github profiles.
9) Collaborate with engineering, product, and cross-functional teams to devise optimal engineering solutions.
10) Familiarity with technologies such as distributed computing and/or scalable platforms; e.g. how to separate concerns (business logic vs UI vs state).

Interview question in golang
Why Golang  
What is Goroutine  
How to communicate between goroutines  
What is mutex?  
What is synchronization  
How to achieve concurrency in Go  
What is Channels in go?  
What are the Types of Channels?  
What is Buffered Channel and Unbuffered Channel explain?  
How to avoid deadlock in a goroutine?  
How Goroutines Works?  
What is methods in Go?  
What anonymous function?  
What Variadic function?  
Explain Slices in Go in detail how they differ from another language?  
What is Closures in go?  
What is interface in Go?  
Does go support OOP?  
Explain the OOPs concept.  
How to create a basic server in Go?  
What are the basic data structures in Go?  
What is reflection  
What is byte [] slice  
How to create a Public/Private function in go (Access modifier in Go?)  
Does go function return multiple values?  
Difference between concurrency and Parralism?  
What is a map in go?  
Difference between new and make?  
What is Worker Pool?  
How map prints data  
What is rune?  
How Append function Works?  
What is the REST API?  
What is Middleware?  
What is microservices?  
How to handle error in go?   
What is the Defer keyword?  
What is Recover?  
Difference between function and method?  
What is the empty interface?  
What is struct type?  
What is Enum in go?  
What is Go Module?  
How to manage dependency in Go?  
What is Packages in go?  
What is Select in go?  
What is IOTA?   
What is panic in go how to handle it?  
Do you know net/http package?  
What is JSON Encoding and Decoding?  


Coding interview questions :

Write any method code  
Swap if the number is greater than the next number  
Find the key from the array (not in any easy way, split the array into two then search)  
Find the count of words in a long string  
Check if the website is active or not?  
Find the random number with x length  
Find longest increasing subsequence in an array  
Get unique values from a slice of int with count  
Write palindrome program in go  
Get pairs with x difference only unique pairs  
Reverse a string Input = ‘Hello’, Output = ‘olleH’  
Write Code :- Input : "aabbbcccab" , Output: "aa2bbb3ccc3a1b1"  
Print unique elements form array, Input = [2,3,4,5,2,3], Output =  [2,3,4,5]  
Find the lengthiest word.  Input =’ i am in Bangalore‘  
Check whether it is closed or not.  Input =’{([])}’  
Count the repeat numbers Input = [2,3,4,5,2,3,2, 5, 2], Output = {2:4, 3:2, 4:1, 5:2}  
Display the middle number, Input = [2,3,4,5,2,3,7]  
Find Combination of pair elements which give 0, Input = [ -1, 0, 1, -2, 2, 3, 4, 5, 2, 3]  
Write a program use type interface with goroutines and channels.  
Generate N digit random number based on input. input : 5 , Output : 93657 Input : 2, Output : 47   

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

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

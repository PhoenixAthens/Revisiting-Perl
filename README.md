# Prerequisites
We are using perlbrew in this project! To install perlbrew, use the following commands
```shell
\curl -L https://install.perlbrew.pl | bash
```

To list versions of perl available for installation using perlbrew
```shell
perlbrew available
```

To install a version of perl to use with perlbrew
```shell
perlbrew install perl-5.42.2 #replace the version with your desired version
```

To list installed versions of perl
```shell
perlbrew list
```

New switch to any installed version of perl using perlbrew
```shell
perlbrew switch perl-5.42.2 #change the version number with your desired version
```

To run your program using perlbrew
```shell
perlbrew exec perl program-name.pl
```

# Basics (Ch:1)

## Printing 
One can use both c-style `printf` and perl-style `print` function in a perl program

C-style `printf`
```perl
printf("%s","Hello World");
```

perl-style `print`
```perl
print "Hello World"
```
Every statement in a perl program ends with a semicolon `;`

## Comments

Perl supports both single line and multi-line comments, single line comments start with a `#` and multi-line comments are enclosed within `=POD` and `=cut`
```perl
# multiline comments in perl

=POD
I am a multiline Comment
I work well
Try me
:<>>
=cut
````

## Variables
To create variables in Perl use a `$` before the variable name, for example
```perl
$name = "Khanna"
$gender = 'M'
$age = 23
```

Perl supports the following data Types:
### Boolean
Used to store `true` or `false` values. The numeric value `0` is used to represent `false`, whereas any other numeric value represents `true`.

### Integer
Any positive or negarive whole number, integer constants can be assigned in decimal, octal, hex, or binary numbering system.

```perl
$int_as_hex = 0xff;
$int_as_bin = 0b1011;
$int_as_octal = 0123;
print "Value is ",$int_as_hex,"\n"; # 255
print "Value is ",$int_as_bin,"\n"; # 11
print "Value is ",$int_as_octal,"\n"; # 83
```

### Float
Floating point or double values

### Array
An array is a list of similar or different data types, the variable storing an array starts with a `@`, arrays are 0 indexed, and enclosed within `()` parenthesis.
```perl
@list_of_integers = (1,2,3,4);
@list_of_chars = ('a','b','c');
@mix_values = (1,2,'a','c',"hello",2.34);
print "Index 0: ", @list_of_chars[0]; #a
```

## variable Variables (don't use them in production code, use hashes instead!)
So, this one is a bit tricky, they seem like pointers but are not, they are more like symbolic references, see the following code
```perl
$fruitName = "apple";
$$fruitName = "delicious";
print "fruitName ",$fruitName,"\n"; # fruitName apple
print "Taste of ",$fruitName, " is ",$$fruitName," \n"; # Taste of apple is delicious
```
> The above behavior is only possible with variable storing strings, if you do this with a variable storing integer, you'll get an error saying something like "Modification of a read-only value attempted at basics.pl"

When you use $$ before the variable name, you are basically asking perl to look at the string inside `$fruitName` (which is `apple`) and find a variable named `$apple`, thus when we write `$$fruitName`, we are basically treating the value inside `$fruitName` as a variable and storing the value, here "delicious" inside it. Variable name, say `＄fruitName`, can be put between `{}`, then it would be used like so `${$fruitName}`.

This behavior throws a runtime error when we have `use strict;` in our code.

The use of `{}` with _variable Variables_ or _symbolic Variables_ is useful in following situation
```perl
$skyColor = "Blue";
$varPrefix = "sky";
print $skyColor,"\n"; #Blue

print ${$varPrefix."Color"}."\n"; #Blue
```
`.` operator is used to concatenate strings, in the above code example the name of the variable is itself an expression and the `.` operator is used to concatenate it with other variable part to get the resule, first `$varPrefix` is evaluated, thus we get "sky", this string is then concatenated with "Color", this gives us `$skyColor`, which returns the value "Blue".

## Operators
!["Image of operators"](./Assets/Operators.png "Operators")

Two operators to take note of here are `cmp` and `<=>` (the space-ship operator), the `<=>` works only for numeric data types and `cmp` works only with string data type. both return `-1` if the first expression is smaller than the second expression, `1` if the first expression is greater than the second expression and `0` if both expressions are equal
```perl
$value1 = 23;
$value2 = 46;
print "Result: ".($value1 <=> $value2)."\n"; # -1
$value1 = 47;
print "Result: ".($value1 <=> $value2)."\n"; # 1
$value2 = 47;
print "Result: ".($value1 <=> $value2)."\n"; # 0

$value1 = "Ak";
$value2 = "Bc";
print "Result: ".($value1 cmp $value2)."\n"; # -1
````

>Thing to note about Logical operators
In Perl, the `&&` , `||`, and `!` operators have higher precedence than `and`, `or`, and `not` respectively, as evident from the table below:

| Evaluation | Result | Evaluated as |
| -------- | -------- | -------- |
| $e = true && false | False | $e = (true && false) |
| $e = true and false | True | ($e = true) && false |

```perl
$e = false;
$e = true && false;
print "Result: ".$e."\n";
$e=true and false;
print "Result: ".$e."\n";
```
Because of this, it’s safer to use `&&`, `||`, and `!` instead of `and`, `or`, and `not` respectively.

Even in Perl `++` is a post-increment operator.

## Conditionals

### if-elsif-else
In Perl, we have `if`, `elsif`, and `else` to implement conditional logic

### given-when
A construct similar to `switch` statement is `given-when` construct, an expression is placed inside the `given` construct and after that we have a bunch of `when` constructs with constant-expressions and when the expression in `given` evaluates to one of the constants in `when` constructs, the code within the respective `when` block is executed. we also have a `default` block, the code within which runs only if none of the `when` blocks match the expression.

```perl
$colors = "Red";
given(colors){
    when("Orange"){
        print "You got it!"
    }
    when("Yellow"){
        print "Those small men in yellow coats!"
    }
    when("Green"){
        print "Now that's some save-earth stuff"
    }
    default{
        print "Opps! No match found "
    }
}
```
However, `given-when` constructs are old way of doing things and deprecated in newer versions of perl, therefore even to use these constructs one has to add the line `use feature 'switch';` to the source code.

Modern `perl-way` of writing switch statements is to use the `if-elsif` as follows
```perl
my $colors = "Red";
if ($colors eq "Orange") {
    print "You got it!";
}
elsif ($colors eq "Yellow") {
    print "Those small men in yellow coats!";
}
elsif ($colors eq "Green") {
    print "Now that's some save-earth stuff";
}
else {
    print "Opps! No match found";
}
```

### ternary operator
Perl also supports c-style ternary operator
```perl
$color2 = "Brown";
$result = ($color2 eq "yellow")?"hell yeah!\n":"Shite!\n";
print $result;
```

## Loops
Perl supports do...while, while, for, foreach, and until loops to execute code repeatedly.

The syntax of `do...while`, `while`, and `for` loop is similar to that in `C`

The `foreach` statement is similar to the for statement, as both are the iterative statements. However, the `foreach` statement lacks an iteration index and works even with collections that lack indices altogether.
```perl
@items = ('corn','muesli','hotdog','mustard','wheat');
foreach $item(@items){
    print $item."\n";
}
```

We can also use the `foreach` loop without the loop-variable, like so
```perl
@items = ('corn','muesli','hotdog','mustard','wheat');
foreach (@items){
    print "$_\n";
}
```
Here, we are accessing the items from the array using `$_`

### Until loop
`Until` loop is unlike other loop-constructs, such that it executed until the condition within parens is false. 
```perl
$y = 0;
until ($y>5){
    print "Value of y: ".$y."\n";
    $y++;
}
# Value of y: 0
# Value of y: 1
# Value of y: 2
# Value of y: 3
# Value of y: 4
# Value of y: 5
```
The above loop will execute `until` the condition `$y>5` remains `false`, once it returns `true`, the loop will terminate.

## Subroutines
In Perl functions are referred to as subroutines, they need to be declared before they are called otherwise we get a `runtime error`. They are defined with the keyword `sub` in perl.

### Variable Scoper
In Perl, we have two types of variables, `global` and `local`, `local` variables are declared with the keyword `my`. Using `my` we can use the same variable name in global and local scope, but they won't interfere with each other.
```perl
$number = 20;   # if my is not used then its scope is global

sub foo{
  my $number = 10;  # using my keyword for local variable
  print "Local Variable value" .$number . "\n";
}
foo(); #Will print 10 because text defined inside function is a local variable

print "global Variable value " . $number . "\n";
```

But if we want modify a global variable within a subroutine, we need to use the `＄::` keyword. This is done by placing the `$::` keyword in front of the variable.

```perl
$num1 = 5;  # global variables
$num2 = 2;

sub multiply(){
  $::num1 = 10;
  $::num2 = 20;
  return  $num1 * $num2;
}

# When in the global scope, regular global variables can be used
# without explicitly stating '$::variablename'
print multiply();
print "num1 is: $num1\n"; #10
print "num2 is: $num2\n"; #20
```
However, if we move the call to `multiply()` after our `print` statements, `num1` and `num2` will be printed as `5`, and `2` respectively

Example of a subroutine in perl
```perl
sub sum{
    return @_[0]+@_[1];
}
print sum(1,2)." "; #3
```

### Params to a subroutine
Parameters are passed in the subroutines. They are used to hold values during runtime of a subroutine. A user can pass multiple parameters into a subroutine, we can get them by using `@_[0]` for the first parameter and `@_[1]` for the second parameter and `@_[2]` for the third parameter.

```perl
#subroutine with two parameters
sub mySubroutine{
    $num1 = @_[0];
    $num2 = @_[1];
    
    print  "The value assigned to num1 is $num1\n";
    print  "The value assigned to num2 is $num2";
}
#calling subroutine and passing arguments to it
mySubroutine(3,4);
```

Perl allows us to pass arguments into a subroutine in two ways:
- Pass by Value
- Pass by Reference

On passing `arguments by value`, the value of the argument may change within a subroutine, but the original value outside the subroutine remains unchanged. That means a duplicate of the original value is passed as an argument.

Example of `pass-by-value`
```perl
sub cube {    
  my $num1 = @_[0];     #num1 parameter passed by value here
  return $num1 * $num1 * $num1; #cube of num1 returned
} 

$answer = cube(3); #function cube called with 3 passed as the argument 
print $answer ;
```

When passing `arguments by reference`, the original value is passed. Therefore, the original value gets altered. In pass by reference, we actually pass the value and access them using ＄_[index] where the index is the variable sequence passed. It tells the compiler that the data is a reference to the value rather than simply the value itself.

print "hello world\n"; # perl - style
printf("%s","hello-world"); # c-style

# multi-line commen
=POD
hello there
I am multi-line comment
how are you?
Doing good, eh?
=cut

# variables
$string = "This is a string";
$int = 34;
$float = 2.34;
$char = 'a';

print $string,"\n";
print "An integer type: ",$int," \n";
print "A float type: ",$float," \n";
print "A character type: ",$char," \n";

$int_as_hex = 0xff;
$int_as_bin = 0b1011;
$int_as_octal = 0123;
print "Value is ",$int_as_hex,"\n"; # 255
print "Value is ",$int_as_bin,"\n"; # 11
print "Value is ",$int_as_octal,"\n"; # 83
=POD
Value is 255
Value is 11
Value is 83
=cut

# arrays
@list_of_integers = (1,2,3,4);
@list_of_chars = ('a','b','c');
@mix_values = (1,2,'a','c',"hello",2.34);
print "Index 0: ", @list_of_chars[0],"\n"; #a

# variable Variables
$fruitName = "apple";
$$fruitName = "delicious";
print "fruitName ",$fruitName,"\n"; # fruitName apple
print "Taste of ",$fruitName, " is ",$$fruitName," \n"; # Taste of apple is delicious

$fruitQuantity = 5;

#the following code causes a runtime error
=POD
$$fruitQuantity = "toomuch"; # Modification of a read-only value attempted at basics.pl
print "fruitName ",$fruitQuantity,"\n"; # fruitName apple
print "Taste of ",$fruitQuantity, " is ",$$fruitQuantity," \n"; # Taste of apple is delicious
=cut

$skyColor = "Blue";
$varPrefix = "sky";
print $skyColor,"\n"; #Blue

print ${$varPrefix."Color"}."\n"; #Blue

# spaceship operator and `cmp` operator
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

$e = false;
$e = true && false;
print "Result: ".$e."\n"; #false
$e=true and false;
print "Result: ".$e."\n"; #true

# give-when construct
#
# use feature 'switch';

=POD
$colors = "Red";
given(colors){
    when("Orange"){
        print "You got it!\n"
    }
    when("Yellow"){
        print "Those small men in yellow coats!\n"
    }
    when("Green"){
        print "Now that's some save-earth stuff.\n"
    }
    default{
        print "Opps! No match found \n"
    }
}
=cut

$color2 = "Brown";
$result = ($color2 eq "yellow")?"hell yeah!\n":"Shite!\n";
print $result;

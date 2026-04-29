#basic odd-even
$temp = 0;
$number = 23;
if($number%2==0){
    $temp = 0;
}else{
    $temp = 1;
}
$result = ($temp==0)?"Even\n":"Odd\n";
print "The number is ".$result,"\n";

# calculator
$num1 = 23;
$num2 = 24;
$operator = "+";
$result = 0;
if($operator eq '+'){
    $result = $num1+$num2;
    print $result."\n";
}elsif($operator eq '-'){
    $result = $num1-$num2;
    print $result."\n";
}elsif($operator eq '*'){
    $result = $num1*$num2;
    print $result."\n";
}else{
    $result = $num1/$num2;
    print $result."\n";
}

# multiplication table

$num = 5;
$ans = "xyz";
$result = "";
for($i=1;$i<=10;$i++){
    $result = $result.($num*$i)." ";
}
$ans = $result;
print $ans,"\n ";

#fibonacci
$value = 6;
$ans = "xyz";
$last = 1;
$beforeLast = 0;
$result = $beforeLast." ".$last." ";
while($value>2){
    $calc = $beforeLast+$last;
    $result = $result.$calc." ";
    $beforeLast = $last;
    $last = $calc;
    $value--;
}
$ans = $result;
$ans =~ s/\s+$//;
print $result."\n";

=POD
The line `$ans =~ s/\s+$//;` in your Perl code is used to remove any trailing whitespace characters from the end of the string stored in the `$ans` variable.

Here's a breakdown:

*   `$ans =~`: This applies the regular expression operation to the `$ans` variable.
*   `s///`: This is the substitution operator in Perl. It means "substitute the pattern found between the first two slashes with the replacement found between the second and third slashes."
*   `\s+`: This is the regular expression pattern.
    *   `\s` matches any whitespace character (space, tab, newline, carriage return, form feed).
    *   `+` means "one or more" of the preceding character or group. So, `\s+` matches one or more whitespace characters.
*   `$`: This is an anchor that asserts the position at the end of the string.
*   `//`: The replacement part is empty, meaning whatever matches `\s+$` will be removed.

In summary, this line effectively "trims" any spaces, tabs, or newlines from the rightmost side of the `$ans` string.
=cut

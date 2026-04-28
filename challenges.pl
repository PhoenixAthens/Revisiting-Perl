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

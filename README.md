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

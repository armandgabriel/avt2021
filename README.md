# avt2021

#Team
#1. Monica Ioana Vulpe
#2. Camner Armand Gabriel


Assignments:

--> Implement a Base64 encoder and decoder. The solution should receive from command line the
name of the input plaintext file and the name of the output encoded text  

--> Implement the Vigenere cipher in assembly. The solution should receive from command line the
password, the name of the input plaintext file and the name of the output cipher text

-->  Implement the Playfair cipher in assembly. The solution should receive from command line the
password, the name of the input plaintext file and the name of the output cipher text

--> Timid II - Exercise 4, page 86 in Giant Black Book of Computer Viruses (on Sakai in Resources
folder). There is no reason a virus must put itself all at the beginning or at the end .........

==== Tasks ====

-- R01: Implement a way to read from command line with multiple arguments: Example
test.asm comand1 comand2 comand3 ....
-- R02: Implement save to file module
-- R03: Implement base64 module
-- R04: Implement Vigenere cipher
-- R05: Implement Timid II.

===================================

Base64 EXAMPLE ENCODER/Decoder:
https://en.wikipedia.org/wiki/Base64

Example

Base64 Encoder/Decoder in x86 Assembly
To assemble base64.asm use the following commands:

nasm -f elf base64.asm
ld -m elf_i386 base64.o -o base64
Application Valid Parameters:
-e - to encode
-d - to decode
-t - text to be encoded/decoded will be passed from application arguements
-f - encode/decode a file (not implemented yet)
Usage:
To encode:

$ ./base64 -e -t "Some text to encode"
$ U29tZSB0ZXh0IHRvIGVuY29kZQ== (Output)
To decode:

$ ./base64 -d -t "U29tZSB0ZXh0IHRvIGVuY29kZQ=="
$ Some text to encode


== READ ALGORITHM PSEUDO HERE ===
https://base64.guru/learn/base64-algorithm/encode

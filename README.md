# Easy 68K-Assembler
For my Computer Technology & Maths module back in my first year at NTU we got to fiddle around with some assembly language while trying to learn a little bit more about the fundamentals of computers at a lower level.  I've decided to store my final project for the module on here along with a few of the projects I translated as part of the module requirements.

### Translated Programs (Originally in C++):
- **Word Count:** This program takes a sentence and counts the number of words in it. It has the additional feature of knowing whether there's more than a singular space between two words. This prevents the program from accidentally considering that extra *space* as a word.
- **Char Replace:** This program replaces a specified character with another character.

### Other Programs:
- **Hello World:** Of course you've got to have the classic beginner program! How else do you expect to learn a new language?

### Module Project:
**Easy 68K:** For my project I decided to go with the classic *calculator* route (Addition, Subtraction, Multiplication and Division). I did, however, underestimate how much more complex it was going to be to implement certain aspects of the logic. With a lot of higher level languages we take the mathematical functionality of it for granted. It's a lot simpler to do this: -1 * -1 in C++ or Python than it is in Assembly language. Hence, the scope of the project soon went beyond my experience level (*absolute beginner*).  

The final product is a super simple calculator with a few instances of error handling. It is able to only do a certain combination of calculations with negative values accurately. Other times it may produce the right value but the wrong sign. Alternatively it may have the right sign but the wrong value!
The experience of working with Easy 68K definitely had a bit of a learning curve to it, however, now I can confidently write a few basic programs. At some point in the future I hope to be able to remake this calculator entirely to be error free. 

**Meta-Assembler:** Another aspect of my module was to create a meta assembler in C++ to work alongside the CEDAR Logic simulated processor we had been building on throughout our lab sessions. Since my main submission for the final project was the Easy 68K project I went with a basic concept for the meta-assembler. This meta-assembler is able to read an assembly program from a file and convert it into an acceptable format. That is then written to a .cdm file that can be passed through CEDAR Logic and run on the simulated processor. The meta-assembler contains a dictionary that stores the opcode mnemonic alongside it's equivalent code for the processor. *(If you're interested in viewing the custom instruction set for the simulated processor please do get in touch)*

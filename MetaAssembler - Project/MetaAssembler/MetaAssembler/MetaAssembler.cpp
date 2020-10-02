// MetaAssembler.cpp : This file contains the 'main' function.

#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

// Declare Struct and other variables and constants
const int NumOfValues = 15;
string OpcodeInput = " ";
string OperandInput = " ";

struct Data {
    string Mnemonic;
    string NumericCode;
};

int main()
{
    // Define the InstructionTable struct with all the necessary values
    Data InstructionTable[NumOfValues] = { {"JMP", "E"}, {"ADDI", "D"}, {"MOVEI", "C"}, {"MOVE", "B"}, {"STORE", "A"},
                                           {"LDA", "9"}, {"STA", "8"}, {"STA+", "7"}, {"MOVE(A)", "6"}, {"MOVE(A)+", "5"},
                                           {"LDSP", "4"}, {"JSR", "3"}, {"RTS", "2"}, {"BZ", "FE"}, {"BNZ", "FD"} };

    // Read the Assembly program from text file
    ifstream TxtFile("Data.txt");

    // Open the .cdm file to be written to
    ofstream CDMFile("MemoryContents.cdm");

    // Error-Handling in case file is unable to open
    if (!TxtFile.is_open()) std::cout << "Error" << "\n";

    // Variables to store the data read from the file
    string Opcode = "Nothing";
    string Operand = "Nothing";

    // Counter that increments whenever a line is written to the .cdm file
    int Counter = 0;

    // Loop through the Assembly program and read it line by line
    while (TxtFile.good())
    {
        // Store the data in the corresponding variables
        getline(TxtFile, Opcode, ',');
        getline(TxtFile, Operand, '\n');

        // Output to the command line all the lines that have been read from the .txt file
        cout << "Opcode: " << Opcode << "\t";
        cout << "Operand: " << Operand << endl;

        // Cycle through all the contents in the struct
        for (int i = 0; i < NumOfValues; i++)
        {
            // If the opcode is found in the instruction table, save it to the .cdm file
            if (Opcode == InstructionTable[i].Mnemonic)
            {
                string TempString = InstructionTable[i].NumericCode + Operand;

                CDMFile << Counter << " : " << TempString << "\n";
                Counter++;
            }
        }
    }

    //Close the files
    CDMFile.close();
    TxtFile.close();
}
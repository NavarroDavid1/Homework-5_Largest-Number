#include <iostream>

// Function declarations for assembly routines
extern "C" long manager();

int main() {
    std::cout << "Welcome to the Largest Number program, brought to you by [Student Name].\n";
    
    // Call manager function and get result
    long result = manager();
    
    std::cout << "The driver received this value: " << result << "\n";
    std::cout << "Have a nice day. The program will return control to the operating system.\n";
    
    return 0;
}

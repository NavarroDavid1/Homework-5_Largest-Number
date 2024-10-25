# Programming Assignment - The Largest Number


# My Information
* Name: David Navarro
* CWID: 1234567890
* Email: dnavarro51@student.rccd.edu


# Project Overview
This project is designed to handle array manipulation using C++, C, and assembly. The program allows the user to input integers, stores them in an array on the stack, displays the array, and identifies the largest number using a combination of C++ and assembly functions.

The project is structured into several modules:
* **`largest.cpp`** - The main entry point of the program (C++).
* **`manager.asm`** - The assembly function that coordinates the input/output, and calls other functions.
* **`input_array.cpp`** - Handles user input and fills the array (C++).
* **`output_array.asm`** - Displays the array of integers (Assembly).
* **`find_largest.asm`** - Locates the largest integer in the array and returns its index (Assembly).


# Compilation and Execution
To compile and run the program:
1. Run `make` to compile the project.
2. Run `./main` to execute the program.

The Makefile ensures that the program is properly compiled and linked using GCC and NASM. Each function/module has a clear responsibility: handling user input, displaying the array, and finding the largest number.

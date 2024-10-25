# Compiler settings
CXX=g++
ASM=nasm
CXXFLAGS=-std=c++17 -g
ASMFLAGS=-f elf64 -g

# Target executable
TARGET=main

# Object files
OBJECTS=largest.o manager.o input_array.o output_array.o find_largest.o

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c largest.cpp -o largest.o

manager.o: manager.asm
	$(ASM) $(ASMFLAGS) manager.asm -o manager.o

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c input_array.cpp -o input_array.o

output_array.o: output_array.asm
	$(ASM) $(ASMFLAGS) output_array.asm -o output_array.o

find_largest.o: find_largest.asm
	$(ASM) $(ASMFLAGS) find_largest.asm -o find_largest.o

clean:
	rm -f $(TARGET) $(OBJECTS)

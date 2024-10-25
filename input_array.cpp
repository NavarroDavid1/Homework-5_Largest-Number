#include <iostream>
#include <limits>

extern "C" long input_array(long* array, long max_count) {
    long count = 0;
    std::string input;
    
    std::cout << "Input your integer data one line at a time and enter 'q' when finished\n";
    
    while (count < max_count) {
        std::cout << "Enter the next integer: ";
        std::getline(std::cin, input);
        
        if (input == "q" || input.empty()) {
            std::cout << "You have entered nonsense! Assuming you are done.\n";
            break;
        }
        
        try {
            long num = std::stol(input);
            array[count] = num;
            std::cout << "You entered: " << num << "\n";
            count++;
            
            if (count < max_count) {
                std::cout << "You can enter up to " << (max_count - count) 
                         << " more integers\n";
            }
        }
        catch (...) {
            std::cout << "You have entered nonsense! Assuming you are done.\n";
            break;
        }
    }
    
    std::cout << "Total numbers entered: " << count << "\n";
    return count;
}

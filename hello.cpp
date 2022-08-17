#include <iostream>
#include <vector>
#include "config.h"
using namespace std;

int main(int argc, char *argv[])
{

    if (argc == 1)
    {
        std::cout << "Hello World" << std::endl; // prints Hello World
        return 0;
    }

    std::vector<std::string> all_args(argv + 1, argv + argc);
    if (all_args[0] == "version")
    {
        std::cout << "Version " << VERSION << std::endl;
        return 0;
    }
    return 0;
}

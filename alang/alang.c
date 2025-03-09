#include <stdio.h>
#include <src/compiler.h>
#include <buffer.h>

int main(int argc, const char* argv[])
{
    Buffer buffer;
    Init(&buffer);
    PrintHello();
    return 0;
}

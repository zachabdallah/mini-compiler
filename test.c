#include <string.h>
#include <stdio.h>

int arithmetic();
float trig();

void main() {
    int x;
    float z = 1.5;
    char y = "hello world";
    x = arithmetic();
    while(y == "hello world") {
        if(z < trig()) {
            y = "Bye";
        }
        else if(z == trig()) {
            y = "We will never part.";
        }
        else {
            z = z - 0.2;
        }
    }
    printf("%s%d", y, x);
}

int arithmetic() {
//include math stuff
}

float trig() {
//include trig stuff
}

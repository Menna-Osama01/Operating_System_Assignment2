# Operating System Assignment 2

## Description
This project demonstrates basic process management in C, compilation using Makefile, and the roles of the Linker and Loader in creating and running programs.

## Exercises

### Exercise 1: Using fork() in C
**Code Example:**
```c
#include <stdio.h>
#include <unistd.h>
int main() {
    pid_t pid = fork();
    if (pid == 0) {
        printf("This is the child process. PID: %d\n", getpid());
    } else if (pid > 0) {
        printf("This is the parent process. PID: %d\n", getpid());
    } else {
        printf("Fork failed!\n");
    }
    return 0;
}

## Explanation:
When fork() runs, the computer makes a copy of the current program. Now, two programs run the same code: one is the parent and the other is the child. To tell them apart, fork() assigns different numbers called "process IDs" (PID). The child process receives a return value of 0 from fork(), which indicates, "You are the child." The parent process gets the child's PID as its return value, meaning, "You are the parent." The child receives a copy of the parent's memory space. Both processes continue running the program from the same point but can perform different actions depending on whether they are the parent or child. Thus, fork() helps us manage processes so we can create multiple processes.

### Exercise 2: Stopping Processes
**Code Example:**
```c
ps aux | grep sleep
kill <PID>
ps aux | grep sleep

## Explanation:
ps aux | grep sleep lists all running processes and filters those that include the word "sleep." It shows the sleep process that started earlier along with its Process ID (PID). The PID helps us identify that specific process.

kill <PID> sends a signal to the process with the given PID. It stops the sleep process from running by asking the operating system to terminate it.

Running ps aux | grep sleep again after using kill checks whether the sleep process is still active. If the kill was successful, the sleep process should not appear, confirming it has been stopped.

ps helps us find processes and their IDs, kill stops them by PID, and verifying with ps confirms the action.

### Exercise 3: Pausing and Resuming a Process
**Code Example:**
```c
kill -STOP <PID>
kill -CONT <PID>

## Explanation:
kill -STOP <PID> sends a signal that pauses the process immediately. The process stays in memory but stops using the CPU and doesn’t run any code until it is resumed. It’s like pressing a pause button on the process. The process's state and data remain exactly as they were when paused.

kill -CONT <PID> sends a signal that resumes the paused process. It tells the process to continue running from where it stopped. It’s like pressing a play button to resume the process's work.

### Exercise 4: Role of the Linker
**Code Example:**
```c
#File 1: file1.c
#include <stdio.h>
void hello() {
    printf("Hello from file1!\n");
}

#File 2: file2.c
void hello();
int main() {
    hello();
    return 0;
}

## Explanation:
The file1.c defines the function hello() that prints a message. The second file file2.c declares the hello() function and calls it from main(). Each source file compiles individually into object files .o. Then, the linker connects these object files together. The linker's role is to find all the functions and variables used in the files and connect the function call to its actual definition. For example here, it links the call to hello() in file2.c with the definition in file1.c and produces one single executable file that combines the pieces from both source files.

###Exercise 5: Role of the Loader
**Code Example:**
```c
#include <stdio.h>
int main() {
    printf("This is a simple program.\n");
    return 0;
}

## Explanation:
When the program runs,the loader Loads the program's executable file from disk into RAM.Then, it loads the shared libraries that the program needs, like so in the ldd output.Next, it allocates memory for the program's code, data, and stack to set up connections. Thus, the program can use the functions from the shared libraries.Finally, it prepares the CPU and program environment to start running the program.


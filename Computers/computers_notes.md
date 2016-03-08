# Processors
## Multi-core
In order to use multiple cores at the same time, multiple threads are required. (The inverse is not true: multiple threads can be handles on a single core through scheduling.)
## Threads
A thread is essentially a single sequence of instructions. A process (a running instance of a program) consists of one or more threads. A processor core is a unit capable of processing a sequence of instructions. So there is a direct relation between threads and cores. For the OS, a thread is a unit of workload which can be scheduled to execute on a single core.
In order to make a single core able to run multiple threads, a form of time-division multiplexing is used. To simplify things a bit: the OS sets up a timer which interrupts the system at a fixed interval. A single interval is known as a time slice. Every time this interrupt occurs, the OS runs the scheduling routine, which picks the next thread that is due to be executed. The context of the core is then switched from the currently running thread to the new thread, and execution continues.
## Simultaneous multi-threading

## HyperThreading
for sequential parts you will only use one logical core, which will have the physical core all to itself, so you get the excellent single-threaded performance that Intel’s architecture has to offer. For the parallelized parts, all logical cores can be used. Now, they may not be as fast as the physical cores, but you have twice as many. And each logical core will still exceed half the speed of a physical core, so there is still performance gain.

# Operating systems
## Kernel
In computing, the kernel is the main component of most computer operating systems; it is a bridge between applications and the actual data processing done at the hardware level. The kernel's responsibilities include managing the system's resources (the communication between hardware and software components).
## Shell
A shell is software that provides an interface for users of an operating system to access the services of a kernel. Operating system shells generally fall into one of two categories: command-line and graphical. Command-line shells provide a command-line interface (CLI) to the operating system, while graphical shells like the Windows Shell.
## Terminal
A terminal refers to a wrapper program which runs a shell. Decades ago, this was a physical device consisting of little more than a monitor and keyboard. As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software. Now you have programs such as Gnome Terminal which launches a window in a Gnome windowing environment which will run a shell into which you can enter commands.
## Console
The console is a special sort of terminal. Historically, the console was a single keyboard and monitor plugged into a dedicated serial console port on a computer used for direct communication at a low level with the operating system. Modern linux systems provide virtual consoles. Interacting with the console is also done using a shell program.

#  Synonyms
## Command-line
Command-line interface (CLI)
Prompt
DOS prompt
Terminal
Bash
Shell
Console
CMD

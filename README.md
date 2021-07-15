# Why Makefile ?
- Easiness: developers in embedded systems field prefer using visual studio code. They can use VSCode with a Makefile to compile all the project with just one command <code>make</code>. They can also upload the the code to the target board with just a command. Once the Makefile is written, it rarely changes.

- Pure: developers can see how their programs are compiled and this avoids any ambiguity from the perspective of the build process.

- To avoid the IDE problems (GUI problem, compatibility problem, etc.)

- Full customization: developers have full control of the build process (compiler and linker flags, what to link and what not to, etc).

# To make visual studio code recognize gcc built-in libraries

1. press <code>ctrl+shift+p</code>
1. search for <code>C/C++ edit configuration</code>
1. edit the the include path and add this path
    ```
    "includePath": [
                    "C:\\Program Files (x86)\\GNU Arm Embedded Toolchain\\10 2020-q4-major\\arm-none-eabi\\include"
                ],
    ```

# Configuration

- <code>CPU</code> determine the processor used.
- for OpenOCD, determine the right configuration file and put it in the folder of the Makefile.
- If you work with <strong><a href="https://xpack.github.io/qemu-arm/">xPack QEMU Arm</a></strong>, you should change the board after <code>-board</code> flag

    - xPack QEMU Arm is a fork of the public open-source QEMU project, customised for more support of Cortex-M cores, and a better integration with the GNU Arm QEMU Debugging plug-in.
    - To install xPack QEMU Arm, download the <a href="https://github.com/xpack-dev-tools/qemu-arm-xpack/releases">binaries</a> and add them to your path.
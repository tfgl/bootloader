main: boot.asm
	- nasm -f bin boot.asm -o boot
	- qemu-system-x86_64 boot

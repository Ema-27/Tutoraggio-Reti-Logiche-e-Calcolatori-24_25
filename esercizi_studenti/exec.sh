
if [ "$1" == "" ]; then
	echo "Uso: ./run <nome_file_sorgente> (senza estensione)"
else
	if [ -f $1.nasm ]; then
		nasm -f elf32 $1.nasm -o $1.o 2> error.log

        nasm -f elf32 $1_proc.nasm -o $1_proc.o 2> error.log
	else
		if [ -f $1.asm ]; then
			nasm -f elf32 $1.asm -o $1.o 2> error.log

            nasm -f elf32 $1_proc.asm -o $1_proc.o 2> error.log
		else
			echo "Il file '$1.asm' o '$1.nasm' non esiste"
			exit 1
		fi
	fi
	ld -m elf_i386 -o $1 $1.o $1_proc.o utils.o -o $1 2>> error.log
	cat error.log
	./$1
fi

#ld -m elf_i386 -o $1 $1.o $1_proc.o utils.o -o $1 2>$1 | grep -v 'warning' | grep -v 'NOTE'
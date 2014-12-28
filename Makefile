vigenere: vigenere.hs
	ghc vigenere.hs -o vigenere -O2

clean:
	rm vigenere.hi vigenere.o

distclean:
	rm vigenere vigenere.hi vigenere.o

install:
	cp vigenere /usr/local/bin
	
uninstall:
	rm /usr/local/bin/vigenere

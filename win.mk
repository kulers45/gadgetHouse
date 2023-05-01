#	run this with 
#   "mingw32-make.exe -f win.mk"

SRCDIR=./src

INCLUDE = C:\msys64\mingw64\include

LIBS = C:\msys64\mingw64\lib

LDFLAGS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -lSDL2_net -lSDL2_ttf -lSDL2_mixer -mwindows

game: main.o vec2.o physicsObject.o renderObject.o keyboard.o player.o spriteHandler.o text.o attacks.o sounds.o menu.o
	gcc -o game.exe main.o vec2.o physicsObject.o renderObject.o keyboard.o player.o spriteHandler.o text.o attacks.o sounds.o menu.o -L$(LIBS) $(LDFLAGS)
main.o: 
	gcc -c $(SRCDIR)/main.c -I$(INCLUDE)
vec2.o: 
	gcc -c $(SRCDIR)/vec2.c
keyboard.o:
	gcc -c $(SRCDIR)/keyboard.c -I$(INCLUDE)
physicsObject.o: vec2.o
	gcc -c $(SRCDIR)/physicsObject.c	
renderObject.o:
	gcc -c $(SRCDIR)/renderObject.c -I$(INCLUDE)
player.o: keyboard.o renderObject.o physicsObject.o
	gcc -c $(SRCDIR)/player.c	
spriteHandler.o: 
	gcc -c $(SRCDIR)/spriteHandler.c -I$(INCLUDE)
text.o:
	gcc -c $(SRCDIR)/text.c -I$(INCLUDE)
attacks.o:
	gcc -c $(SRCDIR)/attacks.c -I$(INCLUDE)
sounds.o:
	gcc -c $(SRCDIR)/sounds.c -I$(INCLUDE)
menu.o:
	gcc -c $(SRCDIR)/menu.c -I$(INCLUDE)

clean:
	rm *.o
	rm *.exe
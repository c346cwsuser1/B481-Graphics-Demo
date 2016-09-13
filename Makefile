CC = g++
CFLAGS = -pedantic -Wall -Wno-deprecated-declarations -Wno-deprecated -g
LDFLAGS = -framework GLUT -framework OpenGL -framework Cocoa

# Linux: LDFLAGS = -lGL -lGLU -lglut
# Possibly Windows: LDFLAGS = -lopengl32 -lglu32 -lglut32
# OSX: LDFLAGS = -framework GLUT -framework OpenGL -framework Cocoa

all: gasket1 gasket2 gasket3

gasket1: gasket.c
	g++ $(CFLAGS) -o $@ gasket.c $(LDFLAGS)

gasket2: gasket2.c
	g++ $(CFLAGS) -o $@ gasket2.c $(LDFLAGS)

gasket3: gasket.c
	g++ $(CFLAGS) -o $@ gasket3.c $(LDFLAGS)

clean:
	@rm -f gasket1 gasket2 gasket3


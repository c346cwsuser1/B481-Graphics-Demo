CC = g++
CFLAGS = -pedantic -Wall -Wno-deprecated-declarations -Wno-deprecated -g
LDFLAGS = -framework GLUT -framework OpenGL -framework Cocoa

# Linux: LDFLAGS = -lGL -lGLU -lglut
# Possibly Windows: LDFLAGS = -lopengl32 -lglu32 -lglut32
# OSX: LDFLAGS = -framework GLUT -framework OpenGL -framework Cocoa

all: linedrawing testing pick gasket1 gasket2 gasket3 pick

testing: test.cc
	g++ $(CFLAGS) -o $@ test.cc $(LDFLAGS)

pick: pick.cc
	g++ $(CFLAGS) -o $@ pick.cc $(LDFLAGS)

paint: paint.c
	g++ $(CFLAGS) -o $@ paint.c $(LDFLAGS)

gasket1: gasket.c
	g++ $(CFLAGS) -o $@ gasket.c $(LDFLAGS)

gasket2: gasket2.c
	g++ $(CFLAGS) -o $@ gasket2.c $(LDFLAGS)

gasket3: gasket.c
	g++ $(CFLAGS) -o $@ gasket3.c $(LDFLAGS)

linedrawing: lineDrawing.cc drawClass.cc
	g++ $(CFLAGS) -o $@ drawClass.cc lineDrawing.cc $(LDFLAGS)

clean:
	@rm -f testing linedrawing pick


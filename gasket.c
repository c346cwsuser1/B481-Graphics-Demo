/* two-dimensional Sierpinski gasket          */
/* generated using randomly selected vertices */
/* and bisection                              */

#include "opengl.h"
#include <stdlib.h>
#include <math.h>

/* you may have to change the include to <glut.h> or
elsewhere depending on where it is stored on your system */

/* glut.h usually has includes for gl.h and glu.h */

void myinit()
{

/* attributes */

      glClearColor(1.0, 1.0, 1.0, 1.0); /* white background */
      glColor3f(1.0, 0.0, 0.0); /* draw in red */

/* set up viewing */
/* 50.0 x 50.0 camera coordinate window with origin lower left */

      glMatrixMode(GL_PROJECTION);
      glLoadIdentity();
      gluOrtho2D(0.0, 50.0, 0.0, 50.0);
      glMatrixMode(GL_MODELVIEW);
}

void display()
{
    /* A triangle */
    GLfloat vertices[3][2]={{0.0,0.0},{25.0,50.0},{50.0,0.0}};

    int j, k;
    GLfloat p[2] ={7.5, 5.0};  /* arbitrary initial point inside triangle */
    glClear(GL_COLOR_BUFFER_BIT);  /*clear the window */
    glBegin(GL_POINTS);

/* compute and plot 5000 new points */

    for( k=0; k<5000; k++)
    {
         j=rand()%3; /* pick a vertex at random */

     /* compute point halfway between selected vertex and old point */

         p[0] = (p[0]+vertices[j][0])/2.0;
         p[1] = (p[1]+vertices[j][1])/2.0;

     /* plot new point */

         glVertex2fv(p);

    }
     glEnd();
     glFlush(); /* clear buffers */
 }

int main(int argc, char** argv)
{

/* standard GLUT initialization */

    glutInit(&argc,argv);
    glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB); /* default, not needed */
    glutInitWindowSize(500,500); /* 500 x 500 pixel window */
    glutInitWindowPosition(0,0); /* place window top left on display */
    glutCreateWindow("Sierpinski Gasket"); /* window title */
    glutDisplayFunc(display);
              /* display callback invoked when window opened */
    myinit(); /* set attributes */
    glutMainLoop(); /* enter event loop */
}

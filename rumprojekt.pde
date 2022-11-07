import peasy.*;

PImage globeimage;
PImage spaceimage;

Sphere earth;
Sphere space;
PeasyCam cam;
            
void setup() {
  fullScreen(P3D);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000000);
      
  globeimage = loadImage("earth.jpg");
  spaceimage= loadImage("space.jpg");

  earth = new Sphere(new PVector(0, 0, 0), 250, globeimage);
  space = new Sphere(new PVector(0, 0, 0), 192000, spaceimage);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1500);
  
}

void draw() {
  background(0);
  lights();
  
  earth.draw();
  space.draw(); 

  noLights();
}

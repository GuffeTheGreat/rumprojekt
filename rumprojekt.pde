

PImage globeimage;
PImage spaceimage;

Sphere earth;
Sphere space;

PVector camPos = new PVector(0, 9, 0);
PVector camDir = new PVector(0, 0, 0);
             
void setup() {
  fullScreen(P3D);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000000);
      
  globeimage = loadImage("earth.jpg");
  spaceimage= loadImage("space.jpg");

  earth = new Sphere(new PVector(0, 0, 0), 250, globeimage);
  space = new Sphere(new PVector(0, 0, 0), 192000, spaceimage);
}

void draw() {
  background(0);
  lights();
  
  float angle = map (mouseX, 
    0, width, 
    -PI, TWO_PI); 

  camPos = new PVector( 700 *  cos( angle ) + camDir.x, 
    map(mouseY, 0, height, -1333, 1333), 
    700 * sin( angle ) + camDir.z);

  camera( camPos.x, camPos.y, camPos.z, 
    camDir.x, camDir.y, camDir.z, 
    0, 1, 0);

  earth.draw();
  space.draw();

  camera();
  noLights();
}

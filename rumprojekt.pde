
PImage earth;

void setup() {
  size(1000, 500, P3D);
  
  
  earth = loadImage("earth.jpg");
  
}

void draw() {
  background(0);
  image(earth, 0, 0, width, height);
  
  
}


PImage earth;

void setup() {
  size(750, 750, P3D);
  
  
  earth = loadImage("earth.jpg");
  
}

void draw() {
  translate(375, 375, 0);
  background(0);
  sphere(250);
  image(earth, -375, -375, width, height);
  
  
}


PImage earthimage;
PImage space;
PShape earth;


void setup() {
  size(3840, 2160, P3D);
  background(0);
  earthimage = loadImage("earth.jpg");
  space = loadImage("space.jpg");
  
  earth = createShape(SPHERE, 250); 
  earth.setStroke(false);
  earth.setTexture(earthimage);

  

}

void draw() {
  translate(width/2, height/2); 
  shape(earth);
  noStroke();
  
  imageMode(CENTER);
  image(space, 0, 0, width, height);

}

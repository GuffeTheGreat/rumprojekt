PImage earthimage;
PImage space;
PShape earth;
        
void setup() {
  fullScreen(P3D);
  frameRate(500);
  background(0);
  earthimage = loadImage("earth.jpg");
  space = loadImage("space.jpg");
  earth = createShape(SPHERE, 250); 
  earth.setStroke(false);
  earth.setTexture(earthimage);
}

void draw() {
  translate(width/2, height/2);
  imageMode(CENTER);
  image(space, 0, 0, width, height);
  rotateY(frameCount/100.0);
  shape(earth);
}

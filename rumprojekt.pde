PImage earthimage;
PImage spaceimage;

PShape earth;
        
void setup() {
  fullScreen(P3D);
  
  earthimage = loadImage("earth.jpg");
  spaceimage = loadImage("space.jpg");
  
  earth = createShape(SPHERE, 250); 
  earth.setStroke(false);
  earth.setTexture(earthimage);
}

void draw() {
  translate(width/2, height/2);
  imageMode(CENTER);
  image(spaceimage, 0, 0, width, height);
  rotateY(frameCount/100.0);
  shape(earth);
}

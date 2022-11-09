class Sphere {

  PShape s;
  float m;
  PImage image;
  
  Sphere(float m, PImage image) {
      
    //Create Sphere and set Texture
    s = createShape(SPHERE, m); 
    s.setTexture(image);  
  }
  
  void draw() {
    shape(s);    
  } 
}

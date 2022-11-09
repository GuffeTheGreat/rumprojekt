class Sphere {

  PShape s;
  float m;
  PImage image;
  
  Sphere(float m_, PImage image_) {
    this.m = m_;
    this.image = image_;
    create();
  }
 
  void create() {
    lights();
    fill(255);
    s = createShape(SPHERE, this.m); 
    s.setStroke(false);
    s.setTexture(this.image);    
  }
  
  void draw() {
    shape(s);    
  }
  
}

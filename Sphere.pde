class Sphere extends Body3D {

  PShape s;
  
  Sphere(PVector pos_, float m_, PImage image_) {
    this.pos = pos_;
    this.m = m_;
    this.image = image_;
    create();
  }
 
  void create() {
    lights();
    fill(255);
    translate(pos.x, pos.y, pos.z);
    s = createShape(SPHERE, this.m); 
    s.setStroke(false);
    s.setTexture(this.image);    
  }
  
  void draw() {
    shape(s);    
  }
  
}

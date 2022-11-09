import peasy.*;

PImage globeimage;
PImage spaceimage;

PShape s;

Satellite ISS;

Sphere earth;
Sphere skybox;
PeasyCam cam;

JSONObject Satelite_ISS_data;
            
void setup() {
  fullScreen(P3D);
  frameRate(60);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000000);
  noStroke();

    // Load Models And Images
  s = loadShape("satellit.obj");
  globeimage = loadImage("earth.jpg");
  spaceimage= loadImage("space.jpg");

    // Create Spheres for Earth and Skybox
  earth = new Sphere(127.5/2, globeimage);
  skybox = new Sphere(192000, spaceimage);
  
    // Load Data and Create Satellite
  Satelite_ISS_data = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/30/20/&apiKey=2EJWFP-QSJ6BD-CQSJAX-4Y5R");
  ISS = new Satellite();
  ISS.setData(Satelite_ISS_data);
  
    // Create Cam
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1500); 
}

void draw() {
  lights();
  
    // Draw Earth and Skybox
  earth.draw();
  skybox.draw(); 
  
    // Display and Update Position for ISS
  ISS.display();
  ISS.update_pos();
  shape(s, 0, 0);
}

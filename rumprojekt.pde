import peasy.*;

PImage globeimage;
PImage spaceimage;

PShape s;
PShape s2;


Satellite Satellite_1;
Satellite Satellite_2;


Sphere earth;
Sphere skybox;
PeasyCam cam;


JSONObject Satelite_1_data;
JSONObject Satelite_2_data;
            
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
  Satelite_1_data = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/30/2/&apiKey=2EJWFP-QSJ6BD-CQSJAX-4Y5R");
  Satelite_2_data = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/36516/41.702/-76.014/30/2/&apiKey=2EJWFP-QSJ6BD-CQSJAX-4Y5R");
  
  Satellite_1 = new Satellite();
  Satellite_2 = new Satellite();
  
  Satellite_1.setData(Satelite_1_data);
  Satellite_2.setData(Satelite_2_data);

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
  

  // Display and Update Position for Satellites
  pushMatrix();
  Satellite_1.display(s);
  popMatrix();  
  pushMatrix();
  Satellite_2.display(s);
  popMatrix();

  noLights();
}

import peasy.*;

PImage globeimage;
PImage spaceimage;

Satellite test_satellite;

Sphere earth;
Sphere space;
PeasyCam cam;

JSONObject Satelite_1_data;

JSONArray Satelite_1_positions;

            
void setup() {
  fullScreen(P3D);
  
  frameRate(60);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000000);
  noStroke();

  
  Satelite_1_data = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/30/2/&apiKey=2EJWFP-QSJ6BD-CQSJAX-4Y5R");

      
      
  globeimage = loadImage("earth.jpg");
  spaceimage= loadImage("space.jpg");

  earth = new Sphere(127.5/2, globeimage);
  space = new Sphere(192000, spaceimage);
  test_satellite = new Satellite();
  
  test_satellite.setData(Satelite_1_data);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1500);
  
}

void draw() {
  background(0);
  lights();
  
  earth.draw();
  space.draw(); 
  test_satellite.display();

  noLights();
}

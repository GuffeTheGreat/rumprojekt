class Satellite{
  
  String name;
  float satlatitude;
  float satlongitude;
  float sataltitude;
  float azimuth;
  float elevation;
  float ra;
  float dec;
  int timestamp;
  boolean eclipsed;
  
    // Create Convert Function
  PVector convert(float lat, float lon, float h ) {
  float theta = radians(lat);
  float phi = radians(lon) + PI;

    // fix: in OpenGL, y & z axes are flipped from math notation of spherical coordinates
  float x = h * cos(theta) * cos(phi);
  float y = -h * sin(theta);
  float z = -h * cos(theta) * sin(phi);

  return new PVector(x, y, z);

}
  
    // Set Data
  void setData(JSONObject data){

   JSONArray positions = data.getJSONArray("positions");
   JSONObject info = data.getJSONObject("info"); 
   JSONObject pos_0 = positions.getJSONObject(0);

   this.name = info.getString("satname");
   this.satlatitude = pos_0.getFloat("satlatitude");
   this.satlongitude = pos_0.getFloat("satlongitude");
   this.sataltitude = (pos_0.getFloat("sataltitude")/1000.0) + 90.0;
   this.azimuth = pos_0.getFloat("azimuth");
   this.elevation = pos_0.getFloat("elevation");
   this.ra = pos_0.getFloat("ra");
   this.dec = pos_0.getFloat("dec");
   this.timestamp  = pos_0.getInt("timestamp"); 
     

   
  }

    // Display Satellite at Current Location
  void display(PShape shape){

    PVector location = convert(satlatitude,satlongitude,sataltitude);
    
    translate(location.x,location.y,location.z);
   
    shape(shape, 0, 0);

    displayText();
  }

  
void displayText(){
  textSize(10);
  fill(255);
  text("Name: " + name + "\n Time: " + timestamp + "\n Latitude: " + satlatitude + "\n Longitude: " + satlongitude + "\n Altitude: " + sataltitude, 0,0);
  } 
  
}

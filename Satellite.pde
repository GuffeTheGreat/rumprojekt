class Satellite{
  float satlatitude;
  float satlongitude;
  float sataltitude;
  float azimuth;
  float elevation;
  float ra;
  float dec;
  int timestamp;
  boolean eclipsed;
  
  
  PVector angle = new PVector(0,0,0);
  
  PVector convert(float lat, float lon, float h ) {
  float theta = radians(lat);
  float phi = radians(lon) + PI;

  // fix: in OpenGL, y & z axes are flipped from math notation of spherical coordinates
  float x = h * cos(theta) * cos(phi);
  float y = -h * sin(theta);
  float z = -h * cos(theta) * sin(phi);

  return new PVector(x, y, z);

}


  void setData(JSONObject data){
   JSONArray positions = data.getJSONArray("positions");
   JSONObject pos_0 = positions.getJSONObject(0);
   
   satlatitude = pos_0.getFloat("satlatitude");
   satlongitude = pos_0.getFloat("satlongitude");
   sataltitude = (pos_0.getFloat("sataltitude")/100.0) + 127.5/2;
   azimuth = pos_0.getFloat("azimuth");
   elevation = pos_0.getFloat("elevation");
   ra = pos_0.getFloat("ra");
   dec = pos_0.getFloat("dec");
   timestamp  = pos_0.getInt("timestamp"); 
    
  }





  void display(){
    satlatitude += 1.0;

    

    
    PVector location = convert(satlatitude,satlongitude,sataltitude);

    PVector target_angle = new PVector (
    atan(-location.x),
    atan(-location.y),
    atan(-location.z)
    );
    
    
    translate(location.x,location.y,location.z);
    rotateX(target_angle.x);
    rotateY(target_angle.y);
    rotateZ(target_angle.z);
    
    box(5);
//    shape(satellite_model,0,0);
  }

  
}

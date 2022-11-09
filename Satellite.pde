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
  PVector course;
  
  
  
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
   
   JSONObject pos_1 = positions.getJSONObject(1);
   
   satlatitude = pos_0.getFloat("satlatitude");
   satlongitude = pos_0.getFloat("satlongitude");
   sataltitude = (pos_0.getFloat("sataltitude")/100.0) + 127.5/2;
   azimuth = pos_0.getFloat("azimuth");
   elevation = pos_0.getFloat("elevation");
   ra = pos_0.getFloat("ra");
   dec = pos_0.getFloat("dec");
   timestamp  = pos_0.getInt("timestamp"); 
   
   
   course = new PVector(
   (pos_1.getFloat("satlatitude") - satlongitude),
   (pos_1.getFloat("satlongitude") - satlatitude)
   );
   
   
  }


  void update_pos(){
    satlatitude += course.x * 10;
    satlongitude += course.y * 10;
    
  }


  void display(){
    
  

    
    PVector location = convert(satlatitude,satlongitude,sataltitude);

    PVector target_angle = new PVector (
    atan(-location.x),
    atan(-location.y),
    atan(-location.z)
    );
    
    float rot_offset = 0.7853981634;
    translate(location.x,location.y,location.z);
    rotateX(target_angle.x - rot_offset);
    rotateY(target_angle.y - rot_offset);
    rotateZ(target_angle.z - rot_offset);

  }
  
}

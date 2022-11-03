class Body3D {
  PVector pos;
  PVector vel = new PVector(0, 0, 0);
  PVector acc = new PVector(0, 0, 0);

  float m;
  PImage image;

  void applyAcc(PVector acc_) {
    acc = acc.add(acc_);
  }

  void update() {
    vel = vel.add(acc);
    pos = pos.add(vel);
    acc = new PVector(0, 0, 0);
  }
}

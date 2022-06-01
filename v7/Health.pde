class Health {
  int amt;
  Square pos;
  int x, y;
  boolean received;
  PImage ptr = loadImage("pointer.png");
  PImage heart = loadImage("heart.png");
  boolean selected;
  
  public Health(Square pos, int x, int y, int amt){
    this.pos = pos;
    this.x = x;
    this.y = y;
    this.amt = amt;
  }
  
  void draw() {
    if (received == false) {
      //fill(0, 255, 0);
      //noStroke();
      //ellipse(x, y, 10, 10);
      image(heart, x, y);
      if (abs(p.x - x) <= 10) {selected = true; image(ptr, x-5, y-15);}
      else selected = false;
    }
    if (selected == true) {
      this.keyPressed();
    }
  }
  
  void keyPressed() {
    if (selected && !received) {
      if (key == ' ') {
        p.health += amt;
        p.health = min(p.health, 100);
        this.received = true;
      }
    }
  }
  
  
}

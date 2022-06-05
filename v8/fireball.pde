class fireball{
  int direction;
  PImage[] fireballgif; 
  float x, y, dx, dy;
  float currentFrame;
  int t1;
  
  public fireball(){
    fireballgif = new PImage[5];
    for(int i = 0; i < fireballgif.length; i++){
      fireballgif[i] = loadImage("fireball" + i + ".png");
    }
    
    direction = int(random(4));
    currentFrame = 0;
    if (direction == 0){
      y = 0;
      x = random(400);
      dy = 3;
      dx = 0;
    }
    else if (direction == 1){
      y = random(400);
      x = 0;
      dy = 0;
      dx = 3;
    }
    else if (direction == 2){
      y = 400;
      x = random(400);
      dy = -3;
      dx = 0;
    }
    else{
      y = random(400);
      x = 400;
      dy = 0;
      dx = -3;
    }
  }
  
  void draw() {
    pushMatrix();
    translate(x, y);
    if (direction == 1){
      rotate(PI/2.0);
    }
    else if (direction == 0){
      rotate(PI);
    }
    else if (direction == 3){
      rotate(3 * PI/2.0);
    }
    image(fireballgif[int(currentFrame)], 0, 0);
    popMatrix();
    damage();
  }
  
  void update() {
    currentFrame = (currentFrame+0.2) % 5;
    x+=dx;
    y+=dy;
  }
  
  void damage() {
   if (t1 >= 10 && abs(p.x - x) <= 15 && abs(p.y - y) <= 15) {
      p.health -= 10;
      t1 = 0;
    }
    t1++;
  }
  
}//end of class

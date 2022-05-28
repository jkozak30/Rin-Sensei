class fireball{
  int direction;
  float x, y, dx, dy;
  float currentFrame;
  
  public fireball(){
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
  }
  
  void update() {
    currentFrame = (currentFrame+0.2) % 5;
    x+=dx;
    y+=dy;
  }
}

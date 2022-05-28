PImage[] fireballgif = new PImage[5];
float currentFrame = 0;
int t = 0;
fireball[] projectiles = new fireball[60];

void setup(){
  size(400, 400);
  for(int i = 0; i < fireballgif.length; i++){
    fireballgif[i] = loadImage("fireball" + i + ".png");
  }
}

void draw(){
  background(0);
  int x = 30;
  if (t < 1800){
    if (t%x == 0) {
      projectiles[t/x] = new fireball();
    }
    for (int i = 0; i < t/x; i++){
      projectiles[i].draw();
      projectiles[i].update();
    }
    t++;
  }
}

Maze m;
Player p;
PImage bg; 
Weapon w;
boolean start;

void setup() {
  size(400, 400);
  m = new Maze(6, 6);
  p = new Player(m.grid);
  w = new Weapon(loadImage("weapon.png"), 20, 2);
  //w = new Weapon(loadImage("staff.png"), 20, -2);
  //w = new Weapon(loadImage("axe.png"), 20, 2);
  m.mazeify();
  p.weapon = w;
  //System.out.println(m.mazeString());
  bg = loadImage("background.png");
  start = false; 
}

void draw() {
  if (!start) {
    background(bg);
    fill(255);
    text("WELCOME TO (title)", 200, 180);
    text("Use WASD or arrow keys to move", 200, 220);
    text("Press space to dash", 200, 250);
    text("Press u to attack", 200, 280);
    text("PRESS ENTER TO START", 200, 330);
    
    textAlign(CENTER);
    
  }
  else {
    //background(80, 100, 200);
    background(bg);
    p.update();
    p.draw();
    m.draw();
  }
}

void mousePressed() {
}

void keyPressed() {
  if (key == ENTER) {start = true;}
  if (key == 'w' || keyCode == UP) { p.dy = -3; /*p.y-=5;*/ }
  if (key == 'd' || keyCode == RIGHT) { p.dx = 3; p.right = true;}
  if (key == 's' || keyCode == DOWN) { p.dy = 3; }
  if (key == 'a' || keyCode == LEFT) { p.dx = -3; p.right = false;}
  if (key == ' ' && p.t > p.cooldown ) { p.t = 0; }
  //((ShopRoom)m.grid[2][2]).keyPressed(); this was dumb.
}

void keyReleased() {
  if (key == 'w' || keyCode == UP) { p.dy = 0; }
  if (key == 'd' || keyCode == RIGHT) { p.dx = 0; }
  if (key == 's' || keyCode == DOWN) { p.dy = 0; }
  if (key == 'a' || keyCode == LEFT) { p.dx = 0; }
}

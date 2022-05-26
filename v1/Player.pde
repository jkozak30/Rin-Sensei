class Player {
  int health;
  int points;
  int attack;
  int r, c;
  Square pos;
  Square[][] grid;
  int x, y, dx, dy;
  
  
  public Player(Square[][] grid){
    r = 0;
    c = 0;
    this.grid = grid;
    pos = grid[0][0];
    x = y = width/2;
    dx = dy = 0;
  }
  
  boolean moveSq(int kp) {
    if (!pos.walls[kp]) {
      if (kp == 0) r -= 1; pos = grid[r][c];
      if (kp == 1) c += 1; pos = grid[r][c];
      if (kp == 2) r += 1; pos = grid[r][c];
      if (kp == 3) c -= 1; pos = grid[r][c];
      return true;
    } return false;
  }
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void draw() {
    stroke(255);
    strokeWeight(3);
    if (pos.walls[0]) {line(1, 1, width-1, 1);}
    if (pos.walls[1]) {line(width-1, 1, width-1, height-1);}
    if (pos.walls[2]) {line(width-1, height-1, 1, height-1);}
    if (pos.walls[3]) {line(1, height-1, 1, 1);}
    pos.draw();
    noStroke();
    fill(30, 30, 100);
    ellipse(x, y, 10, 10);
  }
  
  void update() {
    if (y < 5) {
      if (moveSq(0)) { y = height-5; }
      else { dy = 0; y++; }
    }
    if (x > width-5) {
      if (moveSq(1)) { x = 5; }
      else {dx = 0; x--; }
    }
    if (y > height-5) {
      if (moveSq(2)) { y = 5; }
      else {dy = 0; y--;}
    }
    if (x < 5) {
      if (moveSq(3)) { x = width-5; }
      else {dx = 0; x++;}
    }
    x += dx;
    y += dy;
  }
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
}

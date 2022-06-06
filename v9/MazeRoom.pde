class MazeRoom extends Square {
  Maze m1;
  color c = color(100, 200, 0);
  public MazeRoom(int r, int c) {
    super(r, c);
    this.hps = null;
    m1 = new Maze(10, 10, true);
    m1.mazeify();
  }
  
  void draw() {
    stroke(c);
    strokeWeight(4);
    //print(m1);
    for(int r=0; r<m1.grid.length; r++) {
      for (int c=0; c<m1.grid[0].length; c++) {
        m1.grid[r][c].cDraw(p, 40, -1200, 4, true);
      }
    }
    move();
  }
  
  void move() {
    int left = 0; for (int i = p.y-5; i<=p.y+5; i++) {if (get(p.x+10, i) == c) {left++;}}
    int right = 0; for (int i = p.y-5; i<=p.y+5; i++) {if (get(p.x-10, i) == c) {right++;}}
    if (p.dx > 0 && left > 0) {p.dx = 0; p.x -=3;}
    if (p.dx < 0 && right > 0) {p.dx = 0; p.x +=3;}
    if (p.dy > 0 && get(p.x, p.y+10) == c) {p.dy = 0; p.y -=3;}
    if (p.dy < 0 && get(p.x, p.y-10) == c) {p.dy = 0; p.y +=3;}
  }
  
  
}

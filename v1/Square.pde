class Square {
  int r, c;
  //Square[] neighbors;
  boolean isVisited;
  boolean[] walls = { true, true, true, true }; //cw from top

  public Square(int r, int c) {
    this.r = r;
    this.c = c;
    isVisited = false;
  }

  // returns random neighbor of this sq if one exists
  // else returns null
  public Square pickNeighbor(Square[][] grid) {
    ArrayList<Square> neighbors = new ArrayList<Square>();
    if (this.r > 0 && grid[r-1][c].isVisited == false) { neighbors.add(grid[r-1][c]); }
    if (this.c < grid[0].length-1 && grid[r][c+1].isVisited == false) { neighbors.add(grid[r][c+1]); }
    if (this.r < grid.length-1 && grid[r+1][c].isVisited == false) { neighbors.add(grid[r+1][c]); }
    if (this.c > 0 && grid[r][c-1].isVisited == false) { neighbors.add(grid[r][c-1]); }

    if (neighbors.size() == 0) return null;
    else {
      int rand = (int)(Math.random() * neighbors.size());
      return neighbors.get(rand);
    }
  }
    
  void draw(Player player) {
    int wid = 6;
    int xOffset = 263;
    int yOffset = 0;
    int x = c*wid + xOffset;
    int y = r*wid + yOffset;
    if (player.r == this.r && player.c == this.c) {fill(255, 0, 0);}
    else {fill(0);}
    noStroke();
    rect(x, y, wid, wid);
    stroke(255);
    if (walls[0]) {
      line(x, y, x+wid, y);
    }
    if (walls[1]) {
      line(x+wid, y, x+wid, y+wid);
    }
    if (walls[2]) {
      line(x+wid, y+wid, x, y+wid);
    }
    if (walls[3]) {
      line(x, y+wid, x, y);
    }
  }

}

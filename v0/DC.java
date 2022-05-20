public class DC {

  Square[][] grid;

  public DC(int rows, int cols) {
    grid = new Square[rows][cols];
    for (int r=0; r<rows; r++) {
      for (inr c=0; c<cols; c++) {
        Square temp = new Square(r, c);
        grid[r][c] = temp;
      }
    }
    for (int r=0; r<rows; r++) {
      for (inr c=0; c<cols; c++) {
        grid[r][c].addNeighbors();
      }
    }
  }

  public String mazeString() {

  }



  class Square {
    int r, c;
    Square[] neighbors;
    boolean isVisited;

    public Square(int r, int c) {
      this.r = r;
      this.c = c;
      isVisited = false;
    }

    public void addNeighbors() {
      // add neighbors to neighbors
    }


  }


}

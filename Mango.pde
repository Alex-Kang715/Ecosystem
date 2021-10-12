public class Mango /*implements Food*/ {
  public PVector pos;
  public final int SIZE = 10;
  public final color COLOR = color(250, 150, 30);
  public int health = (int)random(1, 5);
  public boolean active = true;

  public Mango(int x, int y) {
    pos = new PVector(x, y);
  }

  public void show() {
    fill(COLOR);
    circle(pos.x, pos.y, SIZE);
  }
}

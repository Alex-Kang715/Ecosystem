public class Blob {
  private PVector pos, acc, vel;
  private int hp = 25, energy = 50, speed = 5;
  private final color COLOR = color(95, 190, 227);
  private final int SIZE = 20;
  public int collisions = 0;

  public Blob(int x, int y) {
    pos = new PVector(x, y);
  }

  private void show() {
    fill(COLOR);
    circle(pos.x, pos.y, SIZE);
  }
  private void move() {
    vel = PVector.random2D().mult(speed);
    pos.add(vel);
  }

  private void collideWorldBounds() {
    if (pos.y >= height-MARGIN) {
      pos.add(0, -speed-SIZE);
      collisions++;
    }
    if (pos.y <= 0+MARGIN) {
      pos.add(0, speed+SIZE);
      collisions++;
    }
    if (pos.x >= width-MARGIN) {
      pos.add(-speed-SIZE, 0);
      collisions++;
    }
    if (pos.x <= 0+MARGIN) {
      pos.add(speed+SIZE, 0);
      collisions++;
    }
  }
 private void eat(Mango f){
 if(dist(pos.x,pos.y, f.pos.x, f.pos.y)<1)
   f.active = false;
 }
}

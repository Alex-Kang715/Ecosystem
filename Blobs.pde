
public class Blob {
  private PVector pos, acc, vel;
  private int hp = 25, speed = 1, dead = 0;
  private float  energy = 1000;
  private final color COLOR = color(95, 190, 227);
  private final int SIZE = 20;
  public int collisions = 0, eaten = 0;
  public boolean alive = true;

  public Blob(int x, int y) {
    pos = new PVector(x, y);
  }

  private void show() {
    fill(COLOR);
    circle(pos.x, pos.y, SIZE+eaten/200);
  }
  private void move(Mango m) {
    vel = PVector.sub(m.pos,this.pos).limit(speed);
    pos.add(vel);
    energy -= 1;
  }

  private void die() {
    if (energy <= 0) {
      this.alive=false;
      dead ++;
    }
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
  private void eat(Mango f) {
    double dist = PVector.sub(pos, f.pos).mag();
    if (dist<SIZE/2 + f.SIZE/2) {
      f.active = false;
      eaten ++;
      mangos.remove(f);
      energy += 100;
      Mango b = new Mango((int)(Math.random()*(width-2*MARGIN) + MARGIN), (int)(Math.random()*(height-2*MARGIN))+MARGIN);
      mangos.add(b);
    }
  }

  private int NearestFood(ArrayList <Mango> f) {
    int currentMin = 100000;
    int indexMin = -1;
    for (int i = 0; i<f.size(); i++) {
      float dist = PVector.sub(pos, f.get(i).pos).mag();

      if (dist<=currentMin) {
        currentMin = (int)dist;
        indexMin = i;
      }
    }
    return indexMin;
  }
}

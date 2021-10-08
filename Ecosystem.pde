ArrayList<Blob> blobs = new ArrayList<Blob>(30);
ArrayList<Mango> mangos = new ArrayList<Mango>(30);
public final int MARGIN = 40;

public void setup() {
  size(800, 800);
  spawnBlobs();
  spawnMangos();
}



public void draw() {
  background(150, 200, 50);
  for (int i = 0; i < blobs.size(); i++) {
    blobs.get(i).show();
    blobs.get(i).move();
    blobs.get(i).collideWorldBounds();
    System.out.print(blobs.get(1).collisions + ": ");
  }
  for (int i = 0; i < mangos.size(); i++) {
    mangos.get(i).show();
  }
}

private void spawnBlobs() {
  for (int i = 0; i < 30; i++) {
    Blob b = new Blob((int)(Math.random()*width), (int)(Math.random()*height));
    blobs.add(b);
  }
}
private void spawnMangos() {
  for (int i = 0; i < 30; i++) {
    Mango b = new Mango((int)(Math.random()*(width-2*MARGIN) + MARGIN), (int)(Math.random()*(height-2*MARGIN))+MARGIN);
    mangos.add(b);
  }
}

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
  for (int j = 0; j < mangos.size(); j++) {
    if (mangos.get(j).active == true) {
      mangos.get(j).show();
      //println(mangos.get(j).active);

      for (int i = 0; i < blobs.size(); i++) {
        blobs.get(i).die();
        if (blobs.get(i).alive == true) {
          blobs.get(i).move();
          blobs.get(i).collideWorldBounds();
          if (mangos.get(j).active==true) {
            blobs.get(i).eat(mangos.get(j));
          }
        }
      }
      //System.out.print(blobs.get(1).eaten + ": ");
    }
  }

  for (int i = 0; i < blobs.size(); i++) {
    if (blobs.get(i).alive == true) {
      blobs.get(i).show();
    }
  }
}


private void spawnBlobs() {
  for (int i = 0; i < 10; i++) {
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

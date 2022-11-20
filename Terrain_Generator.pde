int cols, rows;
int scl = 20;
int w = 2600;
int h = 1400;

float[][] terrain;
float flying = 0;

void setup() {
  size(1600, 600, P3D);
  
  cols = w / scl;
  rows = h / scl;
  
  terrain = new float[cols][rows];
  
  float yoff = 0;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100); 
      xoff += 0.1;
    }
    yoff += 0.1;
  }
}

void draw(){
  flying -= 0.02;
   float yoff = flying;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -400, 400); 
      xoff += 0.06;
    }
    yoff += 0.06;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI / 3);
  
  translate(-w/2, -h/2);
  
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      //rect(x * scl, y *scl, scl, scl);
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y+1]);
    }
    endShape();
  }
}

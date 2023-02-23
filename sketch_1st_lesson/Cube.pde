class Cube
{
 float size;
 float speed;
 color c;
 PVector pos;
 float theta;
 
 Cube()
 {
  this(100,0,color(255,255,255), width / 2, height / 2); 
 }
 
 Cube(float size, float speed, color c, float x, float y)
 {
   this.size = size; // Disambiguation
   this.speed = speed;
   this.c = c;
   theta = 0;
   this.pos = new PVector(x,y);
 }
 
 void update()
 {
   theta += speed;
 }
 
 
 void render()
 {
  pushMatrix();
  noFill();
  strokeWeight(4);
  stroke(c);
  translate(pos.x, pos.y);
  rotateZ(theta);
  rotateX(theta);
  sphere(size); 
  popMatrix();
 }
}

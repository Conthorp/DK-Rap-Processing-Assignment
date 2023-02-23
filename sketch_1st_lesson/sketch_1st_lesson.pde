import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

ArrayList<Cube> cubes = new ArrayList<Cube>();

int numCubes = 0;

void keyPressed()
{
 if(key > '0' && key < '9')
 {
   numCubes= key - '0';
   makeCubes(numCubes);
 }
}

void makeCubes(int count)
{
  cubes.clear();
  float halfW = width / 2;
  float halfH = height / 2;
  float radius = 300;
  
 for(int i = 0; i < count; i++)
 {
  float theta = map(i,0, count, 0, TWO_PI);
  float x = halfW + sin(theta) * radius;
  float y = halfH - cos(theta) * radius;
  Cube cube = new Cube(0,0,0, x, y);
  cubes.add(cube);
 }
}

void setup()
{
 fullScreen(P3D,SPAN); 
 
 cube = new Cube(200,0.1f,color(100,255,255), width / 2, height / 2);
 //cube1 = new Cube(50,0.1f,color(100,255,255), width / 4, height / 4);
 colorMode(HSB);
 
 minim = new Minim(this);
ai = minim.getLineIn(Minim.MONO, 512, 44100, 16);
ap = minim.loadFile("Y2Mate.is - Donkey Kong 64 (N64) - DK Rap Introduction-npuuTBlEb1U-160k-1656653848268.mp3",512);
ap.play();
ab = ap.mix;
}

float theta;
Cube cube;
Cube cube1;
Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;

float average;
float lerpedAverage = 0;

void draw()
{
  rotateX(lerpedAverage);
  float total = 0;
  for(int i = 0; i < ab.size(); i++)
  {
    total += (ab.get(i));
  }
  
  average = total / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  background(0);
  lights();
for(int i = 0; i < cubes.size() ; i ++)
{
  Cube cube = cubes.get(i);
  cube.c = color(map(lerpedAverage, 0.0f, 1.0f, 0,255), 255, 255);
  cube.speed = map(lerpedAverage, 0.0f, 1.0f, 0,0.2);
  cube.size = map(lerpedAverage, 0,1, 200,1000);
  cube.update();
  cube.render();
}
  //cube1.update();
  //cube1.render();
  
}

float x = 150, y = 450;
float bulletx = 150;
float bullety = 425;
ArrayList<Alien> aliens;
boolean left, right;
PImage gun;
PImage shield;
PImage bullet;
PImage Alien1;
PImage Alien2;
PImage Alien3;
int shieldlife1 = 3;
int shieldlife2 = 3;
int shieldlife3 = 3;
int shieldlife4 = 3;
int gunlife = 3;
void setup() {
  size(500, 500);
  bullet = loadImage("http://i.imgur.com/MCAAOV8.png");
  gun = loadImage("http://i.imgur.com/JMAT2Jh.png");
  shield = loadImage("http://i.imgur.com/j9mgA2O.png");
  Alien1 = loadImage("http://i.imgur.com/GPzyM8k.png");
  Alien2 = loadImage("http://i.imgur.com/fBcIsSb.png");
  Alien3 = loadImage("http://i.imgur.com/PV7FgYj.png");
  aliens = new ArrayList<Alien>();
  int alienx=88;
  for (int i = 0; i < 10; i++) {
    aliens.add(new Alien(alienx, 50, Alien1));
    aliens.add(new Alien(alienx, 100, Alien2));
    aliens.add(new Alien(alienx, 150, Alien3));
    alienx+=34;
  }
}
void draw() {
  background(0, 5, 0);
  bullety-=5;
  pushMatrix();
  translate(bulletx, bullety);
  scale( 3, 3 );
  image(bullet, 0, 0);
  popMatrix();
  pushMatrix();
  translate(x, y); //set position of image  rotate( PI / 2 );  //PI/2 is 90 degrees, PI is 180 degrees, 2*PI is 360
  scale( 3, 3 );
  imageMode(CENTER);
  image( gun, 0, 0 );
  popMatrix();
  if ( left ) x -= 2.5 ;
  if ( right ) x += 2.5;
  if (x<95)x=95;
  if (x>410) x=410;  
  for (int i = 0; i < 4; i++) {
    pushMatrix();
    translate(100 + i * 100, 400);
    scale(3.5, 3.5);
    image(shield, 0, 0);
    popMatrix();
  }
  if ( dist( bulletx, bullety, 100, 400 ) < 50 ) {
    shieldlife1-=1;
  }
  if ( dist( bulletx, bullety, 200, 400 ) < 50 ) {
    shieldlife2-=1;
  }
  if ( dist( bulletx, bullety, 300, 400 ) < 50 ) {
    shieldlife3-=1;
  }
  if ( dist( bulletx, bullety, 400, 400 ) < 50 ) {
    shieldlife4-=1;
  }
  for (int i = 0; i < aliens.size (); i++) {
    Alien alien = aliens.get(i);
    alien.move();
    alien.display();
    if (alien.x -25 <= bulletx && bulletx <= alien.x + 25 && alien.y <= bullety && bullety < alien.y + 12) {
      aliens.remove(i);
      i--;
      bulletx = 10000;
      bullety = 10000;
    }
  }
  if (bullety<=400 && ((80 <= bulletx && bulletx <= 130)|| (180 <= bulletx && bulletx <= 230) || (280 <= bulletx && bulletx <= 330) || (380 <= bulletx && bulletx <= 430))) {
    bulletx = 10000;
    bullety = 10000;
  }
}

void keyPressed() {
  if (key=='a') left = true;
  if (key=='d') right = true;
  if (key == ' ') {
    bulletx = x;
    bullety = y;
  }
}
void keyReleased() {
  if (key=='a') left = false;
  if (key=='d') right = false;
}

class Alien {
  float x;
  float y;
  PImage alienImage;

  Alien(float xx, float yy, PImage image) {
    x = xx;
    y = yy;
    alienImage = image;
  }
  void display() {

    pushMatrix();
    translate(x, y); //set position of image  rotate( PI / 2 );  //PI/2 is 90 degrees, PI is 180 degrees, 2*PI is 360
    scale( 2.5, 2.5 );
    imageMode(CENTER);
    image( alienImage, 0, 0 );
    popMatrix();
  }

  void move() {
    if (frameCount % 360 >= 0 && frameCount % 360 < 30) {
      x++;
    }
    if (frameCount % 360 >= 90 && frameCount % 360 < 120) {
      y++;
    }
    if (frameCount % 360 >= 180 && frameCount % 360 < 210) {
      x--;
    }
    if (frameCount % 360 >= 270 && frameCount % 360 < 300 ) {
      y++;
    }
  }
} 
void move() {
  y++;
}


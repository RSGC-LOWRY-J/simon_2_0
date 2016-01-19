//simon with new code

import processing.sound.*;    //Import sound library


//SoundFile q;      //Gives sounds names
//SoundFile w;
//SoundFile a;
//SoundFile s;

int round = 1;    //Variable for rounds

boolean win = false;

boolean grn = false;
boolean red = false;
boolean ylw = false;
boolean blu = false;

ArrayList<Integer> game;

//Setup - Runs once at the start
void setup() {

  win = false;

  game = new ArrayList<Integer>();

  frameRate(60);

  size(700, 700);           //Canvas size
  background(0);            //Background colour

  //q = new SoundFile(this, "q.mp3");                //Declares hitsounds as soundfiles
  //w = new SoundFile(this, "w.mp3");
  //a = new SoundFile(this, "a.mp3");
  //s = new SoundFile(this, "s.mp3");

  fill(0, 255, 0);                                  //Draw 4 coloured squares
  quad(0, 0, 350, 0, 350, 350, 0, 350);             //}
  fill(255, 0, 0);                                  //}
  quad(350, 0, 700, 0, 750, 350, 350, 350);        //}
  fill(255, 243, 3);                               //}
  quad(0, 350, 350, 350, 350, 700, 0, 700);        //}
  fill(0, 0, 255);                                  //}
  quad(350, 350, 700, 350, 700, 700, 350, 700);     //}
}

//Draw - Happens every frame
void draw() {

  fill(0);
  quad(600, 50, 640, 50, 640, 70, 600, 70);
  textSize(10);
  fill(255);
  text (mouseX + " X", 600, 60);
  text (mouseY + " Y", 600, 70);

  fill(0);
  quad(300, 330, 400, 330, 400, 360, 300, 360);
  fill(255);
  textSize(16);
  text ("Round " + round, 315, 350);
}

//What happens when you click the mouse?
void mousePressed() {

  if (mouseX > -10 && mouseX < 350 && mouseY > -10 && mouseY < 350) {
    grnplay();
  }
  if (mouseX > 350 && mouseX < 700 && mouseY > -10 && mouseY < 350) {
    redplay();
  }
  if (mouseX > -10 && mouseX < 350 && mouseY > 350 && mouseY < 700) {
    ylwplay();
  }
  if (mouseX > 350 && mouseX < 700 && mouseY > 350 && mouseY < 700) {
    bluplay();
  }
}

//What happens when you release the mouse?
void mouseReleased() {

  if (mouseX > -10 && mouseX < 350 && mouseY > -10 && mouseY < 350) {
    fill(0, 255, 0);
    quad(0, 0, 350, 0, 350, 350, 0, 350);
    grn = false;
  }
  if (mouseX > 350 && mouseX < 700 && mouseY > -10 && mouseY < 350) {
    fill(255, 0, 0);
    quad(350, 0, 700, 0, 750, 350, 350, 350);
    red = false;
  }
  if (mouseX > -10 && mouseX < 350 && mouseY > 350 && mouseY < 700) {
    fill(255, 243, 3);
    quad(0, 350, 350, 350, 350, 700, 0, 700);
    ylw = false;
  }
  if (mouseX > 350 && mouseX < 700 && mouseY > 350 && mouseY < 700) {
    fill(0, 0, 255);
    quad(350, 350, 700, 350, 700, 700, 350, 700);
    blu = false;
  }
}
void keyPressed() {
  if (key == ' ') {
    win = true;
  }
  if (key == 'q') {
    gamestart();
  }

  //Makes the game run
  //void gamestart() {
  //  Simon = new ArrayList<Integer>();
  //  for (int i = 0; i < round; i++)
  //  {
  //    game.add(int(random(1, 5)));
  //  }  
  //  for (int i = 0; i < game.size(); i++)
  //    if (Simon.get(i) == 1)
  //    {
  //      grnplay();
  //    } else if (Simon.get(i) == 2) {
  //      redplay();
  //    } else if (Simon.get(i) == 3) {
  //      ylwplay();
  //    } else if (Simon.get(i) == 4) {
  //      bluplay();   
  //    }

  if (win == true) {
    round = round + 1;
  }
} 

void gamestart() {

  game = new ArrayList<Integer>();
  for (int i = 0; i < round; i++)
  {
    game.add(int(random(1, 4)));
  }
  for (int i = 0; i < game.size(); i++) {

    if (game.get(i) == 1) {
      grnplay();
    }
    if (game.get(i) == 2) {
      redplay();
    }
    if (game.get(i) == 3) {
      ylwplay();
    }
    if (game.get(i) == 4) {
      bluplay();
    }
  }
}


//The buttons themselves
void grnplay() {
  fill(164, 242, 170);
  quad(0, 0, 350, 0, 350, 350, 0, 350);
  fill(0);
  textSize(90);
  text("Green", 50, 170);
}
void redplay() {
  fill(242, 164, 166);
  quad(350, 0, 700, 0, 750, 350, 350, 350);
  fill(0);
  textSize(90);
  text("Red", 450, 170);
}
void ylwplay() {
  fill(241, 242, 164);
  quad(0, 350, 350, 350, 350, 700, 0, 700);
  fill(0);
  textSize(90);
  text("Yellow", 50, 550);
}
void bluplay() {
  fill( 175, 164, 242);
  quad(350, 350, 700, 350, 700, 700, 350, 700);
  fill(0);
  textSize(90);
  text("Blue", 450, 550);
}
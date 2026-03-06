VirtualPet myPet;

Button feedButton;
Button playButton;
Button beatButton;
PImage img;
import processing.sound.*;
SoundFile file;
// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 2000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
int lastHit = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 16, true));

  myPet = new VirtualPet("Malti");
  img = loadImage("hit.png");
  file = new SoundFile(this, "minecrafthit.mp3");

  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 100, 430, 120, 45);
  playButton = new Button("Play", 250, 430, 120, 45);
  beatButton = new Button("Beat", 400, 430, 120, 45);
}

void draw() {
 noTint();
  background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  playButton.display();
  beatButton.display();
  drawMessage();
  
  int transparency = 255 + ((lastHit - millis()) / 1);
  tint(255, transparency);
  image(img, 0, 0, width, height);
}

void mousePressed() {
  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Lotus Ice Cream", 3, 2, 2);
    myPet.feed(f);
    showMessage(f.getName() + " eaten!");
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = new Game("Coin Toss", 2, 1);
    myPet.play(g);
    showMessage(g.getName() + " played!");
  }
   if (beatButton.isClicked(mouseX, mouseY)) {
    Beat b = new Beat("Beat", 3, 3);
    myPet.beatIt(b);
    file.play();
    lastHit = millis();
    showMessage(b.getName() + " Malti");
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}

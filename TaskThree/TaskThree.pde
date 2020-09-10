color r = color(255, 0, 0);
color y = color(255, 255, 0);
color g = color(0, 128, 0);
color b = color(150);

void setup() {
  size(500, 500);
  background(b);
  smooth();
}

void draw() {
  rectMode(CORNER);
  fill(0);
  rect(25, 25, 100, 320);
  ellipseMode(CENTER);
  fill(255, 0, 0, 50);
  ellipse(75, 75, 100, 100);
  fill(255, 255, 0, 50);
  ellipse(75, 185, 100, 100);
  fill(0, 255, 0, 50);
  ellipse(75, 295, 100, 100);

  if (mouseX > 25 && mouseX < 125 && mouseY > 25 && mouseY < 125) {
    //if (keyPressed = "r"){
    fill(255, 0, 0);
    ellipse(75, 75, 100, 100);
  } else if (mouseX > 25 && mouseX < 125 && mouseY > 135 && mouseY < 235) {
    fill(255, 240, 0);
    ellipse(75, 185, 100, 100);
  } else if (mouseX > 25 && mouseX < 125 && mouseY > 245 && mouseY < 345) {
    fill(0, 255, 0);
    ellipse(75, 295, 100, 100);
  }
}

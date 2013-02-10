class Butterfly {
  color fillColor, baseColor;
  PVector position;
  float randomMoveDelta = 100;

  Butterfly() {
    this(width / 2, height / 2);
  }

  Butterfly(float x, float y) {
    position = new PVector(x, y);

    int r = round(random(102, 232));
    int g = round(random(232, 255));
    int b = round(random(232, 255));

    baseColor = color(r, g, b, random(50, 80));
    fillColor = color(r, g, b, random(70, 80));
    randomMove();
    randomMove();
  }

  void moveTo(float x, float y) {
    if (x > width) x = width;
    if (x < 0) x = 0;
    if (y > height) y = height;
    if (y < 0) y = 0;

    noStroke();
    fill(fillColor);
    float randomCurve = 2000;
    curve(position.x + random(-randomCurve, randomCurve),
          position.y + random(-randomCurve, randomCurve),
          position.x, position.y, x, y,
          x + random(-randomCurve, randomCurve),
          y + random(-randomCurve, randomCurve));
    stroke(255);
    fill(255);
    ellipse(x, y, 2, 2);
    position.set(x, y, 0);
  }

  void randomMove() {
    randomMoveDelta = random(10, 15);
    moveTo(position.x + random(-randomMoveDelta, randomMoveDelta),
           position.y + random(-randomMoveDelta, randomMoveDelta));
  }
}

void setup() {
  size(screen.width, screen.height);
  background(255);
}

void draw() {
  fill(51, 51, 51, 10);
  noStroke();
  rect(0, 0, width, height);
  new Butterfly(mouseX, mouseY);
}
String name = "Mathias";
int age = 24;
String mood = "true";
boolean happy = boolean(mood);

void setup() {
}
void draw() {
  println("Hi, my name is " + name);
  println("I am " + age + "years old");
  if (!happy) {
    println("I am happy");
  } else {
    println("I clap my hands");
  }
}

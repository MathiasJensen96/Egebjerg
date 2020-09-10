int input = 40;
int half = input/2;

for (input = 40; input > 0; input--) {
  if (input == 6) {
    println("six");
  } else if (input == half) {
    println("HALF");
  } else {
    println(input);
  }
}

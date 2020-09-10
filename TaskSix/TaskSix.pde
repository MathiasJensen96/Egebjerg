int a;
int b;
int x;
int y;
int z;


for (a = 0, b = 0; a <= 10 && b <= 10; a++, b++) {
  if (a == 10 || b == 10 ||  a+b == 10) {
    println("Success!");
  } else {
    println("Failure!");
  }
}
for (x = 0, y = 0, z = 0; x < 30 && y < 30 && z < 30; x++, y++, z++) {
  if (x+y+z == 30) {
    println("Success!");
  } else {
    println("Failure!");
  }
}

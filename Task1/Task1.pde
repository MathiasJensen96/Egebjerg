int [] arr = new int [] {8, 9, 1, 5, 11, 13, 7, 4, 6, 3, 12, 10, 2};

void setup() {
  bubbleSort(arr);
  println(arr);
}

void bubbleSort(int array[])
{
  int i, j;
  boolean sorted = false;

  // while the array isn't sorted
  while (!sorted) {
    sorted = true;
    // loop through array
    for (i=0; i<array.length-1; i++) {
      if (array[i] > array[i+1]) {
        // swap values
        j = array[i];
        array[i] = array[i+1];
        array[i+1] = j;
        sorted = false;
      }
    }
  }
}

//3.a Create a new sketch and save it by the name "Datamatik".
//3.b Create a new tab called "Teacher" and another one called "Student" 
//3.c in the Student tab, define the class "Student" and add 4 fields: 
//"name", "age", "isFemale", "datamatikerTeam" using appropriate data types for each.
//3.d in the Student tab, add a Constructor that takes in 4 parameters with the names 
//"tmpName", "tmpAge", "tmpIsFemale", "tmpDatamatikerTeam" with the same data types used in 3.c
//3.e populate the fields created in 3.c with the parameters of the constructor added in 3.d

//3.f in the Teacher tab, define the class "Teacher" and add 3 fields: 
//"name", "age", "isFemale", using appropriate data types for each.
//3.g in the Teacher tab, add a Constructor that takes in 3 parameters with the names 
//"tmpName", "tmpAge", "tmpIsFemale" with the same datatypes used in 3.f
//3.h populate the fields created in 3.f with the parameters of the constructor added in 3.g

//3.i Returning to the Datamatik tab add a setup() function and in this function, create a 
//new object of the type Teacher and give it the name, age and gender of your teacher. 
//3.j Also in the setup() function of Datamatik, create two new objects of the type Student. 
//The first one, with your own name, age and gender. The second one with the name, age and gender 
//of the student sitting next to you. 

//3.k in the setup() function print the name of the teacher
//3.l in the setup() function print the names of both students and which teams they are from. 
Teacher Teacher1;
Student Student1;
Student Student2;

void setup(){
  Teacher1 = new Teacher("Jesper", 32, false);
}

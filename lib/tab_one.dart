import 'package:flutter/material.dart';
import 'package:form_handling_practice/details_page.dart';
import 'package:form_handling_practice/form_page.dart';
import 'package:form_handling_practice/student.dart';

class TabOne extends StatefulWidget {
  const TabOne({Key? key}) : super (key: key);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {

  List <Student> students = [
    Student(
      id: 2020020,
      name: "Mark Gaje",
      age: 21,
      year: 3,
      course: "BSIT",
      section: "R1"
    )
  ];

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index){
          final student = students[index];
          return Dismissible(
              key: Key(student.id.toString()),
              child: ListTile(
                title: Text(student.name),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage(student: student))
                  );
                }
              )
          );
        }
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Student? newStudent = await Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => FormPage()
            )
          );
          setState(() {
            if(newStudent == null){
              return null;
            }
            else{
              setState((){
                students.add(newStudent);
              });
            }
          }
          );
        },
        child: Icon(Icons.add)
      )
    );
  }
}
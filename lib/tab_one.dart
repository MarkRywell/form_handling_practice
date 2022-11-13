import 'package:flutter/material.dart';
import 'package:form_handling_practice/form_page.dart';

class TabOne extends StatefulWidget {
  const TabOne({Key? key}) : super (key: key);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {

  List students = [];

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
            )
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newStudent = await Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => FormPage()
            )
          );
          students.add(newStudent);
        },
        child: Icon(Icons.add)
      )
    );
  }
}
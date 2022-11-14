import 'package:flutter/material.dart';
import 'package:form_handling_practice/details_page.dart';
import 'package:form_handling_practice/form_page.dart';
import 'package:form_handling_practice/student.dart';

class TabOne extends StatefulWidget {

  final function;
  final List students;

  const TabOne({required this.function, required this.students, Key? key}) : super (key: key);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index){
          final student = widget.students[index];
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
            onPressed: widget.function,
            child: Icon(Icons.add)
      )
    );
  }
}
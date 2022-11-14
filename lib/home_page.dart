import 'package:flutter/material.dart';
import 'package:form_handling_practice/form_page.dart';
import 'package:form_handling_practice/student.dart';
import 'package:form_handling_practice/tab_one.dart';
import 'package:form_handling_practice/tab_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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

  void addStudent () async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.code),
        title: Text("Form Handling"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: "Students"),
            Tab(text: "Events")
          ]
        )
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TabOne(function: addStudent, students: students),
          TabTwo()
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:form_handling_practice/text_custom_widget.dart';

class DetailsPage extends StatelessWidget {

  final student;

  const DetailsPage({required this.student, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextCustom(text_title: "Student ID", text_data: student.id),
            TextCustom(text_title: "Name", text_data: student.name),
            TextCustom(text_title: "Age", text_data: student.age),
            TextCustom(text_title: "Course", text_data: student.course),
            TextCustom(text_title: "Year", text_data: student.year),
            TextCustom(text_title: "Section", text_data: student.section)
          ],
        )
      )
    );
  }
}

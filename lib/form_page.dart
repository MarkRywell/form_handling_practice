import 'package:flutter/material.dart';
import 'package:form_handling_practice/student.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(children: [Icon(Icons.person_add), SizedBox(width: 10), Text("Add Student")])
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: idController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E.g. 2020302020",
                                labelText: "ID Number"
                            ),
                            validator: (value){
                              return value == null || value.isEmpty ? "Enter ID" : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E.g. hoipunkz Bully",
                                labelText: "Name"
                            ),
                            validator: (value){
                              return value == null || value.isEmpty ? "Enter Name" : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E.g. 20",
                                labelText: "Age"
                            ),
                            validator: (value){
                              return value == null || value.isEmpty ? "Enter Age" : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonFormField(
                                hint: Text("Year"),
                                items: const [
                                  DropdownMenuItem(
                                      value: 1,
                                      child: Text("1")
                                  ),
                                  DropdownMenuItem(
                                      value: 2,
                                      child: Text("2")
                                  ),
                                  DropdownMenuItem(
                                      value: 3,
                                      child: Text("3")
                                  ),
                                  DropdownMenuItem(
                                      value: 4,
                                      child: Text("4")
                                  ),
                                  DropdownMenuItem(
                                      value: 5,
                                      child: Text("5")
                                  ),
                                ],
                                onChanged: (value) {
                                  selectedValue = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: courseController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E.g. BSIT",
                                labelText: "Course"
                            ),
                            validator: (value){
                              return value == null || value.isEmpty ? "Enter Course" : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: sectionController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E.g. R10",
                                labelText: "Section"
                            ),
                            validator: (value){
                              return value == null || value.isEmpty ? "Enter Section" : null;
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                            width: 100,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if(formKey.currentState!.validate()){
                                    var newStudent = await(
                                        Student(
                                          id: int.parse(idController.text),
                                          name: nameController.text,
                                          age: int.parse(idController.text),
                                          year: selectedValue,
                                          course: courseController.text,
                                          section: sectionController.text,
                                        )
                                    );
                                    Navigator.pop(context, newStudent);
                                  }
                                },
                                child: Text("Submit"))
                        )
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}

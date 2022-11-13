import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.person_add),
            title: Text("Add Student")
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextFormField(
                          controller: idController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "E.g. 2020302020",
                            labelText: "ID Number"
                          ),
                          validator: (value){
                            return value == null || value.isEmpty ? "Enter ID" : null;
                          },
                        ),
                    ],
                  ),
                )
            )
        )
    );
  }
}

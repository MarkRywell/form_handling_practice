import 'package:flutter/material.dart';
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
          TabOne(),
          TabTwo()
        ],
      )
    );
  }
}

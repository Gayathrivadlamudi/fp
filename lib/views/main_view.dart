import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainView extends StatefulWidget{
  const MainView({super.key});
  @override
State<MainView>createState()=> _MainViewState();
}
class _MainViewState extends State<MainView>{
@override
Widget build(BuildContext context){
  return Scaffold(appBar: AppBar(title: Text("Hii)",
  ),),
  body:Center(child: Text("hello namaste")));
}
}
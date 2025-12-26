import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/init_routes.dart';
import '../views/login_view.dart';
void main(){
  runApp(MyAPP());
}
class MyAPP extends StatelessWidget{
  const MyAPP({super.key});
@override
  Widget build(BuildContext context){
    return GetMaterialApp(
    title:"dOneL",
    initialRoute: '/',
    getPages:routes,
      debugShowCheckedModeBanner: false,
      home:const LoginPage(),
    );
}
}
class LoginPage extends StatefulWidget{
const LoginPage({super.key});
    @override
  State<LoginPage> createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context){
    return login_view();
  }
}

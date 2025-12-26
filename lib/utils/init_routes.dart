import 'package:get/get.dart';
import '../views/main_view.dart';
List<GetPage> routes=[
  //by using the name we can call the pages
  GetPage(name: "/mainview", page:()=>const MainView()),

];
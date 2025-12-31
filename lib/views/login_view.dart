import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Validator.dart';
import '../widgets/Seprator_dash.dart';
import '../controllers/authentication.dart';
class login_view extends StatefulWidget{

  login_view({super.key});
  @override
  State<login_view> createState()=>_login_viewState();

}
class _login_viewState extends State<login_view>{
  final _formKey=GlobalKey<FormState>();
  TextEditingController userctrl=TextEditingController();
  TextEditingController passctrl=TextEditingController();
  bool passwordHidden=true;
  final Authentication authController = Get.put(Authentication());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body:
    Form(
      key: _formKey,
      child: Container(
        constraints: BoxConstraints(

        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF), // dark blue
                Color(0xFFFFFFFF), // sky blue
                Color(0xFFFFFFFF), // very light blue
              ],
              stops: [0.0, 0.55, 1.0],)
        ),
        child: Column(
              children: [
                Container(
                  width: 500,
                  height: Get.height/2.3,
                  child: Column(
                    children: [
                      SizedBox(height: 68,),
                          Image.asset(
                            'assets/logo1.png',
                            width: 150,
                            fit: BoxFit.contain, // keeps full image
                          ),
                      SizedBox(height: 23,),
                      Center(
                        child: Text('FaceRecoX',
                          style:  GoogleFonts.playfairDisplay(fontStyle: FontStyle.italic,color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 36),),
                      ),
                       // SizedBox(height: 77,),
                    ],
                  ),

                ),
                Expanded(child:   Container(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 41, bottom: 14),
                          child:TextFormField(
                            controller: userctrl,
                            validator:(val)=>Validator.inputvalidate(val!, 'Username / Email') ,
                            decoration: InputDecoration(
                                filled:true,
                                hintText: "Username / Email",
                                // fillColor: Colors.lightBlueAccent.withAlpha(80),
                                fillColor: Color(0XFFFFFFFF),
                                prefixIcon:Image.asset('assets/profile.png',
                                  color: Colors.black,
                                  width: 20,height: 20,),
                                enabledBorder:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black54
                                    )
                                ),
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                )
                            ),

                          ) ,),
                        Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 14),
                          child:TextFormField(
                            controller: passctrl,
                            obscureText: passwordHidden,
                            validator:(val)=>Validator.inputvalidate(val!, 'password') ,
                            decoration: InputDecoration(
                                filled:true,
                                hintText: "Password",

                                fillColor: Color(0XFFFFFFFF),
                                prefixIcon:Image.asset('assets/key.png',
                                  color: Colors.black,
                                  width: 20,height: 20,),
                                suffixIcon: IconButton(
                                    icon: passwordHidden?
                                    const Icon(Icons.visibility_off,color: Colors.black,)
                                        :
                                    Icon(Icons.visibility,color: Colors.black,),
                                    onPressed: (){
                                      setState(() {
                                        passwordHidden=!passwordHidden;
                                      });
                                    } ),

                                enabledBorder:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black54
                                    )
                                ),
                              focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black
                                )
                              )

                            ),

                          ) ,
                        ),
                        Padding(padding: EdgeInsets.all(20),
                        child:SizedBox(
                          height:50,
                          width: Get.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape:RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(23),
                                ),
                                backgroundColor: Color(0XFFE32228)

                              ),
                              onPressed:(){
                            print("login pressed");
                            authController.onLogin(userctrl.text,passctrl.text,context);
                          }, child:
                              Row(children: [
                                Expanded(child:
                                  Center(child: Text("Log In",style:GoogleFonts.playfairDisplay(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),) ,)
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],)

                       ),
                        )),
                        Padding(padding: EdgeInsets.only(top: 20),
                          child: Row(
                             children: [
                               Expanded(child:  MySperator(color: Colors.black,), ),
                               Text("   Or   ",style: TextStyle(color: Colors.black,fontSize:18),),
                               Expanded(child:  MySperator(color: Colors.black,), ),
                             ],
                          ),),
                        SizedBox(height: 10,),
                       Center(child:Text("Sign In With",
                         style: TextStyle(color:Colors.black,fontSize: 14),
                       ),),

                        SizedBox(height: 10,),
                        Row(
                          //okay its like we divide the row into 3 parts and each part will have expanded so it get like that
                          children: [
                            //by using container we can use alignment
                            Expanded(child: Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(onPressed: (){}, icon:
                                  Image.asset('assets/google.png',
                                    width: 50,height: 50,)
                              ),
                            )),
                            Expanded(child: Container(
                              alignment: Alignment.center,
                              child: IconButton(onPressed: (){}, icon:
                              Image.asset('assets/apple.png', width: 50,height: 50,)
                              ),
                            )),
                            Expanded(child: Container(
                              alignment: Alignment.centerLeft,
                              child: IconButton(onPressed: (){}, icon:
                              Image.asset('assets/microsoft.png', width: 50,height: 50,)
                              ),
                            ))
                          ],
                        )
                      ],
                    ) ,
                  ),
                ), )
              ],
        ) ,
      )

    ),);
  }
}


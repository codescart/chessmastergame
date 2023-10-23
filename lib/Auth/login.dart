import 'dart:convert';


import 'package:chessmastergame/Auth/forgot_password.dart';
import 'package:chessmastergame/Auth/register.dart';
import 'package:chessmastergame/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Dashboard/dashboard.dart';

class login extends StatefulWidget {
  const login({Key key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(backgroundColor: secondryColor,
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 17),
                      child: Text("Already \nhave an \nAccount?",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 25),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Image(image: AssetImage("assets/images/Login2.png"),height: height*0.25,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration( enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                      borderSide: BorderSide(
                          width: 1, ),
                    ),
                        labelText: "Phone.no or email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right:
                  15,top: 15),
                  child: TextField(
                    controller: passController,
                    // onChanged: (v){
                    //   if (v.length==6){}
                    //   v.isEmpty? 'enter password': null;
                    // },
                    maxLength: 8,
                    decoration: InputDecoration(enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 1, ),),
                        labelText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 210),
                  child: InkWell(onTap: (){
                    Navigator.push(context, PageTransition(child: Forgot_Password(),
                        type: PageTransitionType.leftToRight,duration:Duration(seconds: 1) ));
                  },
                    child: Text("Forgot Password?",style: TextStyle(fontSize: 15),),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: InkWell(onTap: (){
                //     Login(emailController.text, passController.text);
                //   },
                //     child: Container(alignment: Alignment.center,
                //       height: height*0.06,width: width*0.5,
                //       //color: Colors.redAccent,
                //       decoration: BoxDecoration(borderRadius:
                //       BorderRadius.all(Radius.circular(30)),color: primaryColor,),
                //       child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w600,
                //       fontSize: 20,color: Colors.white),),
                //
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 10),
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          Login(emailController.text, passController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),

                        child:
                        loading == false?
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ):
                        Padding(
                          padding:  EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white)),
                              Text(
                                "Please Wait...",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: InkWell(onTap: (){
                    Navigator.push(context, PageTransition(child: Register(),
                        type: PageTransitionType.rightToLeft,duration:Duration(seconds: 1) ));
                  },
                    child: Text("New user? Register Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,

                    ),),
                  ),
                )

              ],
            ),
          ),
        ],
      ),));
  }
  Login( String emailController ,String passController )async{
    setState(() {
      loading=true;
    });

    final response=await http.post(
      Uri.parse(Apiconst.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email" : emailController,
        "password":passController,
      }),
    );
    final data=jsonDecode(response.body);
    if(data["error"]=='200'){
      setState(() {
        loading=false;
      });
      final prefs = await SharedPreferences.getInstance();
      final key = 'userId';
      final userId =data['data']['id'] ;
      prefs.setString(key, userId);
      print("😂😂😂😂😂😂😂");
      print(userId);
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>bottom()));
    }else{
      setState(() {
        loading=false;
      });
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    print(data);
  }
}

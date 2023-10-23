import 'dart:convert';


import 'package:chessmastergame/Auth/login.dart';
import 'package:chessmastergame/Dashboard/dashboard.dart';
import 'package:chessmastergame/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart 'as http;


class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Phone = TextEditingController();
  TextEditingController _Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 17,top: 40),
                      child: Text("Here's \nyour first \nstep with \nus!",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,
                        color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 10),
                      child: Image(image: AssetImage("assets/images/Register3.png"),height:height*0.23 ,),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,20,0),
                  child: Container(
                    height: height*0.5,
                    width: width*0.9,
                    decoration: BoxDecoration(borderRadius:
                    BorderRadius.all(Radius.circular(10)),color: Colors.white,),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _Name,
                            decoration: InputDecoration(enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),),
                                labelText: "Name",),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextField(
                              controller: _Email,
                              decoration: InputDecoration(enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black),),
                                  labelText: "Email",),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5),
                            child: TextField(
                              controller:_Phone,
                              decoration: InputDecoration(enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black),),
                                  labelText: "Phone.no",),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5),
                            child: TextField(
                              controller: _Password,
                              maxLength: 8,
                              decoration: InputDecoration(enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black),),
                                labelText: "Password",),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Container(alignment: Alignment.center,
                              height: height*0.06,width: width*0.5,
                              //color: Colors.redAccent,
                              decoration: BoxDecoration(borderRadius:
                              BorderRadius.all(Radius.circular(30)),color: Colors.black),
                              child: InkWell(onTap: (){

                                Register(_Name.text,_Email.text,_Phone.text, _Password.text);
                                },
                                child: Text("REGISTER",style: TextStyle(fontWeight: FontWeight.w600,
                                    fontSize: 20,color: Colors.white),),
                              ),),),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: InkWell(onTap: (){
                              Navigator.pop(context, PageTransition(child: login(),
                                  type: PageTransitionType.rightToLeft,duration:Duration(seconds: 1) ));
                            },
                              child: Text("Already have an account?",style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
  Register( String _Name ,String _Email, String _Phone ,String _Password )async{
    final response=await http.post(
      Uri.parse(Apiconst.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "fullname":_Name,
        "email" : _Email,
        "mobile":_Phone,
        "password":_Password
      }),
    );
    final data=jsonDecode(response.body);
    if(data["error"]=='200'){
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email = "";
  TextEditingController emailController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  resetPassword() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 109, 240, 113),
          content: Text("Password Reset Email has been sent !", style: TextStyle(color: Colors.black45, fontSize: 18.0),)
        )
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    } on FirebaseException catch (e) {
      if(e.code == "user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("No user found for that email. ", style: TextStyle(fontSize: 20.0),)
          )
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red[600],
            content: Text(e.code, style: TextStyle(fontSize: 20.0,),)
          ),
        );
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70.0,),
            Container(
              alignment: Alignment.center,
              child :
                Text("Password Recovery", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
            ),
            SizedBox(height: 10.0,),
            Text("Enter your email", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Please Enter Email";
                            }
                          },
                          style:TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(hintText: "Email id", hintStyle: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20.0, fontWeight: FontWeight.bold), prefixIcon: Icon(Icons.person, color: Colors.white, size: 30.0,),border: InputBorder.none ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      GestureDetector(
                        onTap: () {
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email = emailController.text;
                            });
                            resetPassword();
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: 140,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Send Email", 
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don\'t have an account? ", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                            },
                          child: Text("Create ", style: TextStyle(color: Color.fromARGB(255, 184, 166, 6), fontSize: 20.0, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, decorationThickness: 2.0, decorationColor: Colors.yellow),))
                        ],
                      ),
                    ],
                  ),
                )
              )
            ),
            
          ],
        ),
      ),
    );
  }
}
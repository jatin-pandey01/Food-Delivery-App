import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/bottomnav.dart';
import 'package:flutter_application_1/pages/forgetpassword.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = "", password = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Registered Successfully",style: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Poppins'),),
        )
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));  
    } on FirebaseException catch (e) {
      if(e.code == 'user-not-find'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("No User Found for this Email", style:TextStyle(fontSize: 20.0,fontFamily: 'Poppins'),)
          )
        );
      }
      else  if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Wrong password", style: TextStyle(fontSize: 20.0,fontFamily: 'Poppins'),)
          )
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(e.code, style: TextStyle(fontSize: 20.0,fontFamily: 'Poppins'),)
          )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFff5c30), Color(0xFFe74b1a)])),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
              // child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/8,left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("images/logo.png", width: MediaQuery.of(context).size.width/1.3,fit: BoxFit.cover,)
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text("Login", style: AppWidget.HeadlineTextFieldStyle(),),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please Enter Email";
                                  }
                                },
                                decoration: InputDecoration(hintText: "Email", hintStyle: AppWidget.BoldTextFieldStyle(),prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please Enter Password";
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(hintText: "Password",hintStyle: AppWidget.BoldTextFieldStyle(), prefixIcon: Icon(Icons.password_outlined)),),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                                  setState(() {
                                    
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text("Forgot Password ? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.black,
                                      decorationThickness: 2.0,
                                      decorationStyle: TextDecorationStyle.solid
                                    ),)
                                ),
                              ),
                              SizedBox(height: 40,),
                              GestureDetector(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                      userLogin();
                                    });
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text("Please fill all details", style: TextStyle(fontSize: 20.0, color: Colors.white),)
                                      )
                                    );
                                    setState(() {
                                    
                                    });
                                  }
                                  
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 200,
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    decoration: BoxDecoration(color: Color(0xffff5722),//Color code always start with 0xff and after this that hex decimal code come
                                    borderRadius: BorderRadius.circular(20)),
                                    child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        setState(() {
                          
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Don\'t have an account ?", style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold, fontFamily: 'Poppins' ),),
                          ),
                          Container(
                            child: Text(" Sign up", style: TextStyle(color: Colors.red, fontSize: 20,decoration: TextDecoration.underline, decorationColor: Colors.red, decorationThickness: 2, fontWeight: FontWeight.w900, fontFamily: 'Poppins'),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
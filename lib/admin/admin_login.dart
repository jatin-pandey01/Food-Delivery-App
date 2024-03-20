import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/home_admin.dart';
import 'package:flutter_application_1/pages/bottomnav.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String username = "", password = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
              padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 53, 51, 51),Color.fromRGBO(53, 61, 61,1)], begin: Alignment.topLeft, end: Alignment.bottomRight ), borderRadius: BorderRadius.vertical(top: Radius.elliptical(MediaQuery.of(context).size.width, 110.00))),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30.0, top: 60),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Text("Let\'s start with \n \t Admin!", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30.0,),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height/2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Container(
                              padding: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 160, 160, 147), width: 1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "Please Enter Username";
                                    }
                                  },
                                  style: TextStyle(color: Color.fromARGB(255, 160, 160, 147), fontSize: 18.0),
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 147), fontSize: 18.0),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              padding: EdgeInsets.only(left: 20.0, top: 5, bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 160, 160, 147)), borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "Please Enter Password";
                                    }
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 147), fontSize: 18.0), border: InputBorder.none, hintText: "Password",),
                                ),
                              ),
                            ),
                            SizedBox(height: 40,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  LoginAdmin();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.0,),
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  LoginAdmin() async{
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result) { 
        if(result.data()['id'] != usernameController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Username is not found", style: TextStyle(fontSize: 18.0),)
            )
          );
        }
        else if(result.data()['password']!= passwordController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Your Password is incorrect", style: TextStyle(fontSize: 18.0),)
            )
          );
        }
        else{
          Route route = MaterialPageRoute(builder: (context)=>HomeAdmin());
          Navigator.pushReplacement(context, route);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text("Registered Successfully", style: TextStyle(color: Colors.white, fontSize: 18.0),)
            )
          );
        }
       });
    });
  }
}
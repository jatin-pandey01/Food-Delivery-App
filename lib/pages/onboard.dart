import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/content_model.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_,i){
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image, 
                        height: 450, 
                        width: MediaQuery.of(context).size.width/1.2,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 40.0,),
                      Text(
                        contents[i].title, 
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        contents[i].description,
                        style: AppWidget.LightTextFieldStyle(),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) => buildDot(index,context),
                ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if( currentIndex == contents.length - 1 ){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }
              _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              alignment: Alignment.center,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Text( currentIndex == contents.length - 1 ? "Start" :"Next" , style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500, fontFamily: "Poppins"),),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10.0,
      width: currentIndex == index ? 25.0 : 10.0,
      margin: EdgeInsets.only(right: 5.0),  
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black38,),
    );
  }
}
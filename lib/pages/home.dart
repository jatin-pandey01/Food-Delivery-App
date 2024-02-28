import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ice_cream = false, pizza = false, burger = false, salad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0,left:20.0,),
        // color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Pandey, ", style: AppWidget.BoldTextFieldStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                )
              ],
            ),
            SizedBox(height: 30,),
            Text("Delicious food", style: AppWidget.HeadlineTextFieldStyle()),
            Text("Discover and Get Great Food", style: AppWidget.LightTextFieldStyle()),
            SizedBox(height: 20,),
            showItem(),
            SizedBox(height: 30.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/salad2.png", height: 150, width: 150, fit: BoxFit.cover,),
                              Text("Veggie Taco Hash", style: AppWidget.SemiBoldTextFieldStyle(),),
                              SizedBox(height: 5.0,),
                              Text("Fresh and Healthy", style: AppWidget.LightTextFieldStyle(),),
                              SizedBox(height: 5.0,),
                              Text("\$25",style: AppWidget.SemiBoldTextFieldStyle(),), // "\$" == $ and "$" == error
                            ],
                        
                            ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/salad3.png", height: 150, width: 150,fit: BoxFit.cover,),
                              Text("Mix Veg Salad", style: AppWidget.SemiBoldTextFieldStyle()),
                              SizedBox(height: 5.0,),
                              Text("Spicy with Onion", style: AppWidget.LightTextFieldStyle(),),
                              SizedBox(height: 5.0,),
                              Text("\$30", style: AppWidget.SemiBoldTextFieldStyle(),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("images/salad4.png", height: 120, width: 120,),
                      SizedBox(width: 20.0,),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Mediterranean Chickpea Salad", style: AppWidget.SemiBoldTextFieldStyle(),),
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Honey Goot Cheese", style: AppWidget.LightTextFieldStyle(),),
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("\$35", style: AppWidget.SemiBoldTextFieldStyle(),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }

  Widget showItem(){
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      ice_cream = !ice_cream;
                      salad = false;
                      burger = false;
                      pizza = false;
                      setState(() {
                        
                      });
      
                    },
                    child: Material(
                      elevation: 5.0, //elevation == Box shadow
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(color: ice_cream ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "images/ice-cream.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          color: ice_cream ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ice_cream = false;
                      salad = false;
                      burger = false;
                      pizza = !pizza;
                      setState(() {
                        
                      });
      
                    },
                    child: Material(
                      elevation: 5.0, //elevation == Box shadow
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(color: pizza ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "images/pizza.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          color: pizza ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ice_cream = false;
                      salad = !salad;
                      burger = false;
                      pizza = false;
                      setState(() {
                        
                      });
      
                    },
                    child: Material(
                      elevation: 5.0, //elevation == Box shadow
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(color: salad ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "images/salad.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          color: salad ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ice_cream = false;
                      salad = false;
                      burger = !burger;
                      pizza = false;
                      setState(() {
                        
                      });
      
                    },
                    child: Material(
                      elevation: 5.0, //elevation == Box shadow
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(color: burger ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "images/burger.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          color: burger ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  } 
}
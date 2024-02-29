import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int orderCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 10.0, right: 20.0),
        child: Column(
          crossAxisAlignment: 
          CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)
            ),
            Image.asset("images/salad2.png", width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/2.3, fit: BoxFit.fill, //BoxFit.fill means fill your body in give height and width
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Mix Veg Salad", style: AppWidget.HeadlineTextFieldStyle(),),
                Spacer(), //Max space between 2 container possible will give
                GestureDetector(
                  onTap: (){
                    if(orderCount > 1){
                      orderCount -= 1; 
                    }
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.remove,color: Colors.white,size: 25,),
                  ),
                ),
                SizedBox(width: 25,),
                Text(orderCount.toString(), style: AppWidget.BoldTextFieldStyle(),),
                SizedBox(width: 25,),
                GestureDetector(
                  onTap: () {
                    orderCount += 1;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.add, color: Colors.white,size: 25,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("A vibrant mix veg salad bursts with colors and flavors, combining crisp lettuce, juicy tomatoes, crunchy cucumbers, and a medley of colorful bell peppers. Tossed with a zesty dressing, it's a refreshing and nutritious delight for the palate.", style: AppWidget.LightTextFieldStyle(),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Delivery Time : ", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(width: 25.0,),
                Icon(Icons.alarm, color: Colors.black,),
                SizedBox(width: 5.0,),
                Text("30 Min", style: AppWidget.SemiBoldTextFieldStyle(),),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price : ", style: AppWidget.SemiBoldTextFieldStyle(),),
                      Text("\$30", style: AppWidget.BoldTextFieldStyle(),),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5.0)),
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: 'Poppins'),),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[500], borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.all(3),
                          child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
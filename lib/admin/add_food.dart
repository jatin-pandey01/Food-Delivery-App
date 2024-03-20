import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, color: Color(0xFF373866),)
        ),
        centerTitle: true,
        title: Text("Add Item", style: AppWidget.HeadlineTextFieldStyle(),),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture", style: AppWidget.SemiBoldTextFieldStyle(),),
              SizedBox(height: 20.0,),
              Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(20.0)),
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
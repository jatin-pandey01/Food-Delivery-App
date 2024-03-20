import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text("Wallet", style: AppWidget.HeadlineTextFieldStyle(),)
                  ),
                )
              ),
              SizedBox(height: 20.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                child: Row(
                  children: [
                    Image.asset("images/wallet.png", 
                      height: 60, 
                      width: 60, 
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 40.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Wallet", style: AppWidget.SemiBoldTextFieldStyle(),),
                        SizedBox(height: 5.0,),
                        Text("\$100", style: AppWidget.BoldTextFieldStyle(),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Add Money", style: AppWidget.SemiBoldTextFieldStyle(),),
              ),
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFFE2E2E2)), borderRadius: BorderRadius.circular(5)),
                    child: Text("\$100",style: AppWidget.SemiBoldTextFieldStyle(),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFFE2E2E2)), borderRadius: BorderRadius.circular(5)),
                    child: Text("\$500",style: AppWidget.SemiBoldTextFieldStyle(),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFFE2E2E2)), borderRadius: BorderRadius.circular(5)),
                    child: Text("\$1000",style: AppWidget.SemiBoldTextFieldStyle(),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFFE2E2E2)), borderRadius: BorderRadius.circular(5)),
                    child: Text("\$2000",style: AppWidget.SemiBoldTextFieldStyle(),),
                  ),
                ],
              ),
              SizedBox(height: 40.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF008080), borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                  child: Text("Add Money",style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
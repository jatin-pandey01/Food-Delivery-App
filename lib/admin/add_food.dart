import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  final List<String> items = ["Burger", "Ice-cream", "Pizza", "Salad"];

  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController detailController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? value ;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async{
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {
      
    });
  }

  uploadItem() async{
    if(selectedImage != null && nameController.text != "" && priceController.text != "" && detailController.text != ""){
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await ( await task).ref.getDownloadURL();
    }
  }

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upload the Item Picture", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(height: 20.0,),
                selectedImage == null ? GestureDetector(
                  onTap: () {
                    setState(() {
                      getImage();
                    });
                  },
                  child: Center(
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(Icons.camera_alt_outlined, color: Colors.black,),
                      ),
                    ),
                  ),
                ) : Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(20.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.file(selectedImage!, fit: BoxFit.cover,)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text("Item Name", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter Item Name",
                      border: InputBorder.none,
                      hintStyle: AppWidget.LightTextFieldStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text("Item Price", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: "Enter Item Price",
                      hintStyle: AppWidget.LightTextFieldStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text("Item Details", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: detailController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Detail",
                      hintStyle: AppWidget.LightTextFieldStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Select Category", style: AppWidget.SemiBoldTextFieldStyle(),),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: items.map((e) => DropdownMenuItem<String> (
                        value: e,
                        child: Text(e,style: TextStyle(fontSize: 18.0, color: Colors.black),)
                      )).toList(),
                      onChanged: ((value)=>setState(() {
                        this.value = value;
                      })), 
                      dropdownColor: Colors.white, 
                      hint: Text("Select Category"), 
                      iconSize: 36, 
                      icon: Icon(
                        Icons.arrow_drop_down_outlined, 
                        color: Colors.black,
                      ), 
                      value: value,
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/screens/edit_profile.dart';
import 'package:untitled4/screens/login_page.dart';
import 'package:untitled4/screens/splash_page.dart';

import 'orders_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,

                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height:50,),
                        ProfileButtons(),
                        SizedBox(height:5,),
                        OrderButtons(),
                        //SizedBox(height:5,),
                        //MapButtons(),
                        SizedBox(height: 5,),
                        LogOutButtons() ,

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget ProfileButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height:50,
        width:200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> EditProfile(imageFile: "",)));
          }, child: Text("Profile"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
        ),

      ),
    );
  }

  Widget OrderButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height:50,
        width:200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> OrdersScreen()));
          }, child: Text("Orders"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
        ),

      ),
    );
  }



  Widget OrdersButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> OrdersScreen()));
          }, child: Text("YourOrders"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
        ),

      ),
    );
  }



  Widget LogOutButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: ElevatedButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage() ));
          }, child: Text( "LogOut"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
        ),

      ),
    );
  }






















}





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/screens/edit_profile.dart';
import 'package:untitled4/screens/login_page.dart';
import 'package:untitled4/screens/splash_page.dart';

import 'orders_screen.dart';

class SuccesOrder extends StatefulWidget {
  const SuccesOrder({Key? key}) : super(key: key);

  @override
  State<SuccesOrder> createState() => SuccesOrderState();
}

class SuccesOrderState extends State<SuccesOrder> {

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
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff65b0bb),
                        Color(0xff5a9ea8),
                        Color(0xff508c95),
                        Color(0xff467b82),
                        Color(0xff3c6970),
                        Color(0xff32585d),
                        Color(0xff28464a),
                      ],

                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height:300,),
                        Text(
                          "Your Order Added Successfully!☺",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50,),
                        OrderButtons(),



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
          }, child: Text("Your Orders"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
        ),

      ),
    );
  }
























}





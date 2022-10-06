import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/screens/signup_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled4/screens/Admin/admin_dashboard.dart';



class PreAdminDashboard extends StatefulWidget {
  const PreAdminDashboard({Key? key}) : super(key: key);

  @override
  State<PreAdminDashboard> createState() => _PreAdminDashboardState();
}

class _PreAdminDashboardState extends State<PreAdminDashboard> {
  bool sec = true;
  bool showErrorPassword = false;
  bool notShowPassword = true;
  TextEditingController passwordTextEditingController = TextEditingController();
 // TextEditingController adminPasswordController = TextEditingController();

  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5a9ea8),
      ),
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
                        SizedBox(height: 100,),
                        Text(
                          "Welcome To You!☺",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 100,),
                        BulidPassword() ,
                        BuildLoginButton(),

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


  Widget BulidPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password", style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2)
              )
            ],
          ),
          height: 60,

          child: TextField(
            controller: passwordTextEditingController,
            obscureText: sec,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      sec = !sec;
                    });
                  },
                  icon: sec ? visableoff : visable,


                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.vpn_key,
                  color: Color(0xff4c5166),
                ),
                hintText: "Enter Your Password:QWEr!@#4",
                errorText:showErrorPassword ? "Enter valed password" : null,
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }


  Widget BuildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () {

              if (validateStructure(passwordTextEditingController.text) && passwordTextEditingController.text == "Afnan@1998") {
                showErrorPassword = false;
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AdminDashboard()), (route) => false);

              } else {
                showErrorPassword = true;
              }
              setState(() {});

            },
          )

      ),
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }












}








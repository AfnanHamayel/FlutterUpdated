import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/screens/signup_page.dart';
import 'package:http/http.dart' as http;
import '../utl/constant_value.dart';
import 'Admin/admin_dashboard.dart';
import 'Admin/pre_admin_dashboard.dart';
import 'main_screen.dart';



class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool sec = true;
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool notShowPassword = true;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                        SizedBox(height:80,),
                        Text(
                          "Welcome To You!☺",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50,),
                        BulidEmail(),

                        SizedBox(height: 50,),
                        BulidPassword(),

                        SizedBox(height: 50,),
                        BuildLoginButton(),
                        BuildSignUpButton(),
                        LogInAdminButton(),

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

  Widget BulidEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                )
              ]

          ),
          child: TextField(

            controller: emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Color(0xff4c5166),),
              hintText: "Enter your Email:demo@demo.com",
              hintStyle: TextStyle(color: Colors.black38),
              errorText: showErrorEmail ? "Enter valed email" : null,

            ),
          ),

        )

      ],
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
              if (isEmail(emailTextEditingController.text)) {
                showErrorEmail = false;

              } else {
                showErrorEmail = true;
              }
              if (validateStructure(passwordTextEditingController.text)) {
                showErrorPassword = false;
              } else {
                showErrorPassword = true;
              }
              setState(() {});
              login();
            },
          )

      ),
    );
  }

  Widget BuildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: ElevatedButton(
            child: const Text('SignUp'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          )

      ),
    );
  }

  Widget LogInAdminButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: ElevatedButton(
            child: const Text('LogIn Admin'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreAdminDashboard()),
              );
            },
          )

      ),
    );
  }




  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future login() async {
    Response response = await http.post(
        Uri.parse("${ConstantValue.URL}login.php"),
        body: {
          'Email': emailTextEditingController.text, // parm1
          'Password': passwordTextEditingController.text, // parm2
        }, headers: {
      "Access-Control-Allow-Origin": "*",
    }
    ).then((value) {
      print(value.statusCode);
      print(value.body);
      return value;
    });

    if (response.statusCode == 200) {
      print(response);
      var jsonBody = jsonDecode(response.body);
      var result = jsonBody['result'];
      if (result) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ConstantValue.ID, jsonBody["Id"]);
        await prefs.setString(ConstantValue.NAME, jsonBody["Name"]);
        await prefs.setString(ConstantValue.PHONE, jsonBody["Phone"]);
        await prefs.setString(ConstantValue.EMAIL, jsonBody["Email"]);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Worrning !!!!!"),
              content: Text(jsonBody['msg']),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          },
        );
      }
    } else {
      print("${response.statusCode}");
    }
  }







}





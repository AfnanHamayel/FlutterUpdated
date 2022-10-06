import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/utl/constant_value.dart';

import 'login_page.dart';
import 'main_screen.dart';



class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}



class SignUpPageState extends State<SignUpPage> {
  bool sec = true;
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool notShowPassword = true;
  bool showErrorConPassword = false;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confarimpasswordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

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
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 100,),
                        Text(
                          "Create Your Account😎",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height:30,),
                        BulidEmail(),
                        SizedBox(height:10,),
                        BulidPassword(),
                        SizedBox(height:10,),
                        ConfarimPassword(),

                        SizedBox(height:10,),
                        BulidPhoneNumber(),

                        BuildSignUPButton(),
                        LogInButton() ,


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
              hintText: "Enter your Email",
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
                hintText: "Enter Your Password",
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

  Widget ConfarimPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Confarim Password", style: TextStyle(
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
            controller: confarimpasswordTextEditingController,
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
                hintText: "Confarim Your Password",
                errorText:showErrorPassword ? "Password not match" : null,
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget BulidPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PhoneNumber", style: TextStyle(
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

            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.phone, color: Color(0xff4c5166),),
              hintText: "Enter your Phone Number",
              hintStyle: TextStyle(color: Colors.black38),


            ),
          ),

        )

      ],
    );
  }

  Widget BuildSignUPButton() {
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
              if (isEmail(emailTextEditingController.text)) {
                showErrorEmail = false;
              } else {
                showErrorEmail = true;
              }
              if (validateStructure(confarimpasswordTextEditingController.text)) {
                showErrorPassword = false;
              } else {
                showErrorPassword = true;
              }
              if (passwordTextEditingController.text ==
                  confarimpasswordTextEditingController.text) {
                showErrorConPassword = false;
              } else {
                showErrorConPassword = true;
              }

              setState(() {});
              signUp() ;

            },




          )




      ),
    );
  }

  Widget LogInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: ElevatedButton(
            child: const Text('LogIn'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
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

  Future signUp() async {
    final response = await http.post(
      Uri.parse("${ConstantValue.URL}SignUp.php"),
      body: {
        'Email': emailTextEditingController.text, // parm1
        'Password': passwordTextEditingController.text, // parm2
        'Name': nameTextEditingController.text, // parm3
        'Phone': phoneTextEditingController.text, // parm4
      },
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var result = jsonBody['result'];
      if (result) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ConstantValue.ID, jsonBody["Id"]);
        await prefs.setString(ConstantValue.NAME, jsonBody["Name"]);
        await prefs.setString(ConstantValue.PHONE, jsonBody["Phone"]);
        await prefs.setString(ConstantValue.EMAIL, jsonBody["Email"]);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) =>  LoginPage()));
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
    }
  }




}



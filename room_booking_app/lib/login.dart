import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'mainMenu.dart';
import 'config.dart';

class login extends StatefulWidget {
  login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  showAlertDialog(BuildContext context) {

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {Navigator.pop(context);},
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text("Password or Username is wrong"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isValidate = true;

  void login() async{
    var loginBody={
      "username": usernameController.text,
      "password": passwordController.text,
    };

    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){

      var response = await http.post(
          Uri.parse(LoginUrl),
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(loginBody),
      );

      var jsonResponse = jsonDecode(response.body);

      if(jsonResponse["status"]){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mainmenu(usernameController.text)));
      }
      else{
        showAlertDialog(context);
        usernameController.text="";
        passwordController.text="";
      }
    }
    else{
      setState(() {
        _isValidate = false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Room Booking",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
          ),
          elevation: 0.00,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(color: Colors.red),
                        errorText: _isValidate ? null : "Username is necessary",
                        hintText: "Username",
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(color: Colors.red),
                        errorText: _isValidate ? null : "Password is required",
                        hintText: "Password",
                        border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                const SizedBox(
                    height: 20
                ),
                GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text("Login",style: TextStyle(fontSize: 20,)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

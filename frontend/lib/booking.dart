import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'dart:convert';

class roomBooking extends StatefulWidget {
  var username;
  roomBooking(this.username,{super.key});
  @override
  State<roomBooking> createState() => _roomBookingState();
}

class _roomBookingState extends State<roomBooking> {
  TextEditingController roomNumber = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController clubName = TextEditingController();

  void book() async {
    var inputBody = {
      "userId": widget.username,
      "roomNumber": roomNumber.text,
      "purpose": purpose.text,
      "clubName": clubName.text,
    };

    var response = await http.post(
      Uri.parse(BookRoomUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputBody),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("BOOK A ROOM",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Please enter the following details:",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: roomNumber,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Room Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: purpose,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Purpose of Booking",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: clubName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Club Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              book();
            },
            child: Container(
              padding: EdgeInsets.all(6),
              child: const Text("Book",style: TextStyle(color: Colors.grey,fontSize: 25),),
              decoration: BoxDecoration(
                border: Border.all(width: 3,color: Colors.white),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

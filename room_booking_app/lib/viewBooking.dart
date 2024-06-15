import 'config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';


class ViewBooking extends StatefulWidget {
  var username;
  ViewBooking(this.username,{super.key});
  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  var bookings=[];
  void findBookings() async{
    var inputBody = {
      "userId": widget.username.toString(),
    };

    var response = await http.post(
      Uri.parse(ViewBookUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputBody),
    );
    var jsonResponse = jsonDecode(response.body);
    bookings = jsonResponse["success"];
    setState(() {});
    print(bookings);
  }

  @override
    initState(){
      super.initState();
      WidgetsBinding.instance
          .addPostFrameCallback((_) => findBookings());
    }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Previously Booked",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Different icon for back button
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children:[
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 180,
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.black, width: 7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("     Previously Booked Rooms",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                   child: ListView.builder(
                     scrollDirection: Axis.vertical,
                     itemCount: bookings.length,
                     itemBuilder: (context,index) {
                       return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text("ROOM NUMBER: ${bookings[index]["roomNumber"]}"),
                            Text("PURPOSE: ${bookings[index]["purpose"]}"),
                            Text("CLUB : ${bookings[index]["clubName"]}"),
                          ],
                        )
                      );
                     },
                   ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

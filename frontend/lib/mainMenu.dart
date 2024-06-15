import 'package:flutter/material.dart';
import 'booking.dart';
import 'viewBooking.dart';

class Mainmenu extends StatelessWidget {
  var username;
  Mainmenu(this.username,{super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> roomBooking(username)));
                    },
                    child: const Text("Book a room",style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBooking(username)));
                      },
                      child: const Text("View Room Bookings",style: TextStyle(color: Colors.black, fontSize: 20))),
                ),
              ],
            ),
          ),
        )
    );
  }
}

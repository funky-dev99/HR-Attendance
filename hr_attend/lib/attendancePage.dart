import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late Position? currentPositionOfUser;
  late String currentDate = '';
  late String currentTime = '';

  @override
  void initState() {
    super.initState();
    getCurrentLiveLocationOfUser();
    getCurrentDate();
    getCurrentTime();
  }

  getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    setState(() {
      currentPositionOfUser = positionOfUser;
    });
  }

  getCurrentDate() {
    DateTime now = DateTime.now();
    setState(() {
      currentDate = '${now.year}-${now.month}-${now.day}';
    });
  }

  getCurrentTime() {
    DateTime now = DateTime.now();
    setState(() {
      currentTime = '${now.hour}:${now.minute}:${now.second}';
    });
  }

  markIn() {
    print('Marked In - Date: $currentDate, Time: $currentTime, Latitude: ${currentPositionOfUser?.latitude}, Longitude: ${currentPositionOfUser?.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.bookmarks_rounded, size: 30.0,),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined, size: 30.0,),
            color: Colors.black,
            tooltip: 'Notifications',
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          //Logo
          Image.asset('images/location.gif', height: 200,),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text('Current Location: '),
              Text('Current Location: ${currentPositionOfUser != null ? '${currentPositionOfUser!.latitude}, ${currentPositionOfUser!.longitude}' : 'Fetching location...'}'),

            ],
          ),
          Row(
            children: [
              Text('Date: '),
              Text('$currentDate'),
            ],
          ),
          Row(
            children: [
              Text('Time: '),
              Text('$currentTime'),
            ],
          ),
          MaterialButton(
            onPressed: markIn,
            minWidth: 150.0,
            height: 50.0,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Text(
              'Mark-In',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

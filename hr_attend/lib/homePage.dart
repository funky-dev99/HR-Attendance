import 'package:flutter/material.dart';
import 'package:hr_attend/attendancePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> containerTexts = [
    'Attendance',
    '',
    ' ',
    ' ',
    '',
    'Profile',
  ];

  final List<String> imagePaths = [
    'images/attend.png',
    'images/leave.png',
    'images/claim.png',
    'images/payslip.png',
    'images/ask.png',
    'images/set.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon:  Icon(Icons.dashboard, size: 30.0,),
          color: Colors.black,
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined, size: 30.0,),
            color: Colors.black,
            tooltip: 'Notifications',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationPage()),
              // );
            },
          ),

        ],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return _buildContainer(index, context);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 145.0,
        height: 145.0,
        child: MaterialButton(
          onPressed: () {
            switch (index) {
              case 0:
                _handleContainer0Pressed(context);
                break;
              case 1:
                _handleContainer1Pressed(context);
                break;
              case 2:
                _handleContainer2Pressed(context);
                break;
              case 3:
                _handleContainer3Pressed(context);
                break;
              case 4:
                _handleContainer4Pressed(context);
                break;
              case 5:
                _handleContainer5Pressed(context);
                break;
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2.0,
          color: Colors.white,
          textColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePaths[index],
                width: 125.0,
                height: 100.0,
              ),
              SizedBox(height: 10.0),
              Text(
                containerTexts[index],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleContainer0Pressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AttendancePage()),
    );
  }

  void _handleContainer1Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LeaveMain()),
    // );
  }

  void _handleContainer2Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ClaimPage()),
    // );
  }

  void _handleContainer3Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PaySlipPage()),
    // );
  }

  void _handleContainer4Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AskPage()),
    // );
  }

  void _handleContainer5Pressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Settings()),
    // );
  }
}


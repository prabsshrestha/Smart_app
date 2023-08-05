import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart'; // Add this import for CupertinoSwitch
import 'dart:math';
import 'package:smart_home/smart_devices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List mySmartDevices = [
    ["Smart Light", "assets/icon/light_bulb.png", true],
    ["Smart AC", "assets/icon/air_conditioner.png", false],
    ["Smart TV", "assets/icon/smart_tv.png", false],
    ["Smart Fan", "assets/icon/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon/menu.png',
                    height: 40,
                    color: Colors.grey[800],
                  ),
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                children: [
                  Text(
                    "Welcome Home",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 23,
                        color: Colors.grey.shade800,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                  Text(
                    "Prabs",
                    style: GoogleFonts.dancingScript(
                      textStyle: TextStyle(
                        fontSize: 72,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Smart Devices',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemCount: mySmartDevices.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ignore_for_file: prefer_const_constructors 
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    // Define the default font family.
    fontFamily: 'Mulish',
  ),
  home: AboutUsPage()
));

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 55),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/formInfoDetailAssets/arrow-left-1.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                // SizedBox(width: 1), // Space between the back button and the title
                Expanded(
                  child: Text(
                    'About Us',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color.fromRGBO(247, 145, 1, 1)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset('assets/aboutus/logo.png', height: 170),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'NutriFact is created by a group of 5 aspiring developers in an attempt to graduate Software Engineering - COMP6100001.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('We are:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Text('• Aretha Natalova', style: TextStyle(fontSize: 16)),
                Text('• Axel Nino', style: TextStyle(fontSize: 16)),
                Text('• Hans Robert', style: TextStyle(fontSize: 16)),
                Text('• Jehoida Wong', style: TextStyle(fontSize: 16)),
                Text('• Jessica Lynn', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Image.asset('assets/aboutus/teampic.png', width: 320),
          ),
        ],
      ),
    );
  }
}

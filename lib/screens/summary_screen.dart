//ignore_for_file: prefer_const_constructors 
import 'package:flutter/material.dart';
////brisik bgt warningnya anjir

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 75, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Häagen-Dazs Ice Cream',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),  // Adding space between title and next section
              calorieRow(),
              SizedBox(height: 30),
              nutritionWarnings(2),
              SizedBox(height: 35),
              allergenBox(),
              // You can add more widgets here that will form the rest of your summary page
            ],
          ),
        ),
      ),
    );
  }


  Widget calorieRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // This will space the elements evenly across the horizontal axis
      children: [
        calorieInfo('330', 'cal', 'per serving'), // Calorie info for per serving
        verticalDivider(),
        percentageInfo(), // Custom widget for daily needs with formatted text
        verticalDivider(),
        calorieInfo('870', 'cal', 'per container'), // Total calories per container
      ],
    );
  }

    Widget verticalDivider() {
    return Container(
      height: 50, // Adjust height to match your row's content
      width: 3, // Can be thinner or thicker as per your design
      color: Color.fromRGBO(252, 223, 181, 1), // Choose a color that fits the design
    );
  }

  Widget calorieInfo(String number, String unit, String description) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 16,
          color: Colors.black, // Default text color
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$number ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 99, 0, 1),
            ),
          ),
          TextSpan(
            text: '$unit\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(247, 145, 1, 1),
            ),
          ),
          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(247, 145, 1, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget percentageInfo() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Mulish',
          color: Colors.black, // Default text color
        ),
        children: <TextSpan>[
          TextSpan(
            text: '18% of\n', // Use \n to force the text onto the next line
            style: TextStyle(fontSize: 17, color: Color.fromRGBO(255, 99, 0, 1), fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'daily needs',
            style: TextStyle(fontSize: 17, color: Color.fromRGBO(255, 99, 0, 1), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget nutritionWarnings(int count) {
    List<Widget> allWarnings = List.generate(
      count,
      (index) => warningBox('Saturated Fat', '20g', '28% DV'), //Example warning content
    );

    List<Widget> firstRow = [];
    List<Widget> secondRow = [];

    for (int i = 0; i < allWarnings.length; i++) {
      if (i < 3) {
        firstRow.add(allWarnings[i]);
      } else {
        secondRow.add(allWarnings[i]);
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: firstRow,
        ),
        if (secondRow.isNotEmpty) SizedBox(height: 15),  // Space between rows
        if (secondRow.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: secondRow,
          ),
      ],
    );
  }

  Widget warningBox(String title, String primaryText, String secondaryText) {
    return Container(
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 239, 221, 1), // Adjusted opacity to 1
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the columns across the box width
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 109, 2, 1), // Adjusted opacity to 1
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '$primaryText\n',
                          style: TextStyle(
                            fontSize: 18, // Larger font size for "20g"
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: secondaryText, // "28% DV"
                          style: TextStyle(
                            fontSize: 14, // Smaller font size for "28% DV"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: -9,
            bottom: 0,
            child: Image.asset(
              'assets/summary_screen/exclamation_mark.png', // Ensure you have this asset in your project
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }

  Widget allergenBox(){
    return Container(
      //nanti tambah padding
      height: 30,
      color: Color.fromRGBO(255, 193, 103, 1),
      );
  }
}




//ignore_for_file: prefer_const_constructors 
import 'package:flutter/material.dart';
////brisik bgt warningnya anjir

class SummaryScreen extends StatefulWidget {
  @override
  SummaryState createState() => SummaryState();
}

class SummaryState extends State<SummaryScreen> {
  bool isExpanded = false;
  final List<Map<String, dynamic>> nutritionData = [
      {"name": "Fats", "amount": "17g", "dv": "42% DV"},
      {"name": "Carbohydrates", "amount": "40g", "dv": "16% DV"},
      {"name": "Proteins", "amount": "4g", "dv": "4% DV"},
    ];

  final List<String> recommendations = [
      "Limit portion size",
      "Perfect for special treats, not daily snacks"
    ];

  final List<String> alternatives = [
      "Greek Yogurt",
      "Fruits",
      "Smoothies"
    ];

  final String productName = "Häagen-Dazs Ice Cream";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 75, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close), // Icon for exit/close
                    onPressed: () => Navigator.of(context).pop(), // Close or go back
                  ),
                  IconButton(
                    icon: Icon(Icons.save), // Icon for save
                    onPressed: () {
                      // Implement save functionality
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                productName,
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
              allergenBox(context, ['milk']),  // Displays warning with these allergens
              SizedBox(height: 25),
              Divider(color: Colors.grey[300], thickness: 1), // Divider before the dropdown
              customCollapsibleNutritionDetails(),
              Divider(color: Colors.grey[300], thickness: 1), // Divider before the dropdown
              gradeDisplay(2),
              Text( //bikin center
                'Based on highlighted nutrients and additional nutritional information',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 13,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 17),
              Divider(color: Colors.grey[300], thickness: 1),
              showRecommendations(context, recommendations, alternatives),
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
        percentageInfo(20), // Custom widget for daily needs with formatted text
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

  Widget percentageInfo(int percentage) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Mulish',
          color: Colors.black, // Default text color
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$percentage% of\n', // Use \n to force the text onto the next line
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

  Widget allergenBox(BuildContext context, List<String> allergens) {
    String text;
    Widget icon = SizedBox(width: 0);  // Adjusted to ensure spacing is correct even when no icon
    Color backgroundColor = Color.fromRGBO(255, 193, 103, 1);  // Default color for no allergens
    Color textColor = Colors.black;  // Default text color for no allergens

    // Determine the text and possibly add an icon based on allergens
    if (allergens.isEmpty) {
      text = "This product does not contain any allergens";
    } else {
      text = "Warning! This product contains ${allergens.join(' and ')}";
      icon = Padding(
        padding: EdgeInsets.only(right: 10),  // Add padding to the right of the icon
        child: Image.asset('assets/summary_screen/warning_sign.png', width: 17, height: 17),
      );
      backgroundColor = Color.fromRGBO(254, 109, 2, 1);  // Bright red color for allergens present
      textColor = Colors.white; // White text color for better contrast on red background
    }

    return Center(
      child: Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 10),  // Padding for text and icon
        width: MediaQuery.of(context).size.width * 0.8,  // 80% of screen width
        decoration: BoxDecoration(
          color: backgroundColor,  // Dynamic background color
          borderRadius: BorderRadius.circular(8),  // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Center align items horizontally
          crossAxisAlignment: CrossAxisAlignment.center,  // Center align items vertically
          children: [
            icon,
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,  // Center align text horizontally
                style: TextStyle(
                  color: textColor,  // Dynamic text color
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCollapsibleNutritionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            "Nutrition Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          trailing: IconButton(
            icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: Column(
            children: nutritionData.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3, // Adjust flex ratio for name column
                      child: Text(
                        item['name']!,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2, // Adjust flex ratio for amount column to align amounts
                      child: Text(
                        item['amount']!,
                        textAlign: TextAlign.center, // Center align text
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      flex: 2, // Adjust flex ratio for dv column
                      child: Text(
                        item['dv']!,
                        textAlign: TextAlign.right, // Right align text
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            // SizedBox(height: 10),
          ),
        ),
      ],
    );
  }

  Widget gradeDisplay(int score) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'Mulish',
          ),
          children: [
            TextSpan(text: 'Grade\n', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
            TextSpan(text: '$score ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50, color: Color.fromRGBO(255, 28, 82, 1))),
            TextSpan(text: '/ 5', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, color: Color.fromRGBO(247, 145, 1, 1)))
          ],
        ),
      ),
    );
  }
  
  Widget showRecommendations(BuildContext context, List<String> recommendations, List<String> alternatives) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(
          'Recommendations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        SizedBox(height: 5),
        ...recommendations.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            '• $item',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )),
        SizedBox(height: 14),
        Text(
          'Alternatives:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            alternatives.join(', '), // Joining alternatives with commas
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}




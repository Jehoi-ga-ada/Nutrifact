//ignore_for_file: prefer_const_constructors 
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
////brisik bgt warningnya anjir

class SummaryScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const SummaryScreen({
    super.key,
    required this.data,
  });

  @override
  SummaryState createState() => SummaryState();
}

class SummaryState extends State<SummaryScreen> {
  bool isExpanded = false;
  bool isSaved = false;
  
  bool validateWarnings(List<dynamic> warnings) {
  return warnings.every((item) {
    return item is Map<String, dynamic> &&
           item.containsKey('name') &&
           item.containsKey('amount') &&
           item.containsKey('dv');
    });
  }

  @override

  Widget build(BuildContext context) {
    print("Data before building: ${widget.data}"); //check data passing, nanti diremove

    // Safe cast to List<dynamic>; validate it's not empty and has the correct structure
    List<dynamic> warnings = widget.data['warnings'] as List<dynamic>? ?? [];
    bool isValidWarnings = validateWarnings(warnings);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: SvgPicture.asset(
                      'assets/summary_screen/exit_button.svg',
                      width: 26,
                      height: 26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    icon: SvgPicture.asset(
                      isSaved ? 'assets/summary_screen/saved_summary.svg' : 'assets/summary_screen/save_summary.svg',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19),
              Text(
                widget.data['productName'],
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              calorieRow(widget.data['calories']['perServing'], widget.data['calories']['perContainer']),
              if (isValidWarnings) 
                Column(
                  children: [
                    SizedBox(height: 30),
                    nutritionWarnings(warnings.cast<Map<String, dynamic>>()),
                  ],
              ),
              SizedBox(height: 35),
              allergenBox(context, widget.data['allergens']),
              SizedBox(height: 25),
              Divider(color: Colors.grey[300], thickness: 1),
              customCollapsibleNutritionDetails(),
              Divider(color: Colors.grey[300], thickness: 1),
              gradeDisplay(widget.data['grade']),
              Text(
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
              showRecommendations(context, widget.data['recommendations'], widget.data['alternatives']),
            ],
          ),
        ),
      ),
    );
  }


  Widget calorieRow(int calPerServing, int calPerContainer) { //nnti disini hrus bs diedit parameternya :1
    calPerContainer = calPerContainer ?? calPerServing;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        calorieInfo(calPerServing, 'cal', 'per serving'),
        verticalDivider(),
        percentageInfo(20), // Custom widget for daily needs with formatted text
        verticalDivider(),
        calorieInfo(calPerContainer, 'cal', 'per container'),
      ],
    );
  }

  Widget verticalDivider() {
    return Container(
      height: 50, // Adjust height to match your row's content
      width: 3, // Can be thinner or thicker as per your design
      color: Color.fromRGBO(252, 223, 181, 1),
    );
  }

  Widget calorieInfo(int number, String unit, String description) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 16,
          color: Colors.black,
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
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$percentage% of\n',
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

  Widget nutritionWarnings(List<Map<String, dynamic>> warnings) {
    List<Widget> allWarnings = warnings.map((warning) {
      return warningBox(warning['name'], warning['amount'], warning['dv']);
    }).toList();

    // Dynamically splitting into rows if more than 3 warnings
    List<Widget> rows = [];
    for (int i = 0; i < allWarnings.length; i += 3) {
      int end = (i + 3 > allWarnings.length) ? allWarnings.length : i + 3;
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: allWarnings.sublist(i, end),
      ));
      if (i + 3 < allWarnings.length) rows.add(SizedBox(height: 15));
    }

    return Column(children: rows);
  }

  Widget warningBox(String title, String primaryText, String secondaryText) {
      return Container(
        width: 95,
        height: 95,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 239, 221, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 109, 2, 1),
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
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: secondaryText,
                            style: TextStyle(
                              fontSize: 14,
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
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/summary_screen/exclamation_mark.svg',
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
    Widget icon = SizedBox(width: 0);
    Color backgroundColor = Color.fromRGBO(255, 193, 103, 1);
    Color textColor = Colors.black;

    // Determine the text and possibly add an icon based on allergens
    if (allergens.isEmpty) {
      text = "This product does not contain any allergens";
    } else {
      text = "Warning! This product contains ${allergens.join(' and ')}";
      icon = Padding(
        padding: EdgeInsets.only(right: 10),  // Add padding to the right of the icon
        child: SvgPicture.asset('assets/summary_screen/warning_sign.svg', width: 17, height: 17),
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
            children: widget.data['nutritionData'].map<Widget>((item) {
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
          ),
        ),
      ],
    );
  }

  Color getColorForScore(int score) {
    switch (score) {
      case 1:
        return Colors.red; // Red for the lowest score
      case 2:
        return Colors.redAccent; // Slightly lighter red
      case 3:
        return Colors.amber; // Yellow for mid score
      case 4:
        return Colors.lightGreen; // Light green for good
      case 5:
        return Colors.green; // Green for the best score
      default:
        return Colors.grey; // Handle unexpected scores
    }
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
            TextSpan(
              text: '$score ', 
              style: TextStyle(
                fontWeight: FontWeight.w500, 
                fontSize: 50, 
                color: getColorForScore(score) // Apply dynamic color based on score
              )
            ),
            TextSpan(
              text: '/ 5', 
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, color: Color.fromRGBO(247, 145, 1, 1))
            ),
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




import 'package:diet_chaiyoo/view/Budget_Setup.dart';
import 'package:diet_chaiyoo/view/Sigup_view.dart';
import 'package:diet_chaiyoo/view/select_package.dart';
import 'package:diet_chaiyoo/view/user_age_setup.dart';
import 'package:flutter/material.dart';

class SelectPackages extends StatefulWidget {
  const SelectPackages({super.key});

  @override
  State<SelectPackages> createState() => _SelectPackagesState();
}

class _SelectPackagesState extends State<SelectPackages> {
  bool first = false, second = false, third = false, randombutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate back to SelectPackages screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpView()),
                );
              },
              child: Icon(
                
                Icons.arrow_back_ios_new_rounded,
                size: 30.0,
                color: const Color.fromARGB(255, 139, 141, 143),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Choose Your Goal",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            first
                ? _buildSelectedOption("Gain Weight")
                : _buildUnselectedOption("Gain Weight", () {
                    setState(() {
                      first = true;
                      second = false;
                      third = false;
                      randombutton = true;
                    });
                  }),
            SizedBox(height: 20.0),
            second
                ? _buildSelectedOption("lose Weight")
                : _buildUnselectedOption("lose Weight", () {
                    setState(() {
                      first = false;
                      second = true;
                      third = false;
                      randombutton = true;
                    });
                  }),
            SizedBox(height: 20.0),
            third
                ? _buildSelectedOption("Stay healthy")
                : _buildUnselectedOption("Stay healthy", () {
                    setState(() {
                      first = false;
                      second = false;
                      third = true;
                      randombutton = true;
                    });
                  }),
            Spacer(),
            GestureDetector(
              onTap: randombutton
                  ? () {
                      // Navigate to UserAgeSetup screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BudgetSetup()),
                      );
                    }
                  : null, // Button remains disabled if randombutton is false
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: randombutton
                      ? const Color.fromARGB(255, 21, 104, 11)
                      : const Color(0xffeaebef),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color:
                          randombutton ? Colors.white : const Color(0xff7d8592),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper methods to avoid repetitive code for budget options
  Widget _buildSelectedOption(String text) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 21, 104, 11), width: 2.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildUnselectedOption(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffb9bec7), width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

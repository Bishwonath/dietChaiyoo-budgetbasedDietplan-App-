import 'package:diet_chaiyoo/view/Select_Packages_View.dart';
import 'package:diet_chaiyoo/view/User_Agesetup_View.dart';
import 'package:flutter/material.dart';

class BudgetSetup extends StatefulWidget {
  const BudgetSetup({super.key});

  @override
  State<BudgetSetup> createState() => _BudgetSetupState();
}

class _BudgetSetupState extends State<BudgetSetup> {
  bool first = false, second = false, third = false, randombutton = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectPackages()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30.0,
                color: theme.hintColor,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              "Choose Your Daily \nBudget",
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColorDark,
              ),
            ),
            const SizedBox(height: 40.0),
            first
                ? _buildSelectedOption("\u20B9 Five Hundred")
                : _buildUnselectedOption("\u20B9 Five Hundred", () {
                    setState(() {
                      first = true;
                      second = false;
                      third = false;
                      randombutton = true;
                    });
                  }),
            const SizedBox(height: 20.0),
            second
                ? _buildSelectedOption("\u20B9 Seven Hundred")
                : _buildUnselectedOption("\u20B9 Seven Hundred", () {
                    setState(() {
                      first = false;
                      second = true;
                      third = false;
                      randombutton = true;
                    });
                  }),
            const SizedBox(height: 20.0),
            third
                ? _buildSelectedOption("\u20B9 Thousand +")
                : _buildUnselectedOption("\u20B9 Thousand +", () {
                    setState(() {
                      first = false;
                      second = false;
                      third = true;
                      randombutton = true;
                    });
                  }),
            const Spacer(),
            GestureDetector(
              onTap: randombutton
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserAgeSetup()),
                      );
                    }
                  : null,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: randombutton
                      ? theme.colorScheme.secondary
                      : theme.disabledColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: textTheme.labelLarge?.copyWith(
                      color: randombutton ? Colors.white : theme.hintColor,
                      fontSize: 18.0,
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

  Widget _buildSelectedOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

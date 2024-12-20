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
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            top: 50.0, left: 20.0, right: 20.0, bottom: 40.0),
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
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              "Tell us your budget plan",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40.0),
            first
                ? _buildSelectedOption("Rs .1000")
                : _buildUnselectedOption("Rs .1000", () {
                    setState(() {
                      first = true;
                      second = false;
                      third = false;
                      randombutton = true;
                    });
                  }),
            const SizedBox(height: 20.0),
            second
                ? _buildSelectedOption("Rs .700")
                : _buildUnselectedOption("Rs .700", () {
                    setState(() {
                      first = false;
                      second = true;
                      third = false;
                      randombutton = true;
                    });
                  }),
            const SizedBox(height: 20.0),
            third
                ? _buildSelectedOption("Rs .500")
                : _buildUnselectedOption("Rs .500", () {
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: randombutton
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: randombutton
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
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
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _buildUnselectedOption(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

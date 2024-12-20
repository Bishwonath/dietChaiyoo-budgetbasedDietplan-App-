import 'package:diet_chaiyoo/view/Budget_Setup_View.dart';
import 'package:diet_chaiyoo/view/Sigup_View.dart';
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
        margin: const EdgeInsets.only(
            top: 50.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpView()),
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
              "Choose Your Goal",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40.0),
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
            const SizedBox(height: 20.0),
            second
                ? _buildSelectedOption("Lose Weight")
                : _buildUnselectedOption("Lose Weight", () {
                    setState(() {
                      first = false;
                      second = true;
                      third = false;
                      randombutton = true;
                    });
                  }),
            const SizedBox(height: 20.0),
            third
                ? _buildSelectedOption("Stay Healthy")
                : _buildUnselectedOption("Stay Healthy", () {
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
                            builder: (context) => const BudgetSetup()),
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

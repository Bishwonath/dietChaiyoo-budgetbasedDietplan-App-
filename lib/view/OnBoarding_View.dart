import 'package:diet_chaiyoo/view/Sigup_View.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  final List<Introduction> list = const [
    Introduction(
      title: 'Fashion Store',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/diet cahiyoo logo.png',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and delivered',
      imageUrl: 'assets/images/diet cahiyoo logo.png',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/diet cahiyoo logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        backgroundColor: const Color(0xFFf9f9f9),
        foregroundColor: const Color(0xFFFFAA00),
        introductionList: list,
        onTapSkipButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpView()),
          );
        },
        skipTextStyle: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Introduction {
  final String title;
  final String subTitle;
  final String imageUrl;

  const Introduction({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });
}

class IntroScreenOnboarding extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final List<Introduction> introductionList;
  final VoidCallback onTapSkipButton;
  final TextStyle skipTextStyle;

  const IntroScreenOnboarding({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.introductionList,
    required this.onTapSkipButton,
    required this.skipTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: introductionList.length,
              itemBuilder: (context, index) {
                final intro = introductionList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(intro.imageUrl),
                    const SizedBox(height: 16),
                    Text(
                      intro.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: foregroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      intro.subTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
          TextButton(
            onPressed: onTapSkipButton,
            child: Text("Skip", style: skipTextStyle),
          ),
        ],
      ),
    );
  }
}

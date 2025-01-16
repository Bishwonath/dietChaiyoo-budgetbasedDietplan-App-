import 'package:diet_chaiyoo/core/app_theme/app_theme.dart';
import 'package:diet_chaiyoo/view/Sigup_View.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getapplicationTheme(),
      home: const Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  final List<Introduction> list = const [
    Introduction(
      title: 'Personalized Meal Ideas',
      subTitle:
          'Get tailored meal suggestions based on your preferences and budget.',
      imageUrl: 'assets/images/onboarding1.png',
    ),
    Introduction(
      title: 'Dietary Preferences and Support',
      subTitle: 'Plan meals and manage your expenses effortlessly.',
      imageUrl: 'assets/images/onboarding2.png',
    ),
    Introduction(
      title: 'Analytics and Tracking',
      subTitle:
          'Track your food habits and spending patterns to make smarter choices.',
      imageUrl: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({}),
        introductionList: list,
        onTapSkipButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpView(),
            ),
          );
        },
        skipTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

class IntroScreenOnboarding extends StatefulWidget {
  final Color backgroundColor;
  final Color? foregroundColor;
  final List<Introduction> introductionList;
  final VoidCallback onTapSkipButton;
  final TextStyle? skipTextStyle;

  const IntroScreenOnboarding({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.introductionList,
    required this.onTapSkipButton,
    required this.skipTextStyle,
  });

  @override
  _IntroScreenOnboardingState createState() => _IntroScreenOnboardingState();
}

class _IntroScreenOnboardingState extends State<IntroScreenOnboarding> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.introductionList.length,
              itemBuilder: (context, index) {
                final intro = widget.introductionList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(intro.imageUrl),
                    const SizedBox(height: 16),
                    Text(
                      intro.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: widget.foregroundColor,
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
          if (_currentPage ==
              widget.introductionList.length -
                  1) // Show "Skip" only on the last slide
            TextButton(
              onPressed: widget.onTapSkipButton,
              child: Text("Skip", style: widget.skipTextStyle),
            ),
        ],
      ),
    );
  }
}

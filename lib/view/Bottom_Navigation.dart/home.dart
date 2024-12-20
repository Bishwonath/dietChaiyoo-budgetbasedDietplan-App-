import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       icon: Icon(Icons.search, color: Colors.grey),
              //       hintText: "Search...",
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: [
                        _buildHeaderSliderItem(
                            title: "Restaurant", subtitle: "Recommendations"),
                        _buildHeaderSliderItem(
                            title: "Personalised", subtitle: "Meal Plans"),
                        _buildHeaderSliderItem(title: "Diet", subtitle: "Plan"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.0,
                        width: _currentPage == index ? 16.0 : 8.0,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.purple
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hot Nutritional sales",
                    style: TextStyle(
                      fontFamily: "Montserrat Bold",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle "Browse More" click
                    },
                    child: const Text(
                      "Browse More",
                      style: TextStyle(
                        color: Color.fromARGB(255, 34, 32, 34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTrendingCard(
                      title: "Budget-Friendly Vegan Meal Plan",
                      artist: "Balanced Nutrition",
                      price: "Rs 499", // Price for the meal plan
                    ),
                    _buildTrendingCard(
                      title: "High-Protein Meal Plan",
                      artist: "Protein Power",
                      price: "Rs 399", // Price for the meal plan
                    ),
                    _buildTrendingCard(
                      title: "Customizable Keto Plan",
                      artist: "Keto Master",
                      price: "Rs 399", // Price for the meal plan
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "New Releases",
                style: TextStyle(
                  fontFamily: "Montserrat Bold",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTrendingCard(
                      title: "Beginner's Fitness Plan",
                      artist: "FitStart",
                      price: "Rs 499", // Price for the fitness plan
                    ),
                    _buildTrendingCard(
                      title: "Home Workout Routine",
                      artist: "Body Sculpt",
                      price: "Rs 399", // Price for the fitness plan
                    ),
                    _buildTrendingCard(
                      title: "Yoga for Flexibility",
                      artist: "Zen Fitness",
                      price: "Rs 399", // Price for the fitness plan
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Exercise Routines",
                style: TextStyle(
                  fontFamily: "Montserrat Bold",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/onboarding1.png'),
                  ),
                  title: const Text(
                    "Push ups",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "A push-up is a calisthenics exercise that works your upper body and core",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View Techniques",
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 15, 16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.withOpacity(0.2),
          child: Icon(icon, color: Colors.purple),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }

  Widget _buildTrendingCard({
    required String title,
    required String artist,
    required String price,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/onboarding2.png',
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(artist,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(color: Colors.purple)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSliderItem({
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          "$title\n$subtitle",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

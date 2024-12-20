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
                            title: "Foeseal", subtitle: "EDM Artist"),
                        _buildHeaderSliderItem(
                            title: "Maya Gurung", subtitle: "Melody Innovator"),
                        _buildHeaderSliderItem(
                            title: "Ram", subtitle: "EDM Artist"),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     _buildNavItem(Icons.music_note, "Music"),
              //     _buildNavItem(Icons.palette, "Art"),
              //     _buildNavItem(Icons.shopping_bag, "Merch"),
              //     _buildNavItem(Icons.event, "Events"),
              //   ],
              // ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Tracks",
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
                        color: Colors.purple,
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
                        title: "Bimbaaakash",
                        artist: "Bartika Rai",
                        price: "Rs 499"),
                    _buildTrendingCard(
                        title: "Atti Bhayo",
                        artist: "Albatross",
                        price: "Rs 399"),
                    _buildTrendingCard(
                        title: "Gantabya",
                        artist: "The Edge Band",
                        price: "Rs 399"),
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
                        title: "Ma Ra Malai",
                        artist: "Albatross",
                        price: "Rs 499"),
                    _buildTrendingCard(
                        title: "Atti Bhayo",
                        artist: "Albatross",
                        price: "Rs 399"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Artist Spotlight",
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
                        AssetImage('assets/images/diet cahiyoo logo.png'),
                  ),
                  title: const Text(
                    "Maya Gurung",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Blending traditional Nepalese melodies with modern arrangements. Latest album \"Valley Dreams\" out now.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View Profile",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
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
                'assets/images/diet cahiyoo logo.png',
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
          image: AssetImage('assets/images/diet cahiyoo logo.png'),
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

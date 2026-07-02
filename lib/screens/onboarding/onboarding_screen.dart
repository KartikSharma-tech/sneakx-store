import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Discover Premium Fashion",
      "subtitle": "Explore the latest sneakers and streetwear collections.",
      "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
    },
    {
      "title": "Shop Top Brands",
      "subtitle": "Nike, Adidas, Puma and more premium collections.",
      "image": "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77",
    },
    {
      "title": "Fast & Secure Shopping",
      "subtitle": "Easy payments and quick delivery at your fingertips.",
      "image": "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,

            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            itemBuilder: (context, index) {
              final item = onboardingData[index];

              return Stack(
                fit: StackFit.expand,

                children: [
                  Image.network(item["image"]!, fit: BoxFit.cover),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.2),
                          Colors.black.withValues(alpha: 0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Text(
                          item["title"]!,
                          style: AppTextStyles.heading.copyWith(fontSize: 32),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          item["subtitle"]!,
                          style: AppTextStyles.body.copyWith(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 40,
            left: 24,
            right: 24,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: List.generate(
                    onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),

                      margin: const EdgeInsets.only(right: 8),

                      width: currentIndex == index ? 28 : 10,
                      height: 10,

                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColors.primary
                            : Colors.white38,

                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    if (currentIndex == onboardingData.length - 1) {

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );

} else {

  _pageController.nextPage(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  );
}
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),

                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Text(
                      currentIndex == onboardingData.length - 1
                          ? "Start"
                          : "Next",

                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

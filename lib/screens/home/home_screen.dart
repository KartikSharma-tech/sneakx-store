import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../product/product_details_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All", "Nike", "Adidas", "Puma", "Jordan"];

  String selectedCategory = "All";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "name": "Nike Air Max",
        "price": "\$240",
        "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
        "category": "Nike",
      },
      {
        "name": "Adidas Ultraboost",
        "price": "\$180",
        "image": "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519",
        "category": "Jordan",
      },
      {
        "name": "Puma RS-X",
        "price": "\$150",
        "image": "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77",
        "category": "Adidas",
      },
      {
        "name": "Jordan Retro",
        "price": "\$320",
        "image": "https://images.unsplash.com/photo-1514996937319-344454492b37",
        "category": "Puma",
      },
    ];
    final filteredProducts = products.where((product) {
      final matchesCategory =
          selectedCategory == "All" || product["category"] == selectedCategory;

      final matchesSearch = product["name"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Hello Kartik 👋", style: AppTextStyles.body),

                      const SizedBox(height: 6),

                      Text(
                        "Discover Premium Fashion",
                        style: AppTextStyles.subHeading,
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Icon(
                      Iconsax.notification,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // SEARCH BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),

                height: 58,

                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [
                    const Icon(Iconsax.search_normal, color: Colors.grey),

                    const SizedBox(width: 12),

                    Text("Search sneakers...", style: AppTextStyles.body),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // BANNER
              Container(
                height: 190,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),

                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),

                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.85),
                      ],

                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text("New Collection", style: AppTextStyles.heading),

                      const SizedBox(height: 10),

                      Text(
                        "Nike Summer 2026",
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),

                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: TextField(
                  controller: searchController,

                  style: const TextStyle(color: Colors.white),

                  decoration: const InputDecoration(
                    border: InputBorder.none,

                    hintText: "Search sneakers...",

                    hintStyle: TextStyle(color: Colors.grey),

                    icon: Icon(Icons.search, color: Colors.grey),
                  ),

                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                height: 45,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: categories.length,

                  itemBuilder: (context, index) {
                    final category = categories[index];

                    final bool isSelected = selectedCategory == category;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.only(right: 14),

                        padding: const EdgeInsets.symmetric(horizontal: 20),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.cardColor,

                          borderRadius: BorderRadius.circular(16),
                        ),

                        alignment: Alignment.center,

                        child: Text(
                          category,

                          style: AppTextStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),
              const SizedBox(height: 30),

              // CATEGORY TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Categories", style: AppTextStyles.subHeading),

                  Text(
                    "See All",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // CATEGORY LIST
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    buildCategory("Sneakers"),
                    buildCategory("Hoodies"),
                    buildCategory("Jackets"),
                    buildCategory("Caps"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // FEATURED TITLE
              Text("Featured Products", style: AppTextStyles.subHeading),

              const SizedBox(height: 20),

              // PRODUCT GRID
              GridView.builder(
                itemCount: filteredProducts.length,

                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,

                  childAspectRatio: 0.62,
                ),

                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsScreen(),
                        ),
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),

                                    image: DecorationImage(
                                      image: NetworkImage(product["image"]),

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 12,
                                  top: 12,

                                  child: Container(
                                    padding: const EdgeInsets.all(8),

                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(14),
                                    ),

                                    child: const Icon(
                                      Iconsax.heart,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  product["name"],
                                  style: AppTextStyles.subHeading.copyWith(
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  product["price"],
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 14),

      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),

      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Text(
        title,
        style: AppTextStyles.body.copyWith(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({super.key});

  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/images/food.png', 'label': 'Food Delivery'},
    {'image': 'assets/images/medicine.png', 'label': 'Medicines'},
    {'image': 'assets/images/petpaw.png', 'label': 'Pet Supplies'},
    {'image': 'assets/images/box.png', 'label': 'Gifts'},
    {'image': 'assets/images/chicken.png', 'label': 'Meat'},
    {'image': 'assets/images/cosmetics.png', 'label': 'Cosmetic'},
    {'image': 'assets/images/stationary.png', 'label': 'Stationery'},
    {'image': 'assets/images/home.png', 'label': 'Stores'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true, // Allows the GridView to be used inside a Column
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 items in a row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjust for card shape
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return categoryCard(
                image: category['image'],
                label: category['label'],
                index: index);
          },
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "More",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.green),
            ],
          ),
        ),
      ],
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   final String image;
//   final String label;

//   const CategoryCard({
//     super.key,
//     required this.image,
//     required this.label,
//   });

//   @override
Widget categoryCard(
    {required final String image,
    required final String label,
    required int index}) {
  return Column(
    children: [
      Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: index < 3 || index == 7
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "10% Off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  : const SizedBox()),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
// }

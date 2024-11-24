import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/presentation/notification_page.dart';
import 'package:task_1/services/api_functions.dart';

Widget seachBar(BuildContext context) {
  final ApiFunctions controller = Get.put(ApiFunctions());
  return Row(
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                filled: true,
                border: InputBorder.none,
                hintText: 'Search for products/ stores',
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.green,
                )),
          ),
        ),
      ),
      IconButton(
          onPressed: () {
            controller.fetchNotifications();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationPage()));
          },
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.red,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.local_offer_outlined,
            color: Colors.orange,
          ))
    ],
  );
}

Widget categories(bool showMore) {
  return Container(
    color: Colors.red,
    height: 300,
    child: GridView.builder(
        itemCount: showMore ? 20 : 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return Container(
            // height: 00,
            color: Colors.yellow,
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 60,
                    color: Colors.grey,
                  ),
                ),
                const Text('....')
              ],
            ),
          );
        }),
  );
}

Widget topPicks(BuildContext context) {
  List<String> images = ['assets/images/fruitsplashimage.png'];
  return CarouselSlider.builder(
    itemCount: images.length,
    itemBuilder: (context, index, realIndex) {
      final imageUrl = images[index];
      return buildImage(imageUrl, index);
    },
    options: CarouselOptions(height: 180, viewportFraction: 1),
  );
}

Widget buildImage(String image, int index) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(1),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.green[600], // Green background
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DISCOUNT\n25% ALL\nFRUITS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text(
                    'Check Now',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              image,
              width: 150,
              fit: BoxFit.cover,
            ))
      ],
    ),
  );
}

Widget crazeDeals(BuildContext context) {
  List<String> images = ['assets/images/veg-task.png'];
  return CarouselSlider.builder(
    itemCount: images.length,
    itemBuilder: (context, index, realIndex) {
      final imageUrl = images[index];
      return buildImage(imageUrl, index);
    },
    options: CarouselOptions(height: 180, viewportFraction: 1),
  );
}

Widget trending(BuildContext context) {
  return SizedBox(
    height: 130, // Height of the ListView
    child: ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal, // Horizontal scrolling
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            card(),
            const SizedBox(
              width: 10,
            ),
            cardDetail(),
          ],
        );
      },
    ),
  );
}

Widget cardDetail() {
  return SizedBox(
    width: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const Text(
          'Mithas Bhandar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Description
        Text(
          'Sweets, North Indian\n(store location) | 6.4 kms',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        // Rating and Delivery Time
        const Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              '4.1 | 45 mins',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget card() {
  return SizedBox(
    height: 100,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset('assets/images/icecream.jpeg'),
    ),
  );
}

Widget nearby() {
  return SizedBox(
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/pan.jpeg",
                width: 87,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Freshly baker'),
                  const Text('Sweets, North Indian'),
                  const Text('Site No |6.4 km'),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Top Store',
                    ),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 5,
                    ),
                    Text('4.1')
                  ],
                ),
                Text('45 mins')
              ],
            ),
          ],
        ),
        const Column(
          children: [
            Divider(
              endIndent: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.percent_sharp,
                    color: Colors.white,
                  ),
                ),
                Text('Upto 10% off '),
                Icon(
                  Icons.verified,
                  size: 35,
                ),
                Text('3400+ items availble')
              ],
            )
          ],
        ),
      ],
    ),
  );
}

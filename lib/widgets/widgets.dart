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

Widget topPicks(BuildContext context) {
  List<String> images = ['assets/images/fruitsplashimage.png'];
  return CarouselSlider.builder(
    itemCount: images.length,
    itemBuilder: (context, index, realIndex) {
      final imageUrl = images[index];
      return buildImage(
        color: Colors.green,
        text: 'DISCOUNT\n25% ALL\nFRUITS',
        image: imageUrl,
        index: index,
        button: true,
      );
    },
    options: CarouselOptions(height: 180, viewportFraction: 1),
  );
}

Widget crazeDeals(BuildContext context) {
  List<String> images = ['assets/images/veg-task.png'];
  return CarouselSlider.builder(
    itemCount: images.length,
    itemBuilder: (context, index, realIndex) {
      final imageUrl = images[index];
      return buildImage(
        color: Colors.black,
        text: 'Customer favorate \nTop supermarket',
        image: imageUrl,
        index: index,
        button: false,
      );
    },
    options: CarouselOptions(height: 180, viewportFraction: 1),
  );
}

Widget buildImage(
    {required String image,
    required int index,
    required Color color,
    required String text,
    required bool button}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(1),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: color, // Green background
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              button
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        'Check Now',
                        style: TextStyle(color: Colors.white),
                      ))
                  : TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Explore',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.orange,
                          )
                        ],
                      ))
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
                  const Text(
                    'Freshly baker',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
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
      ],
    ),
  );
}

Widget divider() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Divider(
        thickness: 1,
        color: Colors.black,
        indent: 90, // Add spacing on the left side
        endIndent: 10, // Add spacing on the right side
      ),
      Padding(
        padding: EdgeInsets.only(left: 90),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Icon(
                size: 15,
                Icons.percent_sharp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Upto 10% off ',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.verified,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '3400+ items availble',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            )
          ],
        ),
      )
    ],
  );
}

Widget refer() {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xFF29D177),
        borderRadius: BorderRadius.circular(10)),
    width: double.infinity,
    height: 150,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
            // width: 230,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Refer & Earn',
              style: TextStyle(
                fontFamily: 'Quicksand', // Font family
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 17.5 / 14,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  'Invite your friends & earn 15% off',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 17.5 / 14,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        )),
        Image.asset(
          'assets/images/refer.png',
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:task_1/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      seachBar(context),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'What would you like to do today? ',
        style: TextStyle(fontSize: 25),
      ),
      const SizedBox(
        height: 10,
      ),
      // categories(false),
      const SizedBox(
        height: 10,
      ),
      const Text('Top picks for you ', style: TextStyle(fontSize: 25)),
      topPicks(context),
      const SizedBox(
        height: 10,
      ),
      const Text('Trending ', style: TextStyle(fontSize: 25)),
      trending(context),
      const SizedBox(
        height: 10,
      ),
      const SizedBox(
        height: 10,
      ),
      trending(context),
      const SizedBox(
        height: 10,
      ),
      const Text('Craze Deals ', style: TextStyle(fontSize: 25)),
      crazeDeals(context),
      const SizedBox(
        height: 10,
      ),
      const Text('Nearby stores ', style: TextStyle(fontSize: 25)),
      const SizedBox(
        height: 20,
      ),
      nearby(),
      const SizedBox(
        height: 20,
      ),
      nearby(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.place,
          color: Colors.green,
        ),
        title: const Text('ABCD, New Delhi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}

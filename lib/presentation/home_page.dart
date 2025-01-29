import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_1/widgets/catogories.dart';
import 'package:task_1/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> widgetList = [
      // search Bar in appBar UI
      searchBar(context, ref),
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
      CategoryGrid(),
      const SizedBox(
        height: 10,
      ),
      const Text('Top picks for you ', style: TextStyle(fontSize: 25)),
      // top picks widget in UI to show top picks of items
      topPicks(context),
      const SizedBox(
        height: 10,
      ),
      const Text('Trending ', style: TextStyle(fontSize: 25)),
      // widgets to show trending items returns a widget
      trending(context),
      trending(context),
      const SizedBox(
        height: 10,
      ),
      const Text('Craze Deals ', style: TextStyle(fontSize: 25)),
      // widgets to show creazedeals items returns a widget
      crazeDeals(context),
      const SizedBox(
        height: 50,
      ),
      // refer widget
      refer(),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Nearby stores ', style: TextStyle(fontSize: 25)),
          TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ))
        ],
      ),
      const SizedBox(
        height: 20,
      ),

// shows nearby stores in UI
      nearby(),
      // devider in between
      divider(),
      const SizedBox(
        height: 20,
      ),
      // shows nearby stores in UI
      nearby(),
      divider(),
      const SizedBox(
        height: 50,
      ),
      // to view all stores available click here
      button()
    ];
    List<BottomNavigationBarItem> items =  [
      BottomNavigationBarItem(icon: Image.asset('assets/images/Group.png', width: 24, height: 24), label: 'Home'),
      BottomNavigationBarItem(icon: Image.asset('assets/images/Group 201.png', width: 24, height: 24), label: 'Category'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/Group 197.png', width: 24, height: 24), label: 'Cart'),
      BottomNavigationBarItem(icon:Image.asset('assets/images/Group 196.png', width: 24, height: 24),label: 'Profile')
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.place,
          color: Colors.green,
        ),
        title: const Text('ABCD, New Delhi'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 110),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: 0,
        selectedItemColor:const Color(0xFF7D7D7D),
        unselectedItemColor:const Color(0xFF7D7D7D),
        showUnselectedLabels: true,
      ),
    );
  }
}

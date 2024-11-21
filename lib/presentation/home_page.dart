import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.place,
          color: Colors.green,
        ),
        title: const Text('ABCD, New Delhi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widgetList,
        ),
      ),
    );
  }

  final List<Widget> widgetList = [];
  Widget seachBar(){
    return Row(children: [
      TextFormField(),
      IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: Colors.red,))
    ],);
  }
  Widget categories() {
    return Container();
  }
}

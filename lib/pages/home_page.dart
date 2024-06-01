// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeui/util/coffee._tile.dart';
import 'package:coffeeui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee type
  final List coffeeType = [
    // [coffee type, is selected]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 17,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.home),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.favorite),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.notifications),
            ),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Find the best coffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                )),
          ),

          SizedBox(
            height: 25,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          // horizontal listview of coffee types
          Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (
                    contex,
                    index,
                  ) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      },
                    );
                  })),

          // Horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.png',
                  coffeeName: 'Latte',
                  coffeePrice: '69',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cappuccino.png',
                  coffeeName: 'cappucino',
                  coffeePrice: '69',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/milk.png',
                  coffeeName: 'Tea',
                  coffeePrice: '69',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

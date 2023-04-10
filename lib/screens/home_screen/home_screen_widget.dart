import 'package:flutter/material.dart';

import '../../models/Pizza_model.dart';
import '../../models/burger_model.dart';
import '../../models/drinks_model.dart';
import '../../models/momo_model.dart';
import '../../utils/categories.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<String> category = ["Burgers", "Pizza", "Momos", "Drinks"];

  List<Pizza> pizzas = [
    Pizza(
        imageId:
            'https://img.freepik.com/premium-vector/top-view-pepperoni-pizza-with-delicious-ingredients-chrome-yellow-background-3d-illustration_317442-845.jpg?w=740',
        itemName: 'Peporoni Pizza',
        price: 25.0),
    Pizza(
        imageId: 'https://www.dominos.co.in/files/items/Mexican_Green_Wave.jpg',
        itemName: 'Mexican Green',
        price: 12.0),
    Pizza(
        imageId: 'https://www.dominos.co.in/files/items/Veg_Extravaganz.jpg',
        itemName: 'Veg Extra',
        price: 15.0),
    Pizza(
        imageId:
            'https://www.dominos.co.in/files/items/MicrosoftTeams-image_(13).png',
        itemName: 'Non-Veg Supreme',
        price: 18.0),
  ];

  List<Burger> burgers = [
    Burger(
        imageId:
            'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20230313180446431450_482x264jpg',
        itemName: 'Burst Burger',
        price: 1.10),
    Burger(
        imageId:
            'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20220314070554598878_482x264jpg',
        itemName: 'Double Patty',
        price: 1.16),
    Burger(
        imageId:
            'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20220613173148817999_482x264jpg',
        itemName: 'Crispy Veg',
        price: 0.85),
    Burger(
        imageId:
            'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20221115131214374090_482x264jpg',
        itemName: 'Chicken Burger',
        price: 1.82),
  ];

  List<Momo> momos = [
    Momo(
        imageId:
            'https://b.zmtcdn.com/data/pictures/chains/0/21060/18df05cee503aafc336f9a809fad79a3.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A',
        itemName: 'Stream Momo',
        price: 2.18),
    Momo(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/1d2/719e7565c20d832a2d63339b561af1d2.jpg?fit=around|130:130&crop=130:130;*,*',
        itemName: 'Veg Chilly Momo',
        price: 3.04),
    Momo(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/d87/6d084d06270cb0347ede5e26be222d87.jpg?fit=around|130:130&crop=130:130;*,*',
        itemName: 'Chicken Cheese Momo',
        price: 3.23),
    Momo(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/84b/a5e4e353609cf2a85df363325cec584b.jpg?fit=around|130:130&crop=130:130;*,*',
        itemName: 'Paneer Momo',
        price: 2.06),
  ];

  List<Drink> drinks = [
    Drink(
        'https://b.zmtcdn.com/data/dish_photos/669/f66ce8da982ad3cb046c6fc5d6edf669.jpg',
        'Thumps Up',
        1.83),
    Drink(
        'https://b.zmtcdn.com/data/dish_photos/cf1/045000c0af348548f55559bf6c7d2cf1.jpg',
        'Pepsi',
        1.83),
    Drink(
        'https://b.zmtcdn.com/data/dish_photos/0dd/ac21befe3de31c2f25763113931ee0dd.jpg?fit=around|130:130&crop=130:130;*,*',
        'Coke',
        0.84),
    Drink(
        'https://b.zmtcdn.com/data/dish_photos/4d6/fb1b4e468e4f859ce9550358800f24d6.jpg?fit=around|130:130&crop=130:130;*,*',
        'Red Bull',
        2.06),
  ];

  String selectedCategory = 'Burgers';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                'Assets/promo.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // categories

          Container(
            height: 50,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      final isCategorySelected =
                          selectedCategory == category[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GestureDetector(
                          onTap: () {
                            print("Option selected ${category[index]}");

                            setState(() {
                              selectedCategory = category[index];
                            });
                          },
                          child: Chip(
                            label: Text(category[index]),
                            backgroundColor: (isCategorySelected)
                                ? Colors.orange
                                : Colors.orange[200],
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),

          // food section

          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (selectedCategory == 'Pizza') {
                    return foodItems(pizzas[index].imageId,
                        pizzas[index].itemName, pizzas[index].price);
                  } else if (selectedCategory == 'Burgers') {
                    return foodItems(burgers[index].imageId,
                        burgers[index].itemName, burgers[index].price);
                  } else if (selectedCategory == 'Momos') {
                    return foodItems(momos[index].imageId,
                        momos[index].itemName, momos[index].price);
                  } else if (selectedCategory == 'Drinks') {
                    return foodItems(drinks[index].imageId,
                        drinks[index].itemName, drinks[index].price);
                  } else {
                    return SizedBox.shrink();
                  }
                }),
          ),
        ],
      ),
    );
  }
}

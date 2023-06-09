import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen/product_detail_screen.dart';

import '../../models/Pizza_model.dart';
import '../../models/burger_model.dart';
import '../../models/drinks_model.dart';
import '../../models/momo_model.dart';
import '../../models/product_model.dart';
import '../../utils/categories.dart';

class HomePage extends StatefulWidget {
  List<Product> cartItems = [];
  // final bool isDark;
  HomePage({super.key, required this.cartItems});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category = ["Burgers", "Pizza", "Momos", "Drinks"];

  // void _addToWishlist(Product item) {
  //   setState(() {});
  // }

  void addToCart(Product item) {
    widget.cartItems.add(item);
  }

  List<Pizza> pizzas = [
    Pizza(
      imageId:
          'https://img.freepik.com/premium-vector/top-view-pepperoni-pizza-with-delicious-ingredients-chrome-yellow-background-3d-illustration_317442-845.jpg?w=740',
      itemName: 'Peporoni Pizza',
      price: 25.0,
      description:
          'A classic American taste! Relish the delectable flavor of Chicken Pepperoni, topped with extra cheese',
    ),
    Pizza(
      imageId: 'https://www.dominos.co.in/files/items/Mexican_Green_Wave.jpg',
      itemName: 'Mexican Green',
      price: 12.0,
      description:
          'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.',
    ),
    Pizza(
      imageId: 'https://www.dominos.co.in/files/items/Veg_Extravaganz.jpg',
      itemName: 'Veg Extra',
      price: 15.0,
      description:
          'A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, juicyfresh tomatoes and jalapeno - with extra cheese to go all around.',
    ),
    Pizza(
      imageId:
          'https://www.dominos.co.in/files/items/MicrosoftTeams-image_(13).png',
      itemName: 'Non-Veg',
      price: 18.0,
      description:
          'Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers',
    ),
  ];

  List<Burger> burgers = [
    Burger(
      imageId:
          'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20230313180446431450_482x264jpg',
      itemName: 'Burst Burger',
      price: 1.10,
      description:
          'An extraordinary classic burger, overloaded with love and cheese and topped with onion and lettuce. Feel the cheese burst with every bite.',
    ),
    Burger(
      imageId:
          'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20220314070554598878_482x264jpg',
      itemName: 'Double Patty',
      price: 1.16,
      description: 'Double up our best selling crispy veg burger',
    ),
    Burger(
      imageId:
          'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20220613173148817999_482x264jpg',
      itemName: 'Crispy Veg',
      price: 0.85,
      description:
          'our best selling burger with crispy veg patty , fresh onion and our signature Sauce',
    ),
    Burger(
      imageId:
          'https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20221115131214374090_482x264jpg',
      itemName: 'Chicken Burger',
      price: 1.82,
      description:
          'Tasty chicken wrapped in a special crisp coating, topped with iceberg lettuce, creamy mayo and crowned with a toasted sesame seed bun.',
    ),
  ];

  List<Momo> momos = [
    Momo(
      imageId:
          'https://b.zmtcdn.com/data/pictures/chains/0/21060/18df05cee503aafc336f9a809fad79a3.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A',
      itemName: 'Stream Momo',
      price: 2.18,
      description: '',
    ),
    Momo(
      imageId:
          'https://b.zmtcdn.com/data/dish_photos/1d2/719e7565c20d832a2d63339b561af1d2.jpg?fit=around|130:130&crop=130:130;*,*',
      itemName: 'Veg Chilly Momo',
      price: 3.04,
      description: '',
    ),
    Momo(
      imageId:
          'https://b.zmtcdn.com/data/dish_photos/d87/6d084d06270cb0347ede5e26be222d87.jpg?fit=around|130:130&crop=130:130;*,*',
      itemName: 'Chicken Cheese Momo',
      price: 3.23,
      description: '',
    ),
    Momo(
      imageId:
          'https://b.zmtcdn.com/data/dish_photos/84b/a5e4e353609cf2a85df363325cec584b.jpg?fit=around|130:130&crop=130:130;*,*',
      itemName: 'Paneer Momo',
      price: 2.06,
      description: '',
    ),
  ];

  List<Drink> drinks = [
    Drink(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/669/f66ce8da982ad3cb046c6fc5d6edf669.jpg',
        itemName: 'Thumps Up',
        price: 1.83,
        description: ''),
    Drink(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/cf1/045000c0af348548f55559bf6c7d2cf1.jpg',
        itemName: 'Pepsi',
        price: 1.83,
        description: ''),
    Drink(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/0dd/ac21befe3de31c2f25763113931ee0dd.jpg?fit=around|130:130&crop=130:130;*,*',
        itemName: 'Coke',
        price: 0.84,
        description: ''),
    Drink(
        imageId:
            'https://b.zmtcdn.com/data/dish_photos/4d6/fb1b4e468e4f859ce9550358800f24d6.jpg?fit=around|130:130&crop=130:130;*,*',
        itemName: 'Red Bull',
        price: 2.06,
        description: ''),
  ];

  String selectedCategory = 'Burgers';

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: (widget.isDark) ? Colors.black : Colors.white,
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
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      imageId: pizzas[index].imageId,
                                      itemName: pizzas[index].itemName,
                                      itemDescription:
                                          pizzas[index].description,
                                      price: pizzas[index].price,
                                      addToCart: (item) => addToCart(item),
                                    )));
                      },
                      child: foodItems(pizzas[index].imageId,
                          pizzas[index].itemName, pizzas[index].price),
                    );
                  } else if (selectedCategory == 'Burgers') {
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      imageId: burgers[index].imageId,
                                      itemName: burgers[index].itemName,
                                      itemDescription:
                                          burgers[index].description,
                                      price: burgers[index].price,
                                      addToCart: (item) => addToCart(item),
                                    )));
                      },
                      child: Container(
                        child: foodItems(
                          burgers[index].imageId,
                          burgers[index].itemName,
                          burgers[index].price,
                        ),
                      ),
                    );
                  } else if (selectedCategory == 'Momos') {
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      imageId: momos[index].imageId,
                                      itemName: momos[index].itemName,
                                      itemDescription: momos[index].description,
                                      price: momos[index].price,
                                      addToCart: (item) => addToCart(item),
                                    )));
                      },
                      child: foodItems(momos[index].imageId,
                          momos[index].itemName, momos[index].price),
                    );
                  } else if (selectedCategory == 'Drinks') {
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      imageId: drinks[index].imageId,
                                      itemName: drinks[index].itemName,
                                      itemDescription:
                                          drinks[index].description,
                                      price: drinks[index].price,
                                      addToCart: (item) => addToCart(item),
                                    )));
                      },
                      child: foodItems(drinks[index].imageId,
                          drinks[index].itemName, drinks[index].price),
                    );
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

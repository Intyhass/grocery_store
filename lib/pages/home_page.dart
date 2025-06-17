import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/components/grocery_item_tile.dart';
import 'package:grocery_store/models/cart_model.dart';
import 'package:grocery_store/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
              ),
            ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            //good morning
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good morning,'),
            ),
            SizedBox(height: 4),
            //lets order fresh items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            //divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 4),
            ),

            //fresh items + grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Fresh items", style: TextStyle(fontSize: 16)),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

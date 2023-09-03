import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/models/cart.dart';
import 'package:flutter_coffe_shop/models/coffee.dart';
import 'package:flutter_coffe_shop/pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Row(
              children: [
                Image.asset(
                  "images/logo.png",
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "  Kahveni nasıl içmeyi seversin?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: ListView.builder(
            itemCount: value.coffee.length,
            itemBuilder: (context, index) {
              Coffee eachCoffee = value.coffee[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(eachCoffee.name),
                    subtitle: Text(eachCoffee.price),
                    leading: Image.asset(
                      eachCoffee.image,
                      width: 100,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(coffee: eachCoffee,),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

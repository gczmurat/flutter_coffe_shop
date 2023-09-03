import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/models/cart.dart';
import 'package:flutter_coffe_shop/models/coffee.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee){
    Provider.of<Cart>(context, listen: false).removeFromCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
                child: Text(
              "Sepet 🛒",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.coffee.length,
              itemBuilder: (context, index) {
                Coffee coffee = value.coffee[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(coffee.name),
                      subtitle: Text("${coffee.price}"),
                      leading: Image.asset(coffee.image),
                      trailing: IconButton(onPressed: () => removeFromCart(coffee), icon: Icon(Icons.delete,color: Colors.grey.shade600,)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/components/size.dart';
import 'package:flutter_coffe_shop/models/cart.dart';
import 'package:flutter_coffe_shop/models/coffee.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  Coffee coffee;
  OrderPage({super.key, required this.coffee});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantityCount = 1;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }
  void addToCart() {
    Provider.of<Cart>(context, listen: false).addToCart(widget.coffee);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade600,
        title: Center(
            child: Text(
          "Sepete Eklendi",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Image.asset(
              widget.coffee.image,
              height: 250,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "A D E T",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.grey.shade600,
                  size: 50,
                ),
                onPressed: decrementQuantity,
              ),
              SizedBox(width: 20), // Iconlardan biraz uzaklık ekledik
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    quantityCount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20), // Iconlardan biraz uzaklık ekledik
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.grey.shade600,
                  size: 50,
                ),
                onPressed: incrementQuantity,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "B O Y U T",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizeRow(),
          SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: addToCart,
              child: Container(
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Sepete Ekle",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 18),
                    ),
                  )))
        ],
      ),
    );
  }
}

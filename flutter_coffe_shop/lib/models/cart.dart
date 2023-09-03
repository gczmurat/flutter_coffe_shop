import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/models/coffee.dart';

class Cart extends ChangeNotifier {
  final List<Coffee> _coffee = [
    Coffee(name: "Espresso", price: "75 TL", image: "images/espresso.png"),
    Coffee(name: "Iced Latte", price: "80 TL", image: "images/iced.png"),
    Coffee(name: "Latte", price: "70 TL", image: "images/latte.png"),
    Coffee(name: "Long Black", price: "75 TL", image: "images/long_black.png"),
  ];
  final List<Coffee> _userCart = [];

  List<Coffee> get coffee => _coffee;
  List<Coffee> get userCart => _userCart;

  void addToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}

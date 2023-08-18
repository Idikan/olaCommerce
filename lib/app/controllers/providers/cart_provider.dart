import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/my_product.dart';

class CartProvider extends ChangeNotifier{
  final List<MyProduct> _cart = [];

  List<MyProduct> get cart => _cart;

  void toggleProduct(MyProduct product){//AddOrRemoveProduct
    if(_cart.contains(product)){
     for(MyProduct element in _cart){
       element.productQuantity++;
     }
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  incrementQuantity(index) => _cart[index].productQuantity++;
  decrementQuantity(index) => _cart[index].productQuantity++;

  getTotalPrice(){
    double total = 0.0;
    for(MyProduct element in _cart){
      total += element.productPrice * element.productQuantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context,{
    bool listen = true,
  }){
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
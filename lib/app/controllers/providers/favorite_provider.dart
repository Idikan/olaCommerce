import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/my_product.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<MyProduct> _favorite = [];

  List<MyProduct> get favorites => _favorite;

  void toggleFavorite(MyProduct product){//AddOrRemoveProduct
    if(_favorite.contains(product)){
      _favorite.remove(product);
    } else {
      _favorite.add(product);
    }

    notifyListeners();
  }

  bool isExist(MyProduct product){
    final isExist = _favorite.contains(product);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context,{
    bool listen = true,
}){
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
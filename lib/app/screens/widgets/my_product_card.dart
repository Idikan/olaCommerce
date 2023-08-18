import 'package:flutter/material.dart';
import 'package:ola_commerce/app/controllers/providers/favorite_provider.dart';
import 'package:ola_commerce/app/models/my_product.dart';

class MyProductCard extends StatefulWidget {
  const MyProductCard({Key? key, required this.myProduct}) : super(key: key);
  final MyProduct myProduct;

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.sizeOf(context).width;
    final provider = FavoriteProvider.of(context);

    return Container(
      width: myWidth * 0.5,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: ()=> provider.toggleFavorite(widget.myProduct),
                  child: Icon(
                    provider.isExist(widget.myProduct) ? Icons.favorite :
                    Icons.favorite_outline, color: Colors.red,))],),
      SizedBox(
        height: 3,),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.myProduct.productImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 4,),
          Text(
            widget.myProduct.productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14, color: Colors.red
            ),
          ),
          Text(
            widget.myProduct.productCategory,
            style: const TextStyle(
              fontSize: 14, color: Colors.black
            ),
          ),
          Text(
            "\$ ${widget.myProduct.productPrice}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}

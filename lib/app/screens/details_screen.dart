import 'package:flutter/material.dart';
import 'package:ola_commerce/app/models/my_product.dart';
import 'package:ola_commerce/app/screens/widgets/available_size.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.myProduct}) : super(key: key);
  final MyProduct myProduct;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.asset(widget.myProduct.productImage, fit: BoxFit.contain,),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.myProduct.productName.toUpperCase(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                    Text("\$ ${widget.myProduct.productPrice}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                  ],
                ),
                SizedBox(height: 14,),
                Text(widget.myProduct.productDescription),
                const SizedBox(height: 14,),
                const Text("Available Size",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
                const SizedBox(height: 14,),
                const Row(
                  children: [
                    AvailableSize(size: "NG 1"),
                    AvailableSize(size: "NG 4"),
                    AvailableSize(size: "NG 6"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
          //color: Colors.red,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: myWidth /10,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ ${widget.myProduct.productPrice}",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.send), label: const Text("Add to Cart"))
              ],
            ),
          ),
        ),
    );
  }
}

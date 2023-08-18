import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controllers/providers/cart_provider.dart';

class CartDetailsScreen extends StatefulWidget {
  const CartDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    _buildProductQuantity(IconData icon, int index){
      return GestureDetector(
        onTap: (){
          icon == Icons.add ? provider.incrementQuantity(index)
          : provider.decrementQuantity(index);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade100,
          ),
          child: Icon(icon, size: 19,),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index){
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context){
                            finalList[index].productQuantity = 1;
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        finalList[index].productName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("\$ ${finalList[index].productPrice}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold
                        ),),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red.shade100,
                        backgroundImage: AssetImage(finalList[index].productImage),
                      ),
                      trailing: Column(
                        children: [
                          _buildProductQuantity(Icons.add, index),
                        //  const SizedBox(height: 4,),
                          Text(finalList[index].productQuantity.toString(),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      //    const SizedBox(height: 4,),
                          _buildProductQuantity(Icons.remove, index),
                        ],
                      ),
                      tileColor: Colors.white54,
                    ),
                  );
                })),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${provider.getTotalPrice()}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.send),
              label: const Text("Check out"),)
            ],
          ),
        ),
      ],),
    );
  }
}

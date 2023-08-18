import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ola_commerce/app/screens/details_screen.dart';

import '../controllers/providers/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 20),
            child: Text("Favorites",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                  itemBuilder: (context, index){
            return Padding( 
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:
                (_)=> DetailsScreen(myProduct: finalList[index]))),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context){
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
                    subtitle: Text(
                      finalList[index].productDescription,
                      style: const TextStyle(
                          fontSize: 14,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red.shade100,
                      backgroundImage: AssetImage(finalList[index].productImage),
                    ),
                    trailing: Text("\$ ${finalList[index].productPrice}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                      ),),
                    tileColor: Colors.white54,
                  ),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}

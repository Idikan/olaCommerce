import 'package:flutter/material.dart';
import 'package:ola_commerce/app/models/my_products.dart';
import 'package:ola_commerce/app/screens/details_screen.dart';
import 'package:ola_commerce/app/screens/widgets/my_product_card.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({Key? key}) : super(key: key);

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    //double myWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCategory(index: 0, name: "All Products"),
                  _buildProductCategory(index: 1, name: "Bibles"),
                  _buildProductCategory(index: 2, name: "Femi's Books"),
                  _buildProductCategory(index: 3, name: "Matthew's Books"),
                ],
              ),
            ),
            SizedBox(
              height: 25,),
            Expanded(child:
            isSelected == 0 ? _buildAllProducts():
            isSelected == 1 ? _buildBibleProducts():
            isSelected == 2 ? _buildFemiProducts() :
                _buildMatthewsProducts(),),
          ],
        ),
      ),
    );
  }

  _buildProductCategory({required int index, required String name})=> GestureDetector(
    onTap: ()=> setState(()=> isSelected = index),
    child: Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected == index ? Colors.red : Colors.red.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(name,
        style: const TextStyle(color: Colors.white),),
    ),
  );


  //allBooks
  _buildAllProducts() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100/140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
      ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context, index) {
        final product = MyProducts.allProducts[index];

        return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(myProduct: product))),
            child: MyProductCard(myProduct: product,));
  }
  );
  //Bible Books
  _buildBibleProducts() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100/140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
      ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.bibleList.length,
    itemBuilder: (context, index) {
        final product = MyProducts.bibleList[index];

        return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(myProduct: product))),
            child: MyProductCard(myProduct: product,));
  }
  );
  //Femi Books
  _buildFemiProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100/140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
      ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.femisList.length,
    itemBuilder: (context, index) {
        final product = MyProducts.femisList[index];

        return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(myProduct: product))),child: MyProductCard(myProduct: product,));
  }
  );
  //Matthews Books
  _buildMatthewsProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100/140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
      ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.mathewsList.length,
    itemBuilder: (context, index) {
        final product = MyProducts.mathewsList[index];

        return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(myProduct: product))),child: MyProductCard(myProduct: product,));
  }
  );
}

import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: darkFontGrey,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline, color: darkFontGrey))
        ],
      ),
    );
  }
}
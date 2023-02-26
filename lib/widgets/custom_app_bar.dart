import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        child: Image.asset('assets/logo.png', height: 60,),
      ),
      iconTheme: const IconThemeData(color: Colors.black ,),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, "/wishlist");
        }, icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

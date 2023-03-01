import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  const CustomAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title != null
          ? Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black),
          child: Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        child: Image.asset(
          'assets/logo.png',
          height: 60,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishlist");
            },
            icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

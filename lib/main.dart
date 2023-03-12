import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa/bloc/cart/cart_bloc.dart';
import 'package:medusa/bloc/category/category_bloc.dart';
import 'package:medusa/bloc/checkout/checkout_bloc.dart';
import 'package:medusa/bloc/product/product_bloc.dart';
import 'package:medusa/bloc/wishlist/wishlist_bloc.dart';
import 'package:medusa/config/app_router.dart';
import 'package:medusa/repositories/category/category_repo.dart';
import 'package:medusa/repositories/checkout/checkout_repo.dart';
import 'package:medusa/repositories/product/product_repo.dart';
import 'package:medusa/simple_bloc_observer.dart';

import 'config/theme.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (_) => CategoryBloc(categoryRepo: CategoryRepo())
              ..add(LoadCategories())),
        BlocProvider(
            create: (_) =>
                ProductBloc(productRepo: ProductRepo())..add(LoadProducts())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepo: CheckoutRepo(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Medusa ',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

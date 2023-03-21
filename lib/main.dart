import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medusa/bloc/auth/auth_bloc.dart';
import 'package:medusa/bloc/cart/cart_bloc.dart';
import 'package:medusa/bloc/category/category_bloc.dart';
import 'package:medusa/bloc/checkout/checkout_bloc.dart';
import 'package:medusa/bloc/product/product_bloc.dart';
import 'package:medusa/bloc/wishlist/wishlist_bloc.dart';
import 'package:medusa/config/app_router.dart';
import 'package:medusa/model/models.dart';
import 'package:medusa/repositories/repos.dart';
import 'package:medusa/simple_bloc_observer.dart';

import 'config/theme.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepo()),
        RepositoryProvider(create: (context) => UserRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                  authRepo: context.read<AuthRepo>(),
                  userRepo: context.read<UserRepo>())),
          BlocProvider(
              create: (_) =>
              WishlistBloc(localStorageRepository: LocalStorageRepo())
                ..add(StartWishlist())),
          BlocProvider(
              create: (_) =>
                  ProductBloc(productRepo: ProductRepo())..add(LoadProducts())),
          BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
          BlocProvider(
              create: (_) => CategoryBloc(categoryRepo: CategoryRepo())
                ..add(LoadCategories())),
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
      ),
    );
  }
}

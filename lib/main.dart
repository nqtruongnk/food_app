import 'package:app_food/scr/providers/app.dart';
import 'package:app_food/scr/providers/category.dart';
import 'package:app_food/scr/providers/product.dart';
import 'package:app_food/scr/providers/restaurant.dart';
import 'package:app_food/scr/providers/user.dart';
import 'package:app_food/scr/screens/home.dart';
import 'package:app_food/scr/screens/login.dart';
import 'package:app_food/scr/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
        title: 'Food App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ScreenController(),
      ),
    ),
  );
}

class ScreenController extends StatelessWidget {
  const ScreenController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginSceen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginSceen();
    }
  }
}

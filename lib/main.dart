import 'package:e_comerce/di/di.dart';
import 'package:e_comerce/ui/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF004182),
            primary: Color(0xFF004182),
          ),
          useMaterial3: true,
        ),
        initialRoute: ProductScreen.route,
        routes: {
          ProductScreen.route: (_) => ProductScreen(),
        },
      ),
    );
  }
}

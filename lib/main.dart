import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/AppModule/pages/splash/splash_screen.dart';
import 'package:weather_app/AppModule/theme/app_theme.dart';

import 'AppModule/provider/provider_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: ProvidersList.providersList,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'A Big O Weather Application',
            theme: appTheme,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}

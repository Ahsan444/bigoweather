

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/AppModule/provider/home/home_provider.dart';

class ProvidersList {
  static List<SingleChildWidget> providersList = [
    ChangeNotifierProvider(
      create: (_) => HomeProvider(),
    ),
  ];
}
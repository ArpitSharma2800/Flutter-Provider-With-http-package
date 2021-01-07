import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/ProviderClass.dart';
import 'package:flutter_provider/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //expose it to its descendants and rebuilds dependents whenever ChangeNotifier.notifyListeners is called
      create: (_) => ProviderClass(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}

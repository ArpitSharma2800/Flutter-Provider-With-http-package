import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/model/DataClass.dart'; //import model created for API
import 'package:http/http.dart' as http; //import http package as http

class ProviderClass extends ChangeNotifier {
  //ProviderClass(Can ber named anything) is created with ChangeNotifier

  bool isLoading = false; //loading parameter
  List<DataClass> post = List<DataClass>(); // DataClass empty parameter
  int _count = 1; // dummy parameter to check working!!

  int get count => _count; //to set value for _count

  List<DataClass> get listData => post; //to set value for post

  set count(int n) {
    //function to change _count and notify change to ChangeNotifier
    _count = n;
    notifyListeners();
  }

  set listData(List<DataClass> value) {
    //function to update list data and notify
    post = value;
    isLoading = false;
    notifyListeners();
  }

  ProviderClass() {
    post = new List<DataClass>();
  }

  Future<List<DataClass>> apiCall() async {
    //function to call API using Http package
    String url = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (200 == response.statusCode) {
        print(response.body);
        final List<DataClass> filesList = dataClassFromJson(response.body);
        listData = filesList;
        return filesList;
      } else {
        return List<DataClass>();
      }
    } catch (e) {
      print(e);
      return List<DataClass>();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/ProviderClass.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //initState to perform all task before page loads...
    super.initState();
    Future.microtask(() async => {
          Provider.of<ProviderClass>(context, listen: false)
              .apiCall(), //provider to call API and update data....
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ProviderClass>(
            //Consumer widget rebuilds any widgets below it whenever notifyListeners() gets called.
            builder: (context, myModel, child) {
              return Text(myModel.count.toString());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ProviderClass>(context, listen: false).count += 1;
          },
        ),
        body: Consumer<ProviderClass>(builder: (context, myModel, child) {
          //The Consumer widget rebuilds any widgets below it whenever notifyListeners() gets called.
          return ListView.builder(
            itemCount: myModel.post == null
                ? 0
                : myModel.post.length, //length according to data present
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text(Provider.of<ProviderClass>(context, listen: false)
                      .post[index]
                      .title),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

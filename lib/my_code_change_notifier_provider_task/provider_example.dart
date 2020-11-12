import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementDate extends StatefulWidget {
  @override
  _IncrementDateState createState() => _IncrementDateState();
}

class _IncrementDateState extends State<IncrementDate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleProvider(),
    );
  }
}

class ExampleProvider extends StatefulWidget {
  @override
  _ExampleProviderState createState() => _ExampleProviderState();
}

class _ExampleProviderState extends State<ExampleProvider> {
  @override
  Widget build(BuildContext context) {
    print("execeting first time only");
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyModel>(
              builder: (context,instance,child)
              {
                return Text("${instance.count}");
              },

            ),
            OutlineButton(
              onPressed: () {
                Provider.of<MyModel>(context,listen: false).incCount();
              },
              child: Text("submit to increment"),
            ),
          ],
        ),);
  }
}

class MyModel extends ChangeNotifier {
  int count = 0;

  incCount() {
    count++;
    notifyListeners();
  }
}

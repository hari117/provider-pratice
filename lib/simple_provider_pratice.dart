import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: MaterialApp(
        home: LoadingTask(),
      ),
    ),
  );
}

class LoadingTask extends StatefulWidget {
  @override
  _LoadingTaskState createState() => _LoadingTaskState();
}

class _LoadingTaskState extends State<LoadingTask> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData();
  }

  futureData() async{
   await Future.delayed(Duration(seconds: 20), () {});
     Provider.of<GlobalState>(context,listen: false).getData();
    return "DataRetrived";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer<GlobalState>(
        builder: (context, gs, child) {
          if(gs.isLoading==true)
            {
              return Text("Loading");
            }
          else
            {
              return Text("Data Feathched");
            }
          // return Text("the boolean value is ${Provider
          //     .of<GlobalState>(context)
          //     .isLoading}");
        },
      ),),
    );
  }
}

class GlobalState extends ChangeNotifier {
  bool isLoading = true;

  getData() {
    print("get data called");
    isLoading = false;
    notifyListeners();
  }
}

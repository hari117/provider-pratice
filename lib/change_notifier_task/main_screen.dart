import 'package:flutter/material.dart';
import 'package:providepratice/change_notifier_task/loginpage.dart';
import 'package:providepratice/change_notifier_task/singindetailsmodel.dart';
import 'package:provider/provider.dart';

class ProviderTask extends StatefulWidget {
  @override
  _ProviderTaskState createState() => _ProviderTaskState();
}

class _ProviderTaskState extends State<ProviderTask> {
  int value_Texh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider login example"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginRoute()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<SignInDetailsModel>(
          builder: (context,signInObject,child)
          {
            String message=(signInObject.user==""?"plse sign in " : "Welcome ${signInObject.user}");
            return Text(message,style: TextStyle(fontSize: 30),);
          },

        ),
      ),
    );
  }
}

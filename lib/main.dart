import 'package:flutter/material.dart';
import 'package:providepratice/change_notifier_task/main_screen.dart';
import 'package:providepratice/change_notifier_task/singindetailsmodel.dart';
import 'package:providepratice/my_code_change_notifier_provider_task/provider_example.dart';
import 'package:provider/provider.dart';

// this meduim example code taken from medium articals to pratice provider

// void main() {
//   runApp(
//     ChangeNotifierProvider<SignInDetailsModel>(
//       create: (_)=>SignInDetailsModel(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   static const String _title = 'Provider Sign-In Example';
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       theme: ThemeData(),
//       home: ProviderTask(),
//     );
//   }
// }

// this is my code , i praticed ChangeNotiferProvider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (_) => MyModel())
        //  create: (_)=>MyModel(),
      ],
      child: IncrementDate(),
    ),
  );
}

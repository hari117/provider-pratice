import 'package:flutter/material.dart';
import 'package:providepratice/newsapp/dio_pratice_task.dart';
import 'package:providepratice/newsapp/user_genarated_model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class NewsManagement extends ChangeNotifier {
 static NewsManagement insta=NewsManagement();
  List<News> updatednewsList = [];

  bool isLoading = true;

  getNews() {
    isLoading = true;

    $apicall.results().then(
      (value) {
        updatednewsList.addAll(value);
        print("mangement class ${updatednewsList.length}");
         isLoading=false;
        notifyListeners();
      },
    );
  }
}

final $newsMang = NewsManagement();

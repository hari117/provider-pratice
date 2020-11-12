import 'package:dio/dio.dart';
import 'package:providepratice/newsapp/bot_genarated_model.dart';
import 'package:providepratice/newsapp/user_genarated_model.dart';


class ApiCallForNews {
  String key =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a5cc5825a5d948dabbd1108bde300142";
  Dio dio = Dio();

  Future results() async {

    Response responce = await dio.get(key);
    var pureData = responce.data;
    // print(pureData.runtimeType);
    GoogleMaps gle = GoogleMaps.fromJson(pureData);
    List<News> n = News.getNews(gle);
    print("the length of the news is ${n.length}");
    return n;
  }


}
final $apicall=ApiCallForNews();
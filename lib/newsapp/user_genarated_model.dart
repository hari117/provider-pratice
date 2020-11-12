

import 'package:providepratice/newsapp/bot_genarated_model.dart';

class News
{


  String title;
  String ImgeUrl;


  static List<News> getNews(GoogleMaps g)
  {

    print("*****called getnews funtion to call api******");
    List<News> setOfNews=[];


    for(Article a in g.articles)
      {
        News n=News();

        n.title=a.title;

        n.ImgeUrl=a.urlToImage;
        setOfNews.add(n);
      }


    return setOfNews;
  }


}
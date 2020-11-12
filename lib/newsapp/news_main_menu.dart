import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providepratice/newsapp/dio_pratice_task.dart';
import 'package:providepratice/newsapp/provider_state_management.dart';
import 'package:providepratice/newsapp/user_genarated_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider<NewsManagement>(
    create: (_)=>NewsManagement(),
      child: MaterialApp(home: NEWSAPP())));
}

class NEWSAPP extends StatefulWidget {
  @override
  _NEWSAPPState createState() => _NEWSAPPState();
}

class _NEWSAPPState extends State<NEWSAPP> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callrestApi();
  }

  callrestApi() async {
    Provider.of<NewsManagement>(context,listen: false).isLoading=true;
    await $newsMang.getNews();
    Provider.of<NewsManagement>(context,listen: false).isLoading=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsManagement>(
        child: Text("hello world"),
        builder: (context, nm, child) {
          if (nm.isLoading==true) {
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return ListView(children:listOfChildens(),);
             return ListView(
               scrollDirection: Axis.vertical,
               children: listOfChildens(),
             );
          }
        },
      ),
    );
  }


  listOfChildens()
  {
    List<Widget> wid=[];
    for(News s in Provider.of<NewsManagement>(context).updatednewsList)
      {
        wid.add(Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 300,
          decoration: BoxDecoration(
            color: Colors.yellow,
            image: DecorationImage(
              image: NetworkImage(s.ImgeUrl),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomLeft,
          child: Text(
            s.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
        ));

      }
    return wid;

  }





}

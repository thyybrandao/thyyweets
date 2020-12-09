import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:thyyweets/app/modules/home/widgets/profile_widget.dart';
import 'home_controller.dart';
import 'widgets/counter_widget.dart';
import 'widgets/date_widget.dart';
import 'widgets/loading_widget.dart';
import 'widgets/tweet_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Ironics Theets"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final _formkey = GlobalKey<FormState>();
  var search = TextEditingController();
  var future;

  @override
  void initState() {
    future = controller.listTweets();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    //bool isEmpty = true;
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color:Colors.white,
            fontSize: 20,
            ),
        ),
        backgroundColor: Color(0xff00acee),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white), 
            onPressed: (){
              setState(() {
                  if(search.text.isEmpty ||search.text == null){
                   
                  future = controller.listTweets();
                  }else{
                   future = controller.searchTweets(search.text);
                  }
                  });
            })
        ],
      ),
      body: SafeArea(
        child: Container(
            width: size.width,
            height: size.height,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

        Container(
        padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
        width: size.width,
        height: size.height / 10,
        color: Colors.grey[200],
        child:Form(
              key: _formkey,
              child:Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [

                  Flexible(
              flex: 5,
                child: TextFormField(
                controller:search,
                
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  //enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    )

                ),

              ),
                  ),

                  Flexible(
              //flex: 1,
                child: IconButton(
                icon: Icon(
                  Icons.search,color: Color(0xff00acee),
                  size: 32,
                  ), 
                onPressed: () { 
                  
                  setState(() {
                  if(search.text.isEmpty ||search.text == null){
                   
                  future = controller.listTweets();
                  }else{
                   future = controller.searchTweets(search.text);
                  }
                  });
                },
                ),
                  )

                ],),

              
            )
        ),

            Expanded(
            child: FutureBuilder(
            future: future,
            builder: (context, snapshot){

              List<dynamic> lista= snapshot.data;

              


              switch(snapshot.connectionState){

                case ConnectionState.none:
                case ConnectionState.waiting:
                return LoadingWidget();

                case ConnectionState.active:
                case ConnectionState.done:
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context,index){
                    
                    print("MENSAGEM: ${lista[index]["text"]}");
                  return Container(
                        margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                        width: size.width,
                        decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top:BorderSide(
                        width: 2, 
                        color: Colors.blue.withOpacity(0.2)
                        ))
                        ),
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ProfileWidget(
                      name: lista[index]["user"]["name"],
                      username: "@"+lista[index]["user"]["screen_name"],
                      avatar: lista[index]["user"]["profile_image_url"],
                        )
                          ],),


                      Row(
                      children: [
                      TweetWidget(text: lista[index]["text"])
                        ],),


                      Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        CounterWidget(
                          title:"RETWEETS",
                          valor:lista[index]["retweet_count"].toString()
                        ),

                        CounterWidget(
                          title:"FAVORITES",
                          valor:lista[index]["favorite_count"].toString()
                        ),

                        DateWidget(date: lista[index]["created_at"])

                      ],),
                        )


                      ],),

                        );
                  },

                );

                default: 
                return Container();
              }
            }),
        )

            ],),
          ),
      )
    );
  }
}

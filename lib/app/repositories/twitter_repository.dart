import 'package:dio/dio.dart';
import 'package:thyyweets/app/utils/config.dart';
import 'package:thyyweets/app/utils/custom_dio.dart';

class TwitterRepoitory{


  getTweets({String track}) async{

  var dio = CustomDio.withAuthentication().instance;
  var res = await dio.get(BASE_URL);

  //print(res.data.runtimeType);
  //print("PESQUISA MERDA");

  return res.data;

  }

  getSearchTweets(String track) async{

  var dio = CustomDio.withAuthentication().instance;
  var url = "https://api.twitter.com/1.1/search/tweets.json?q=$track&screen_name=realDonaldTrump&result_type=popular&count=15&include_entities=false";
  var res = await dio.get(url);
  print("PESQUISA");
  //print(res.data["statuses"]);

  return res.data["statuses"];

  }
  
}
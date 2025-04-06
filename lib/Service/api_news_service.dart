

import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_project/Model/NewsModel.dart';

class ApiService{

  final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=1c1939cea26d41e09eae408144fcffd1";
  final breaking_news_url="https://newsapi.org/v2/top-headlines?country=us&apiKey=1c1939cea26d41e09eae408144fcffd1";

  Future<List<NewsModel>> getAllNews()async{
    try{
     Response response = await get(Uri.parse(all_news_url));
     if(response.statusCode==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic>body =json['articles'];
        List<NewsModel>articlesList= body.map((item)=> NewsModel.fromJson(item)).toList();
        return articlesList;
     }else{
       throw (' no news found');
     }
    }
    catch(e){
      throw e;
    }
  }


  Future<List<NewsModel>> getBreakingNews()async{
    try{
      Response response = await get(Uri.parse(breaking_news_url));
      if(response.statusCode==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic>body =json['articles'];
        List<NewsModel>articlesList= body.map((item)=> NewsModel.fromJson(item)).toList();
        return articlesList;
      }else{
        throw (' no news found');
      }
    }
    catch(e){
      throw e;
    }
  }

}
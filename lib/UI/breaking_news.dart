import 'package:flutter/material.dart';
import 'package:news_app_project/Model/NewsModel.dart';

import '../Service/api_news_service.dart';
import '../components/news_item_list.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService=ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBreakingNews(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            List<NewsModel>articleList = snapshot.data ?? [];
            return ListView.builder(
                itemBuilder: (context,index){
                    return NewsItemList(newsModel: articleList[index]);
                },
              itemCount: articleList.length
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
          }),


    );
  }
}

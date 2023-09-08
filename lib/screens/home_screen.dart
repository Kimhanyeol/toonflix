import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        //글자 색
        foregroundColor: Colors.green,
        //앱 바 색
        backgroundColor: Colors.white,
        //앱 바 밑에 음영 사라지게 만드는 코드
        elevation: 2,
        title: Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  )
                ]
              ),
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            SizedBox(height: 10,),
            Text(
              webtoon.title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 40),
    );
  }
}

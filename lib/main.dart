import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());      //method
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //function
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
    );
  }
}
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'bda1e0fb5e997beea7df98a339c157fc';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZGExZTBmYjVlOTk3YmVlYTdkZjk4YTMzOWMxNTdmYyIsInN1YiI6IjY0YzExNjAxMmYxYmUwMDBhZTRiOTliYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3LjgvuhtmrgaMm4ql3ApfkXpsLxqKMim0_rL9HeenTc';
  @override
  void initState(){
       loadmovies();
       super.initState();
  }

  loadmovies() async{
    TMDB tmdbWithCustomLogs =TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true, //figure out y we used this
      showErrorLogs: true,
    )
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending(); //to make it jsonfield
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();


    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    //print(trendingresult);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
            appBar: AppBar(
               title: modified_text(text:'Flutter Movie App ❤️️',color: Colors.white,size:25.0,),
              backgroundColor: Colors.transparent,
            ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),

        ],
      ),

    );
  }
}


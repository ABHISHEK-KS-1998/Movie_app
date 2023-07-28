import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies', size: 15, color: Colors.white,),
          SizedBox(height: 10),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell( //to enable ontap property
                    onTap: () {
                      Navigator.push(context,//  move to next screen
                          MaterialPageRoute(builder: (context) =>
                              Description(name: trending[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_on: trending[index]['release_date'])));
                    },
                    child:
                    trending[index]['title'] != null?
                      Container(
                      padding: EdgeInsets.all(10),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']
                                  //copy setpath and paste in google add tmdb.api open website-image-search path
                                ),),
                                ),
                            height: 200,
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            child: modified_text(
                              text: trending[index]['title'] != null?
                              trending[index]['title'] : 'Loading',
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ): Container(),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

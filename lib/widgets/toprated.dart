import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:'Toprated Movies',size: 15,color: Colors.white,),
          SizedBox(height: 10),
          Container(height: 290,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,//  move to next screen
                          MaterialPageRoute(builder: (context) =>
                              Description(name: toprated[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                                  description: toprated[index]['overview'],
                                  vote: toprated[index]['vote_average'].toString(),
                                  launch_on: toprated[index]['release_date'])));
                    },
                    child:
                    toprated[index]['title'] != null?
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                  //copy setpath and paste in google add tmdb.api open website-image-search path
                                ),
                                  fit: BoxFit.cover //to fit in container
                            )),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: modified_text(text: toprated[index]['title']!=null?
                            toprated[index]['title']:'Loading',color: Colors.white,size: 15,
                            ),
                          ),
                        ],
                      ),
                    ):Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

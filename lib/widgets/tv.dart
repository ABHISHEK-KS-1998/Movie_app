import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import '../description.dart';

class TV extends StatelessWidget {
  final List<dynamic> tv; // Updated: Use 'dynamic' as the type for 'tv'

  const TV({Key? key, required this.tv}) : super(key: key); // Updated: Fixing constructor syntax
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Popular TV Shows', size: 15, color: Colors.white,),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['original_name'] ?? '', // Handle null case with '??'
                          bannerurl: 'https://image.tmdb.org/t/p/w500' + (tv[index]['backdrop_path'] ?? ''), // Handle null case with '??'
                          posterurl: 'https://image.tmdb.org/t/p/w500' + (tv[index]['poster_path'] ?? ''), // Handle null case with '??'
                          description: tv[index]['overview'] ?? '', // Handle null case with '??'
                          vote: (tv[index]['vote_average'] ?? 0).toString(), // Handle null case with '??'
                          launch_on: tv[index]['release_date'] ?? '', // Handle null case with '??'
                        ),
                      ),
                    );
                  },
                  child: tv[index]['original_name'] != null ?
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    height: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    (tv[index]['backdrop_path'] ?? ''), // Handle null case with '??'
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: modified_text(
                            text: tv[index]['original_name'] != null
                                ? tv[index]['original_name']
                                : 'Loading',
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                     : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

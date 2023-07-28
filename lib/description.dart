import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({super.key, required this.name, required this.description,
    required this.bannerurl, required this.posterurl, required this.vote,
    required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack( // to overlap the containers
                children: [
                  Positioned(child: Container(
                    height: 250,width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover),
                  )),
                  Positioned(
                      bottom: 10.0,
                      child: modified_text(text: '  🌟 Averge Rating -'+vote,
                      color: Colors.white, size: 18.0)),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(text: name!=null? name:'Not Loaded',
                color: Colors.white,
                size: 24.0),
            ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: modified_text(text: 'Releasing on -'+launch_on,size: 10.0,color: Colors.white,),
          ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(width: 5),
                Flexible(  //to stop overflow of description
                  child: Container(
                    child: modified_text(text: description,size: 14.0,color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

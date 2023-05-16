import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xff213A50),
                        const Color(0xff071930)
                      ]
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30) ,
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: kIsWeb ? MainAxisAlignment.start :
                    MainAxisAlignment .center,
                    children: <Widget>[
                      Text('food',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),),

                      Text("Recipe", style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue
                      ),)

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("data"),
                  Text("data")
                ],
              ),


            ),
          ],
        )
    );
  }
}


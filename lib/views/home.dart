import 'dart:core';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/recipe_model.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<RecipeModel> recipes = new List<RecipeModel>();

  TextEditingController textEditingController = new TextEditingController();



  getRecipes (String query) async{

    String urlString="https://api.edamam.com/search?q=$query&app_id=b649a3c7&app_key=4a8e00a8cdac5429551f592a8817613d";
    Uri uri = Uri.parse(urlString);
    var response = await http.get(uri);
    Map<String,dynamic>jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element){
      //print(element.toString());

      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
      
    });
    
    print("${recipes.toString()}");
  }

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
                  Text("data",style: TextStyle( fontSize: 20,
                    color: Colors.white
                  ),

                  ),
                  Text("data"),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: "Enter",
                              hintStyle:TextStyle(
                                fontSize: 18,
                              color: Colors.white.withOpacity(0.5)
                              ),

                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(width: 16,),
                        InkWell(
                          onTap: (){
                            if(textEditingController.text.isNotEmpty){
                              getRecipes(textEditingController.text);
                              print('ok');
                            }else{
                              print("object");
                            }
                          },

                          child :Container(
                            child: Icon(Icons.search,color: Colors.white,),
                          )
                        )
                      ],
                    ),

                  )
                ],
              ),


            ),
          ],
        )
    );
  }
}


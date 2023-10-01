import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class FutureWidget extends StatefulWidget {
  const FutureWidget({super.key});

  @override
  State<FutureWidget> createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  Future<List<dynamic>> _getMyUsers() async{
    List<dynamic> myUsersList =[];

    var myUrl = "https://jsonplaceholder.typicode.com/users";

    try{
      var res = await get(Uri.parse(myUrl));
      if(res.statusCode == 200){
        myUsersList = await jsonDecode(res.body);
      }

      return myUsersList;
    } catch(e){
        print("Error");
        return myUsersList;
      }
  
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMyUsers(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text("Error");
        }else if(snapshot.hasData){
          return dataAvailableWidget(snapshot);
        }else{
          return Text("En espera");
        }
      },
    );
  }


}


Widget errorWidget(){
  return Center(
    child: Text("Error intenta de nuevo"),
  );
}


Widget noDataWidget(){
  return Center(
    child: CircularProgressIndicator(),
  );
}


Widget dataAvailableWidget(AsyncSnapshot <dynamic> snapshot){
  return ListView.builder(
    itemCount: (snapshot.data as List).length,
    itemBuilder: (context, index) {
      return Text("${(snapshot.data as List)[index]["name"]}");
    },
    );

}
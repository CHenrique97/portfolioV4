import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:porfoliov3/store/states.dart';
import 'package:provider/provider.dart';
import '../interfaces/backendApi.dart';
import './../store/states.dart';
class Projects extends StatefulWidget  {
  const Projects({ Key? key }) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  late Future<ApiBackend> data;

  Future <ApiBackend> apiCall() async {
     final response = await http.get(Uri.parse("https://hidden-brook-80791.herokuapp.com/portfolio"));

     if (response.statusCode == 200){
      return ApiBackend.fromJson(jsonDecode(response.body));
      }


      throw Exception("Unable to call api");
    
     }

  @override
    void initState() {
    data = apiCall();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<ApiBackend>(
        future: data,
           builder: (context, snapshot) {
            if (snapshot.hasData) {
              //snapshot.data!.
              return  ListView(
                children: snapshot.data!.totalProjects!.map((payload) => ListTile(
                  title: Text(payload.title!),
                  subtitle: Text(payload.description!),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  onTap: (){context.read<StateModel>().set({"title":payload.title!,"description":payload.description!,"github":payload.github!,"thumbnail":payload.thumbnail!});},
                  ),
                ).toList(),
                );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Text("Loading....");
          },

      ),
    );
  }
}
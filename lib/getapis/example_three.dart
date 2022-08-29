import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tb_course/models/user_models/user_models.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModels> userList = [];

  Future<List<UserModels>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModels.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Example 3")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModels>> snapshot) {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReusableRow(
                                title: "Name",
                                value: snapshot.data![index].name.toString()),
                            ReusableRow(
                                title: "username",
                                value:
                                    snapshot.data![index].username.toString()),
                            ReusableRow(
                                title: "username",
                                value: snapshot.data![index].address!.city
                                    .toString()),
                            ReusableRow(
                                title: "Phone",
                                value: snapshot.data![index].phone.toString()),
                            ReusableRow(
                                title: "Geo",
                                value: snapshot.data![index].address!.geo!.lat
                                    .toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

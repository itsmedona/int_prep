import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/joke_provider/joke_provider.dart';
import '../../static/joke_data/joke_data.dart';
import '../viewscreen/viewscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Jokes App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: JokesCategoryData.categoryData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Provider.of<JokeProvider>(context, listen: false)
                      .setCurrentCategory(
                          JokesCategoryData.categoryData[index]['name']);

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ViewScreen()));
                },
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        JokesCategoryData.categoryData[index]['imagePath'])),
                title: Text(
                    "${JokesCategoryData.categoryData[index]['name']} Jokes"),
              ),
            );
          }),
    );
  }
}

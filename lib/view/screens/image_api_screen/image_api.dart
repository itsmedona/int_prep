import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  void _fetchImages() async {
    final response =
        await http.get(Uri.parse('https://api.gettyimages.com/v3/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> imageUrls =
          data.map((dynamic item) => item['url'] as String).toList();
      setState(() {
        _imageUrls = imageUrls;
      });
    } else {
      throw Exception('Failed to fetch images');
    }
  }

  void _showImage(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Image.network(url),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          final url = _imageUrls[index];
          return GestureDetector(
            onTap: () => _showImage(context, url),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

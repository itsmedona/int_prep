import 'package:flutter/material.dart';

class ReorderableListScreen extends StatefulWidget {
  @override
  _ReorderableListScreenState createState() => _ReorderableListScreenState();
}

class _ReorderableListScreenState extends State<ReorderableListScreen> {
  // Sample list of items
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable List'),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: _items
            .map((item) => ListTile(
                  key: ValueKey(item),
                  title: Text(item),
                  leading: Icon(Icons.drag_handle),
                ))
            .toList(),
      ),
    );
  }
}
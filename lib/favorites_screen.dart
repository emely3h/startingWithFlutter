import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoritesScreen extends StatelessWidget {
 final  List _saved;

  FavoritesScreen(this._saved);

  Widget _buildRow(WordPair pair) {
    return Column(
      children: [
        ListTile(
          title: Text(
            pair.asPascalCase,
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildSuggestions() {
    if (_saved.isEmpty) {
      return Center(child: Text("You haven't selected favorites yet."));
    } else {
      return ListView.builder(
          itemCount: _saved.length,
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            //if (i.isOdd) return Divider(); /*2*/

            return _buildRow(_saved[i]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.list), onPressed: () {})],
      ),
      body: _buildSuggestions(),
    );
  }
}

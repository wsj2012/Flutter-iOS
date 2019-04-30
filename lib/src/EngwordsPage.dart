// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

class EngwordsPage extends StatelessWidget {

  final String _title;
  EngwordsPage(this._title);

  @override
  Widget build(BuildContext context) {
    return new RandomWords(_title);
  }
}

class RandomWords extends StatefulWidget {
  
  final String _title;
  RandomWords(this._title);

  @override
  createState() => new RandomWordsState(_title);
}

class RandomWordsState extends State<RandomWords> {

  String _title;
  RandomWordsState(this._title);

  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);

    // return new Container(
    //     padding: const EdgeInsets.all(0),
    //     child: _buildSuggestions(),
    // );

    return new CupertinoPageScaffold(
      child: _buildSuggestions(),
      navigationBar: CupertinoNavigationBar(
        middle: Text(_title),
        trailing: new CupertinoButton(
          child: new Icon(CupertinoIcons.book),
          onPressed: () {
            _pushSaved();
          },
        ),
      ),
    );

    // return new Scaffold(
    //   appBar: new AppBar(
    //     leading: new IconButton(
    //       icon: new Icon(Icons.live_help),
    //       tooltip: 'Navigation menu',
    //       onPressed: _pushSaved,
    //     ),
    //     title: new Text("Startup Name Generator"),
    //     elevation: 0,
    //     actions: <Widget>[
    //       new IconButton(icon: new Icon(Icons.list), onPressed: _pushSample),
    //     ],
    //   ),
    //   body: _buildSuggestions(),
    // );
  }

  // void _pushSample() {
  //   Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => new SamplePage()));
  // }

  void _pushSaved() {
    // Navigator.maybePop(context);
    // return;
    Navigator.of(context, rootNavigator: true).push(
      new CupertinoPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new Container(
                  height: 88,
                  color: CupertinoColors.activeOrange,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: 87,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.all(14),
                              child: new Text(pair.asPascalCase,
                                  style: _biggerFont),
                            ),
                            new Container(
                              padding: EdgeInsets.only(right: 14),
                              child: new Icon(CupertinoIcons.book_solid),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        height: 1,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        child: Container(
                          // padding: EdgeInsets.all(0.5),
                          color: CupertinoColors.extraLightBackgroundGray,
                        ),
                      )
                    ],
                  ));
              Text(pair.asPascalCase);
              // return new ListTile(
              //   title: new Text(
              //     pair.asPascalCase,
              //     style: _biggerFont,
              //   ),
              // );
            },
          );

          final cells = tiles.toList();

          // final divided = ListTile.divideTiles(
          //   context: context,
          //   tiles: tiles,
          // ).toList();

          return new CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: new Text("Saved Suggestions"),
            ),
            child: new ListView(children: cells),
          );
        },
      ),
    );
  }

  //构建显示建议单词对的ListView
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 64),
        itemBuilder: (context, i) {
          if (i.isOdd)
            return new Container(
              padding: EdgeInsets.all(1),
            );
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new Container(
        // padding: EdgeInsets.all(14),
        height: 88,
        color: CupertinoColors.activeGreen,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              // padding: EdgeInsets.only(left: 10),
              child: Text(
                pair.asPascalCase,
                style: new TextStyle(fontSize: 32),
              ),
            ),
            new Container(
                // padding: EdgeInsets.only(right: 10),
                child: new CupertinoButton(
              child: new Icon(
                alreadySaved
                    ? CupertinoIcons.book_solid
                    : CupertinoIcons.bookmark,
              ),
              onPressed: () {
                print("rigth bookmark clicked");
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(pair);
                  } else {
                    _saved.add(pair);
                  }
                });
              },
            )),
          ],
        ));
    Text(pair.asPascalCase);
    // return new ListTile(
    //   title: new Text(
    //     pair.asPascalCase,
    //     style: _biggerFont,
    //   ),
    //   trailing: new Icon(
    // alreadySaved ? Icons.favorite : Icons.favorite_border,
    //     color: alreadySaved ? Colors.red : null,
    //   ),
    //   onTap: () {
    // setState(() {
    //   if (alreadySaved) {
    //     _saved.remove(pair);
    //   } else {
    //     _saved.add(pair);
    //   }
    // });
    //   },
    // );
  }
}

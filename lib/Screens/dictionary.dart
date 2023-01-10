import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    sortDict();
    super.initState();
  }

  var sortedByKeyMap;
  Map<String, String> Dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };

  sortDict() {
    sortedByKeyMap = Map.fromEntries(Dictionary.entries.toList()
      ..sort((e1, e2) {
        if (int.tryParse(e1.key) != null && int.tryParse(e2.key) != null) {
          return int.parse(e1.key).compareTo(int.parse(e2.key));
        } else {
          return -1;
        }
      }));

    print(sortedByKeyMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),

      ),
      body: ListView.builder(itemCount:sortedByKeyMap.length,
          itemBuilder: (BuildContext context, int index){
            String key = sortedByKeyMap.keys.elementAt(index);
            return new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Text("$key"),
                  title: new Text("${sortedByKeyMap[key]}"),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );

          }),
    );
  }
}

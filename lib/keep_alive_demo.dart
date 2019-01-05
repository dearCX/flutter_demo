import 'package:flutter/material.dart';
class TabPage extends StatefulWidget {
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin{
  int _count = 0;
  @override
  bool get wantKeepAlive => true;
  void _incrementCounter(){
    setState(() {
      _count++;  
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1，点一下加1:'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display1
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
// import 'bottom_navigation_widget.dart'; // BottomNavigationBar组件文件
// import 'bottom_appBar_demo.dart'; // 不规则路由组件文件
// import 'pages.dart'; // 基本路由
// import 'custome_router.dart'; //路由动画
// import 'frosted_glass_emo.dart'; //毛玻璃效果
import 'keep_alive_demo.dart'; // 保持状态
import 'search_bar_demo.dart'; // 搜索框
import 'warp_demo.dart'; // 流式布局
import 'expansion_tile.dart'; // 展开组件
import 'expansion_panel_list.dart'; // 列表展开组件


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter buttonNavigationBar', // BottomNavigationBar组件示例
      // theme: ThemeData.light(), // BottomNavigationBar组件示例
      // home: BottomNavigationWidget() // BottomNavigationBar组件示例
      /*
      title: 'Fullter demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      // home: BottomAppBarDemo() // 不规则路由组件文件
      // home: FirstPage() //普通路由的写法
      home: ForestedGlassEmo() // 毛玻璃效果
      */
      //保持状态
      /*
      title: 'Flutter demo keep alive',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: KeepAliveDemo()
      */
      //搜索框
      /*
      title: 'Flutter searchbar demo',
      theme: ThemeData.light(),
      home: SearchBarDemo()
      */
      //流式布局
      /*
      title: 'Flutter warp demo',
      theme: new ThemeData.dark(),
      home: WarpDemo()
      */
      //展开组件
      /*
      title: 'Flutter warp demo',
      theme: new ThemeData.dark(),
      home: ExpansionTileDemo()
      */
      // 列表展开组件
      title: 'Flutter warp demo',
      theme: new ThemeData.dark(),
      home: ExpansionPanelListDemo()
    );
  }
}

class KeepAliveDemo extends StatefulWidget{
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 3,vsync: this);
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('keep alive demo'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.directions_car)),
            Tab(icon:Icon(Icons.directions_transit)),
            Tab(icon:Icon(Icons.directions_bike))
          ],
        ),
      ),
      body:TabBarView(
        controller: _controller,
        children: <Widget>[
          TabPage(),
          TabPage(),
          TabPage(),
        ],
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
class ExpandStateBean{
  var index;
  var state;
  ExpandStateBean(this.index,this.state);
}
class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mlist;
  List<ExpandStateBean> expandStateList;
  //构造方法，调用这个类的时候自动执行
  _ExpansionPanelListDemoState(){
    mlist = new List();
    expandStateList = new List();
    for(int i=0; i<10;i++){
      mlist.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, isExpand){
    setState(() {
      expandStateList.forEach((item){
        if(item.index == index){
          item.state = !isExpand;
        }
      });  
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      body:SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol){
            _setCurrentIndex(index,bol);
          },
          children: mlist.map((index){ //进行map操作，然后用toList再次组成List
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('This is No. $index')
                );
              },
              body: ListTile(
                title:Text('expansion no.$index')
              ),
              isExpanded: expandStateList[index].state
            );
          }).toList(),
        ),
      )
    );
  }
}
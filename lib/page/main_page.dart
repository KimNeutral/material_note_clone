import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_note/component/memo_item.dart';
import 'package:material_note/model/memo.dart';
import 'package:material_note/page/edit_memo_page.dart';
import 'package:material_note/page/write_memo_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Memo> memos = [];

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(
              children: <Widget>[
                Image.network("http://itrytech.com/wp-content/uploads/2015/09/wpid-wp-1442753455998.png", fit: BoxFit.fitWidth,),
                ListTile(
                  leading: Icon(FontAwesomeIcons.file, color: Colors.black,),
                  title: Text("Notes"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.folder, color: Colors.black,),
                  title: Text("Archived"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.trashAlt, color: Colors.black,),
                  title: Text("Trash"),
                  onTap: () {},
                )
              ],
            )
        )
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title, style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.normal),),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      drawer: drawer,
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: buildListView(),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Color.fromRGBO(0xDD, 0xDD, 0xDD, 0.5),))
                ),
                padding: EdgeInsets.all(20.0),
                child: Text("Take a note.",)
              ),
              onTap: () async {
                var memo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WriteMemoPage())
                );

                if (memo != null)
                  saveMemo(memo);
              },
            ),
          )
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: memos.length,
      itemBuilder: (context, index) {
        var item = memos[index];
        return MemoItem(
          onTap: onMemoTap,
          onDelete: deleteMemo,
          memo: item
        );
      }
    );
  }

  ListView buildDemoList() {
    return ListView(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 5.0)),
        MemoItem(onTap: onMemoTap, memo: Memo(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", content: "Vivamus eget urna commodo, suscipit lacus eu, blandit augue. Nullam tincidunt tellus eu tortor rutrum malesuada. Integer convallis varius ipsum, ac vestibulum eros sagittis quis. Etiam pretium nunc quis luctus laoreet. Morbi semper velit lorem, ut sodales lorem cursus a. Maecenas ornare bibendum velit id tempor. Donec eu libero dolor. Proin faucibus hendrerit est, ut pharetra lorem mollis sed. Sed blandit lectus nec turpis tempor, sed mattis nunc semper. Pellentesque rhoncus iaculis consectetur. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed mollis libero a sem maximus, eget fermentum purus bibendum. In eu sapien mi. Suspendisse et ligula facilisis tortor interdum dignissim sit amet vitae nulla. Donec convallis nunc at dictum sagittis.", color: Colors.green)),
        MemoItem(onTap: onMemoTap, memo: Memo(title: "title", content: "content", color: Colors.blue)),
        MemoItem(onTap: onMemoTap, memo: Memo(title: "title", content: "content", color: Colors.red)),
        MemoItem(onTap: onMemoTap, memo: Memo(title: "title", content: "content", color: Colors.deepOrange)),
      ],
    );
  }

  void saveMemo(memo) {
    if (memo == null) return;

    setState(() {
      memos.insert(0, memo);
    });
  }

  void deleteMemo(memo) {
    if (memo == null) return;

    setState(() {
      memos.remove(memo);
    });
  }

  void onMemoTap(memo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditMemoPage(memo)));
  }
}






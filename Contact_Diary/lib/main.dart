import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ContactDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {

  final  _searchable =
      [
        {'name':'Abdullah sir' ,'image':'20200606_232910.jpg'},
        {'name':'Roman' ,'image':'20200606_232855.jpg'},
        {'name':'Bhai' ,'image':'20200606_232855.jpg'},
        {'name':'Dost','image':'20200606_232910.jpg'},
        {'name':'Dad','image':'20200606_232910.jpg'},
        {'name':'Aleem','image':'20200606_232855.jpg'},
        {'name':'FAheem','image':'20200606_142103.jpg'},
        {'name':'Waseem','image':'x5VQmD.jpg'},
        {'name':'Kaleem','image':'20200606_232910.jpg'},
        {'name':'Ghulam Abbas','image':'20200606_232855.jpg'},
        {'name':'Anas','image':'20200606_142103.jpg'},
        {'name':'Zahid Sir','image':'x5VQmD.jpg'},
        {'name':'Sir Rab Nawaz','image':'20200606_232910.jpg'},
        {'name':'Asif Ali sir','image':'20200606_232855.jpg'},
        {'name':'Yasir Munir Sir','image':'20200606_142103.jpg'},
        {'name':'Khawer','image':'x5VQmD.jpg'},
        {'name':'Abdullah','image':'20200606_232910.jpg'},
        {'name':'Khan','image':'20200606_232855.jpg'},
        {'name':'Rehman','image':'20200606_142103.jpg'},
        {'name':'Ali Saab','image':'x5VQmD.jpg'},
      ];


  var items = [];

  @override
  void initState()
  {
    super.initState();
    items.addAll(_searchable);
  }




  @override
  Widget build(BuildContext context) {

    final title = items.length.toString() + ' Contacts';
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Color(0xff007E33),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.verified_user,color: Colors.white), onPressed: null,)
          ],
          title: Text(title,style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,  fontSize: 20, fontWeight:FontWeight.w600
            )
          ),),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  prefix: Icon(Icons.search),
                  labelText: 'Search'
                ),
                onChanged: (value){
                  filterContact(value.toLowerCase());
                },
              ),
            ),
            new Expanded(
              child: new ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    return new Card(
                      elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70,width: 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      child: GestureDetector(
                        child: new Container(
                          margin: EdgeInsets.all(9.0),
                          padding: EdgeInsets.all(6.0),
                          child: new Row(
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundImage: AssetImage('assets/${items[index]['image']}'),
                                  backgroundColor: Color(0xff00695c),
                                  foregroundColor: Colors.white,
                                ),
                                new Padding(padding: EdgeInsets.all(8.0)),
                                new Text(
                                  '${items[index]['name']}',
                                  style: TextStyle(fontSize: 20.0),
                                )
                              ]
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetail()));
                        },
                      ),
                    );
                  },
              )
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(onPressed: null,
          child: new Icon(Icons.people),
          backgroundColor: Color(0xff007e33),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  void filterContact(String searchTerm) {
    var tmpSearchList = [];

    tmpSearchList.addAll(_searchable);

    if (searchTerm.isNotEmpty) {

      List<Map<String, dynamic>> tmpList = List<Map<String, dynamic>>();
      tmpSearchList.forEach((element) {


        if(element['name'].toLowerCase().contains(searchTerm.trim()))
          {
            tmpList.add(element);
          }

      });

      setState(() {
        items.clear();
        items.addAll(tmpList);
      });
      return;
    }
    else{
      setState(() {
        items.clear();
        items.addAll(_searchable);
      });
    }
  }


}


import 'package:creiv/Screens/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../constants.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'Search_Page';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  void init() async {
    setState(() {});
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> containers = [
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.deepPurple,
    )
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: kInactiveCardColour,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: Column(children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Browse",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80)),
                            filled: true),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                //isScrollable: true,
                labelStyle: TextStyle(fontSize: 20),
                tabs: <Widget>[
                  Tab(
                    text: "Podcasts",
                  ),
                  Tab(
                    text: "Episodes",
                  ),
                  Tab(
                    text: "Episodes",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    // Container(child: HorizontalImages()),
                    // Container(child: HorizontalImages()),
                    // Container(child: HorizontalImages()),
                  ],
                ),
              )
            ])));
  }
}

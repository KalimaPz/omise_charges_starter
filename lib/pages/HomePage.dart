import 'package:flutter/material.dart';
import 'package:omise_playground/components/MyCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Explore", style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: Icon(
              Icons.chevron_left,
            )),
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.pin_drop_outlined))
        ],
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Colors.grey[300], width: 1.0)),
                      ),
                    )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose Date"),
                            Text("12 Dec - 22 Dec"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Number of Rooms"),
                          Text("1 Room - 2 Adults"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text("530 hotel found")),

                Row(
                  children: [
                    Text("Filter"),
                    SizedBox(width: 10,),
                    Icon(Icons.sort)
                  ],
                )
              ],
    
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                MyCard(),
                MyCard(),
                MyCard(),
                MyCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

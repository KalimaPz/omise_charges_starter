import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            // border: Border.all(),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(1, 2),
              ),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), offset: Offset(1, 3),spreadRadius: 2.5)
            ],
            borderRadius: BorderRadius.circular(20)),
        height: 250,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Grand Royal Hotel"),
                              Text("London 2km"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "190",
                            ),
                            Text("/per night"),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("4 Star"),
                      Text("4 Star"),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

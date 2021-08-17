import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bekhterev_app/pages/researches/view/blocks/item.dart';
import 'package:another_flushbar/flushbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultTestBlock extends StatefulWidget {
  @override
  _OResultTestBlockState createState() => _OResultTestBlockState();
}

class _OResultTestBlockState extends State<ResultTestBlock> {
  bool isLoading = true;

  late Flushbar flushbar;
  final List<Item> items = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  void getItems() async {
    final url = Uri.parse('http://fantasma.tech/json/results.json');
    final response = await http.get(url);

    final Map<String, dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));

    responseData['old'].forEach((itemDetail) {
      final Item defaultItems = Item(
          title: itemDetail['title'],
          description: itemDetail['description'],
          date: itemDetail['date'],
          modal: itemDetail['modal']);
      setState(() {
        items.add(defaultItems);
        isLoading = false;
      });
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      items.insert(index, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFE8C883)),
            ),
          )
        : ListView.builder(itemCount: this.items.length, itemBuilder: _listItemBuilder);
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    final item = items[index];
    double _textWidth = MediaQuery.of(context).size.width * 0.65;

    return Material(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
          child: Slidable(
            key: ValueKey(items[index]),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                setState(() {
                  items.removeAt(index);

                  flushbar = Flushbar(
                    message: item.title + ' удалено.',
                    messageSize: 18,
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    reverseAnimationCurve: Curves.decelerate,
                    forwardAnimationCurve: Curves.elasticOut,
                    backgroundColor: Color(0xF22280CE),
                    isDismissible: true,
                    duration: Duration(seconds: 4),
                    icon: Icon(
                      Icons.announcement_outlined,
                      color: Colors.white,
                    ),
                    mainButton: TextButton(
                      onPressed: () {
                        undoDeletion(index, item);
                        flushbar.dismiss();
                      },
                      child: Text(
                        "ОТМЕНИТЬ",
                        style: TextStyle(color: Color(0xFFE8C883)),
                      ),
                    ),
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Color(0xFFE8C883),
                  )..show(context);
                });
              },
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E5E5),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: _textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          item.title.toUpperCase(),
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF979797)),
                        ),
                        Text(
                          item.date,
                          style: TextStyle(fontSize: 15.0, color: Color(0xFF979797)),
                        ),
                        Text(
                          item.description,
                          style: TextStyle(fontSize: 15.0, color: Color(0xFF979797)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(right: 1),
                    decoration: BoxDecoration(
                      color: Color(0xFF2280CE),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                    ),
                    child: Icon(Icons.visibility, size: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            secondaryActions: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: IconSlideAction(
                  caption: 'Удалить',
                  color: Color(0xFFD31717),
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      items.removeAt(index);

                      flushbar = Flushbar(
                        message: item.title + ' удалено.',
                        messageSize: 18,
                        flushbarPosition: FlushbarPosition.BOTTOM,
                        flushbarStyle: FlushbarStyle.FLOATING,
                        reverseAnimationCurve: Curves.decelerate,
                        forwardAnimationCurve: Curves.elasticOut,
                        backgroundColor: Color(0xF22280CE),
                        isDismissible: true,
                        duration: Duration(seconds: 4),
                        icon: Icon(
                          Icons.announcement_outlined,
                          color: Colors.white,
                        ),
                        mainButton: TextButton(
                          onPressed: () {
                            undoDeletion(index, item);
                            flushbar.dismiss();
                          },
                          child: Text(
                            "ОТМЕНИТЬ",
                            style: TextStyle(color: Color(0xFFE8C883)),
                          ),
                        ),
                        showProgressIndicator: true,
                        progressIndicatorBackgroundColor: Color(0xFFE8C883),
                      )..show(context);
                    });
                  },
                ),
              ),
            ],
          ),
          splashColor: Color(0xFFF8D17F),
          highlightColor: Color(0x80F5F6F7),
          onTap: () {
            print('Tapped to ' + item.title + '.');

            showModalBottomSheet<void>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height * 0.87,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0, //extend the shadow
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            -4, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: _textWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        item.title.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF252525)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Text(
                                          item.date,
                                          style:
                                              TextStyle(fontSize: 18.0, color: Color(0xFF979797)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                          width: 45,
                                          height: 45,
                                          margin: EdgeInsets.only(right: 1),
                                          child: Material(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(28.0)),
                                            color: Color(0xFFD31717),
                                            clipBehavior: Clip.antiAlias,
                                            child: InkWell(
                                              onTap: () {
                                                print("Tapped to delete notification.");
                                              },
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                iconSize: 25,
                                                splashColor: Color(0xFFEC3636),
                                                onPressed: () {
                                                  setState(() {
                                                    items.removeAt(index);

                                                    Navigator.pop(context);
                                                  });

                                                  flushbar = Flushbar(
                                                    message: item.title + ' удалено.',
                                                    messageSize: 18,
                                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                                    flushbarStyle: FlushbarStyle.FLOATING,
                                                    reverseAnimationCurve: Curves.decelerate,
                                                    forwardAnimationCurve: Curves.elasticOut,
                                                    backgroundColor: Color(0xF22280CE),
                                                    isDismissible: true,
                                                    duration: Duration(seconds: 4),
                                                    icon: Icon(
                                                      Icons.announcement_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    mainButton: TextButton(
                                                      onPressed: () {
                                                        undoDeletion(index, item);
                                                        flushbar.dismiss();
                                                      },
                                                      child: Text(
                                                        "ОТМЕНИТЬ",
                                                        style: TextStyle(color: Color(0xFFE8C883)),
                                                      ),
                                                    ),
                                                    showProgressIndicator: true,
                                                    progressIndicatorBackgroundColor:
                                                        Color(0xFFE8C883),
                                                  )..show(context);
                                                },
                                              ),
                                            ),
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text(
                                      item.modal,
                                      style: TextStyle(fontSize: 18.0, color: Color(0xFF979797)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Закрыть'.toUpperCase()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

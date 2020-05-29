import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/rememberorder/Data.dart';

import 'RememberOrder.dart';

class RememberOrderRound extends StatefulWidget {
  final int orderLength;
  RememberOrderRound({this.orderLength});
  @override
  _RememberOrderRoundState createState() => _RememberOrderRoundState(orderLength);
}

class _RememberOrderRoundState extends State<RememberOrderRound> {
  int _orderLength;
  List <OrderItem>_data;
  bool _isAction;
  Map _score = {};
  List <OrderItem>_shuffledData;

  _RememberOrderRoundState(this._orderLength);
  List<Row> getOrderElement() {
    List<Row> order = [];
    for (int i = 0; i < _data.length; i++) {
      order.add(
        Row(
          children: <Widget>[
            Text((i + 1).toString()),
            Container(
              margin: EdgeInsets.all(10),
              height: 100,
              child: Image.asset(_data[i].pic),
            )
          ],
        ),
      );
    }
    return order;
  }

  @override
  void initState() {
    _data = getData(_orderLength);
    _shuffledData =List<OrderItem>.from(_data);
    _shuffledData.shuffle();
    print(_data.length);
    _isAction = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isAction
        ? Container(
            child: Row(
              children: <Widget>[
                Column(
                  children: _shuffledData.map((item) {
                    return Draggable<OrderItem>(
                      data: item,
                      feedback: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(item.pic),
                        height: 100,
                      ),
                      child: (_score[item] == true)?Container():Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(item.pic),
                        height: 100,
                      ),
                      childWhenDragging: Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                Column(
                  children: _data
                      .map(
                        (e) => DragTarget<OrderItem>(
                            builder: (BuildContext context, List incoming,
                                List rejected) {
                              return _score[e] == true
                                  ? Container( margin: EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                color: Colors.lightBlue,
                                child: Image.asset(e.pic),)
                                  : Container(
                                      margin: EdgeInsets.all(10),
                                      height: 100,
                                      width: 100,
                                      color: Colors.lightBlue,
                                      child: Text((e.number + 1).toString()),
                                    );
                            },
                            onWillAccept: (data) => data.number == e.number,
                            onAccept: (e) {
                              setState(() {
                                _score[e] = true;
                              });
                              if(_score.length == _data.length){
                                RememberOrderState().nextRound();
                              }
                            }),
                      )
                      .toList(),
                ),
              ],
            ),
          )
        : Container(
            child: Column(children: [
              Wrap(
                children: <Widget>[Column(children: getOrderElement())],
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 150,
                  child: Text('Go'),
                  color: Colors.lightBlueAccent,
                  alignment: Alignment.center
                  ,
                ),
                onTap: (){
                  setState(() {
                    _isAction = true;
                  });
                },
              ),
            ]),
          );
  }
}

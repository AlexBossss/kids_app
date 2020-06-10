import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/rightway/core/model/cardItem.dart';
import 'package:kidsapp/games/logic/rightway/core/viewmodel/data.dart';

import 'package:provider/provider.dart';

class DraggableWidget extends StatelessWidget {
  DraggableWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  CardItem item;

  @override
  Widget build(BuildContext context) {
    print(
        'List last index  is ${Provider.of<Data>(context).itemsList.length - 1}');
    return Draggable(
      data: Provider.of<Data>(context).itemsList[i],
      childWhenDragging: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Provider.of<Data>(context).itemsList[i].cardColor,
          child: Center(
            child:
                Image(image: Provider.of<Data>(context).itemsList[i].content),
          ),
        ),
      ),
      feedback: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList[i].cardColor,
          child: Center(
              child: Image(
            image: Provider.of<Data>(context).itemsList[i].content,
          )),
        ),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList[i].cardColor,
          child: Center(
              child: Image(
            image: Provider.of<Data>(context).itemsList[i].content,
          )),
        ),
      ),
    );
  }
}

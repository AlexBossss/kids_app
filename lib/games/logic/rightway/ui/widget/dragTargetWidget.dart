import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/rightway/core/model/cardItem.dart';
import 'package:kidsapp/games/logic/rightway/core/viewmodel/data.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/colors.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/strings.dart';
import 'package:provider/provider.dart';

class DragTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (CardItem data) {
      if (data.cardColor == RED_COLOR) {
        Provider.of<Data>(context, listen: false).removeLastItem();
        Provider.of<Data>(context, listen: false).changeSuccessDrop(true);
        Provider.of<Data>(context, listen: false).changeAcceptedData(data);
        // scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Correct!")));
      }
    }, builder: (context, List<CardItem> cd, rd) {
      if (Provider.of<Data>(context).isSuccessDrop) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children:
                buildTargetList(Provider.of<Data>(context).getAcceptedData),
          ),
        );
      } else {
        return Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DottedBorder(
              color: Colors.black,
              strokeWidth: 1,
              child: Container(
                  height: 150.0,
                  width: 150.0,
                  color: Colors.grey[400],
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.grey[400],
                    child: Center(
                      child: Text(
                        DROP_ITEMS_HERE,
                        style: TextStyle(color: Colors.black, fontSize: 22.0),
                      ),
                    ),
                  )),
            ),
          ),
        ]);
      }
    });
  }

  List<Widget> buildTargetList(CardItem cardItem) {
    List<Widget> targetList = [];
    targetList.add(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: DottedBorder(
          strokeWidth: 1,
          color: Colors.black,
          child: Container(
            height: 150.0,
            width: 150.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: cardItem.cardColor,
              child: Center(
                child: Image(image: cardItem.content),
              ),
            ),
          ),
        ),
      ),
    );

    return targetList;
  }
}

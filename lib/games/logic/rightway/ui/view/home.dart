import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/rightway/core/viewmodel/data.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/strings.dart';
import 'package:kidsapp/games/logic/rightway/ui/widget/cardStackWidget.dart';
import 'package:kidsapp/games/logic/rightway/ui/widget/dragTargetWidget.dart';
import 'package:kidsapp/games/logic/rightway/ui/widget/dragTargetWidgetTwo.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_BAR_TITLE),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<Data>(context, listen: false).initializeDraggableList();
          Provider.of<Data>(context, listen: false).changeSuccessDrop(false);
          Provider.of<Data>(context, listen: false).changeSuccessDropTwo(false);
        },
        elevation: 20.0,
        label: Text('Reset'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 12.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardStackWidget(),
              Row(
                children: <Widget>[
                  DragTargetWidget(),
                  DragTargetWidgetTwo(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

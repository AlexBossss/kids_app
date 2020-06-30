import 'package:kidsapp/games/logic/rightway/core/model/cardItem.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/colors.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/strings.dart';

class Constants {
  static const String SPLASH_SCREEN = 'SPLASH_SCREEN';
  static const String HOME_SCREEN = 'HOME_SCREEN';

  static List<CardItem> initializeList(List<CardItem> itemList) {
    itemList = [
      CardItem(content: FOX, cardColor: RED_COLOR),
      CardItem(content: HIPPO, cardColor: BLUE_COLOR),
      CardItem(content: HORSE, cardColor: BLUE_COLOR),
      CardItem(content: MONKEY, cardColor: RED_COLOR),
      CardItem(content: ALEX, cardColor: BLUE_COLOR),
      // CardItem(content: NODEJS, cardColor: BLUE_COLOR),
    ];
    itemList.shuffle();
    return itemList;
  }
}

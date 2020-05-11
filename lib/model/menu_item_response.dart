import 'package:first_app/model/dish_item_response.dart';
import 'package:first_app/model/json_serializable.dart';

class MenuItem extends JsonMapDeserializable {
  String menuCategoryId;
String menuCategory;
String menuCategoryImage;
List<DishItem> menuCategoryDishes;

  @override
  void fromJson(Map<String, dynamic> json) {
    menuCategoryId = json["menu_category_id"];
    menuCategory = json["menu_category"];
    menuCategoryImage = json["menu_category_image"];
    menuCategoryDishes=(json["category_dishes"] ?? <DishItem>[])
        .map<DishItem>(
            (dynamic _dishMeta) => DishItem()..fromJson(_dishMeta))
        .toList();
  }

}

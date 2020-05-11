import 'package:first_app/model/json_serializable.dart';
import 'package:first_app/model/menu_item_response.dart';

class RestaurentItem extends JsonMapDeserializable {
  String restaurentId;
String restaurentName;
List<MenuItem> tableMenuList;

RestaurentItem();
RestaurentItem.empty(){
  restaurentId="0";
  restaurentName="";
  tableMenuList=[];
}


  @override
  void fromJson(Map<String, dynamic> json) {
    restaurentId = json["restaurant_id"];
    restaurentName = json["restaurant_name"];
    tableMenuList=(json["table_menu_list"] ?? <MenuItem>[])
        .map<MenuItem>(
            (dynamic _menuMeta) => MenuItem()..fromJson(_menuMeta))
        .toList();
  }

}

import 'package:first_app/model/json_serializable.dart';

class DishItem extends JsonMapDeserializable {
  String dishId;
String dishName;
double dishPrice;
String dishImage;
String dishCurrency;
double dishCalories;
String dishDescription;
bool dishAvailability;
int dishType;
bool addOnCat;

  @override
  void fromJson(Map<String, dynamic> json) {
    dishId = json["dish_id"];
    dishName = json["dish_name"];
    dishPrice = json["dish_price"];
    dishImage = json["dish_image"];
    dishCurrency = json["dish_currency"];
    dishCalories = json["dish_calories"];
    dishDescription = json["dish_description"];
    dishAvailability = json["dish_Avadish_Typeilability"];
    dishType = json["dish_Type"];
    addOnCat=json["addonCat"].isNotEmpty;
  }

}

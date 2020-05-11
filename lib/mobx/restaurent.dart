import 'package:first_app/model/restaurent_item_response.dart';
import 'package:first_app/model/restaurent_list_response.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// Include generated file
part 'restaurent.g.dart';

// This is the class used by rest of your codebase
class RestaurentStore = _RestaurentStore with _$RestaurentStore;

// The store-class
abstract class _RestaurentStore with Store {
  @observable
  int cartItemCounter = 0;

  @observable
  RestaurentListResponse _restaurents = RestaurentListResponse.empty();

  @computed
  RestaurentItem get restaurent => _restaurents.restaurents.isNotEmpty
      ? _restaurents.restaurents[0]
      : RestaurentItem.empty();

  @action
  void addToCart() {
    cartItemCounter++;
  }

  @action
  void removeFromCart() {
    cartItemCounter--;
  }

  @action
  Future<void> getRestaurents() async {
    var url = 'http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      _restaurents = RestaurentListResponse()..fromJson(jsonResponse);
    } else {}
  }
}

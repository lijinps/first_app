import 'package:first_app/model/dish_item_response.dart';
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
  List<DishItem> cartItems = [];

  @observable
  RestaurentListResponse _restaurents = RestaurentListResponse.empty();

  @computed
  RestaurentItem get restaurent => _restaurents.restaurents.isNotEmpty
      ? _restaurents.restaurents[0]
      : RestaurentItem.empty();


  @action 
  int getQuantity(String dishId){
    var cartItem = cartItems.firstWhere(
        (item) => item.dishId == dishId,
        orElse: () => null);
    if (cartItem == null) {
      return 0;
    } else {
     return cartItem.cartQuantity;
    }
  }

  @action
  void addToCart(DishItem selectedItem) {
    var cartItem = cartItems.firstWhere(
        (item) => item.dishId == selectedItem.dishId,
        orElse: () => null);
    if (cartItem == null) {
      selectedItem.cartQuantity++;
      cartItems.add(selectedItem);
    } else {
      cartItems.remove(cartItem);
      cartItem.cartQuantity++;
      cartItems.add(cartItem);
    }
    cartItemCounter++;
  }

  @action
  void removeFromCart(DishItem selectedItem) {
    cartItemCounter--;
    var cartItem = cartItems.firstWhere(
        (item) => item.dishId == selectedItem.dishId,
        orElse: () => null);
    if (cartItem != null) {
      if(cartItem.cartQuantity==1){
      cartItems.remove(cartItem);
      }
      else {
      cartItems.remove(cartItem);
      cartItem.cartQuantity--;
      cartItems.add(cartItem);
    }
    } 
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

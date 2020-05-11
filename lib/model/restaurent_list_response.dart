import 'package:first_app/model/json_serializable.dart';
import 'package:first_app/model/restaurent_item_response.dart';

class RestaurentListResponse extends JsonListDeserializable {
List<RestaurentItem> restaurents;

RestaurentListResponse();
RestaurentListResponse.empty(){
  restaurents=[];
}
  @override
  void fromJson(List<dynamic> json) {
    restaurents = json.map<RestaurentItem>((dynamic _meta) =>
        RestaurentItem()..fromJson(_meta))
      .toList();
  }

}

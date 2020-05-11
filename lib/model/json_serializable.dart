mixin JsonSerializable<T> {
  T toJson();
}

mixin JsonDeserializable<T> {
  void fromJson(T json);
}

abstract class JsonMapSerializable with JsonSerializable<Map<String, dynamic>> {
}

abstract class JsonMapDeserializable
    with JsonDeserializable<Map<String, dynamic>> {}

abstract class JsonListSerializable
    with JsonSerializable<List<dynamic>> {}

abstract class JsonListDeserializable
    with JsonDeserializable<List<dynamic>> {}

abstract class JsonMapConvertable
    with
        JsonSerializable<Map<String, dynamic>>,
        JsonDeserializable<Map<String, dynamic>> {}

abstract class JsonListConvertable
    with
        JsonSerializable<List<dynamic>>,
        JsonDeserializable<List<dynamic>> {}

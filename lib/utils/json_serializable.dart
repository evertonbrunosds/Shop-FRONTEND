abstract class JsonSerializable {
  T toType<T>(final Map<String, Object> content);
  Map<String, Object> toJson();
}

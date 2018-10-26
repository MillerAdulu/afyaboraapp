library resource;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'resource.g.dart';

abstract class ResourceData implements Built<ResourceData, ResourceDataBuilder> {
  BuiltList<Resource> get articles;

  ResourceData._();
  factory ResourceData([updates(ResourceDataBuilder resourceDataBuilder)]) = _$ResourceData;
  static Serializer<ResourceData> get serializer => _$resourceDataSerializer;
}

abstract class Resource implements Built<Resource, ResourceBuilder> {
  String get title;
  String get url;  
  String get thumb;

  Resource._();
  factory Resource([updates(ResourceBuilder resourceBuilder)]) = _$Resource;
  static Serializer<Resource> get serializer => _$resourceSerializer;

}

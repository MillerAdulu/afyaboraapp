library user;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class UserData implements Built<UserData, UserDataBuilder> {
  User get user;

  UserData._();
  factory UserData([updates(UserDataBuilder userDataBuilder)]) = _$UserData;
  static Serializer<UserData> get serializer => _$userDataSerializer;
}

abstract class User implements Built<User, UserBuilder> {
  String get id;
  String get email;
  @nullable
  String get firstName;
  @nullable
  String get lastName;
  @nullable
  String get gender;
  @nullable
  double get weight;
  @nullable
  double get height;
  @nullable
  String get insurance;

  User._();
  factory User([updates(UserBuilder userBuilder)]) = _$User;
  static Serializer<User> get serializer => _$userSerializer;

}

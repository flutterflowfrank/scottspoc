import 'package:collection/collection.dart';

enum Navigation {
  ManagePlants,
  ManageForms,
  ManageUsers,
  CheckForms,
  Settings,
  History,
  BagCheck,
  StartupChecklist,
  Home,
}

enum ControlType {
  freetext,
  passfail,
  number,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Navigation):
      return Navigation.values.deserialize(value) as T?;
    case (ControlType):
      return ControlType.values.deserialize(value) as T?;
    default:
      return null;
  }
}

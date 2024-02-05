// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    int? intervalMinutes,
    bool? isActive,
    bool? isRequired,
    String? label,
    ControlType? controlType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _intervalMinutes = intervalMinutes,
        _isActive = isActive,
        _isRequired = isRequired,
        _label = label,
        _controlType = controlType,
        super(firestoreUtilData);

  // "intervalMinutes" field.
  int? _intervalMinutes;
  int get intervalMinutes => _intervalMinutes ?? 0;
  set intervalMinutes(int? val) => _intervalMinutes = val;
  void incrementIntervalMinutes(int amount) =>
      _intervalMinutes = intervalMinutes + amount;
  bool hasIntervalMinutes() => _intervalMinutes != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;
  bool hasIsActive() => _isActive != null;

  // "isRequired" field.
  bool? _isRequired;
  bool get isRequired => _isRequired ?? false;
  set isRequired(bool? val) => _isRequired = val;
  bool hasIsRequired() => _isRequired != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "controlType" field.
  ControlType? _controlType;
  ControlType get controlType => _controlType ?? ControlType.freetext;
  set controlType(ControlType? val) => _controlType = val;
  bool hasControlType() => _controlType != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        intervalMinutes: castToType<int>(data['intervalMinutes']),
        isActive: data['isActive'] as bool?,
        isRequired: data['isRequired'] as bool?,
        label: data['label'] as String?,
        controlType: deserializeEnum<ControlType>(data['controlType']),
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'intervalMinutes': _intervalMinutes,
        'isActive': _isActive,
        'isRequired': _isRequired,
        'label': _label,
        'controlType': _controlType?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'intervalMinutes': serializeParam(
          _intervalMinutes,
          ParamType.int,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'isRequired': serializeParam(
          _isRequired,
          ParamType.bool,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'controlType': serializeParam(
          _controlType,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        intervalMinutes: deserializeParam(
          data['intervalMinutes'],
          ParamType.int,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
        isRequired: deserializeParam(
          data['isRequired'],
          ParamType.bool,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        controlType: deserializeParam<ControlType>(
          data['controlType'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionStruct &&
        intervalMinutes == other.intervalMinutes &&
        isActive == other.isActive &&
        isRequired == other.isRequired &&
        label == other.label &&
        controlType == other.controlType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([intervalMinutes, isActive, isRequired, label, controlType]);
}

QuestionStruct createQuestionStruct({
  int? intervalMinutes,
  bool? isActive,
  bool? isRequired,
  String? label,
  ControlType? controlType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      intervalMinutes: intervalMinutes,
      isActive: isActive,
      isRequired: isRequired,
      label: label,
      controlType: controlType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];

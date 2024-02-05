// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MIPCheckStruct extends FFFirebaseStruct {
  MIPCheckStruct({
    String? plantType,
    String? productType,
    List<QuestionStruct>? questions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _plantType = plantType,
        _productType = productType,
        _questions = questions,
        super(firestoreUtilData);

  // "plantType" field.
  String? _plantType;
  String get plantType => _plantType ?? '';
  set plantType(String? val) => _plantType = val;
  bool hasPlantType() => _plantType != null;

  // "productType" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;
  bool hasProductType() => _productType != null;

  // "questions" field.
  List<QuestionStruct>? _questions;
  List<QuestionStruct> get questions => _questions ?? const [];
  set questions(List<QuestionStruct>? val) => _questions = val;
  void updateQuestions(Function(List<QuestionStruct>) updateFn) =>
      updateFn(_questions ??= []);
  bool hasQuestions() => _questions != null;

  static MIPCheckStruct fromMap(Map<String, dynamic> data) => MIPCheckStruct(
        plantType: data['plantType'] as String?,
        productType: data['productType'] as String?,
        questions: getStructList(
          data['questions'],
          QuestionStruct.fromMap,
        ),
      );

  static MIPCheckStruct? maybeFromMap(dynamic data) =>
      data is Map ? MIPCheckStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'plantType': _plantType,
        'productType': _productType,
        'questions': _questions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plantType': serializeParam(
          _plantType,
          ParamType.String,
        ),
        'productType': serializeParam(
          _productType,
          ParamType.String,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MIPCheckStruct fromSerializableMap(Map<String, dynamic> data) =>
      MIPCheckStruct(
        plantType: deserializeParam(
          data['plantType'],
          ParamType.String,
          false,
        ),
        productType: deserializeParam(
          data['productType'],
          ParamType.String,
          false,
        ),
        questions: deserializeStructParam<QuestionStruct>(
          data['questions'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MIPCheckStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MIPCheckStruct &&
        plantType == other.plantType &&
        productType == other.productType &&
        listEquality.equals(questions, other.questions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([plantType, productType, questions]);
}

MIPCheckStruct createMIPCheckStruct({
  String? plantType,
  String? productType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MIPCheckStruct(
      plantType: plantType,
      productType: productType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MIPCheckStruct? updateMIPCheckStruct(
  MIPCheckStruct? mIPCheck, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mIPCheck
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMIPCheckStructData(
  Map<String, dynamic> firestoreData,
  MIPCheckStruct? mIPCheck,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mIPCheck == null) {
    return;
  }
  if (mIPCheck.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mIPCheck.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mIPCheckData = getMIPCheckFirestoreData(mIPCheck, forFieldValue);
  final nestedData = mIPCheckData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mIPCheck.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMIPCheckFirestoreData(
  MIPCheckStruct? mIPCheck, [
  bool forFieldValue = false,
]) {
  if (mIPCheck == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mIPCheck.toMap());

  // Add any Firestore field values
  mIPCheck.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMIPCheckListFirestoreData(
  List<MIPCheckStruct>? mIPChecks,
) =>
    mIPChecks?.map((e) => getMIPCheckFirestoreData(e, true)).toList() ?? [];

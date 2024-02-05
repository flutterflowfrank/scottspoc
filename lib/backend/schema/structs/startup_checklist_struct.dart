// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StartupChecklistStruct extends FFFirebaseStruct {
  StartupChecklistStruct({
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

  static StartupChecklistStruct fromMap(Map<String, dynamic> data) =>
      StartupChecklistStruct(
        plantType: data['plantType'] as String?,
        productType: data['productType'] as String?,
        questions: getStructList(
          data['questions'],
          QuestionStruct.fromMap,
        ),
      );

  static StartupChecklistStruct? maybeFromMap(dynamic data) => data is Map
      ? StartupChecklistStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static StartupChecklistStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StartupChecklistStruct(
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
  String toString() => 'StartupChecklistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StartupChecklistStruct &&
        plantType == other.plantType &&
        productType == other.productType &&
        listEquality.equals(questions, other.questions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([plantType, productType, questions]);
}

StartupChecklistStruct createStartupChecklistStruct({
  String? plantType,
  String? productType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StartupChecklistStruct(
      plantType: plantType,
      productType: productType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StartupChecklistStruct? updateStartupChecklistStruct(
  StartupChecklistStruct? startupChecklist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    startupChecklist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStartupChecklistStructData(
  Map<String, dynamic> firestoreData,
  StartupChecklistStruct? startupChecklist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (startupChecklist == null) {
    return;
  }
  if (startupChecklist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && startupChecklist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final startupChecklistData =
      getStartupChecklistFirestoreData(startupChecklist, forFieldValue);
  final nestedData =
      startupChecklistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = startupChecklist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStartupChecklistFirestoreData(
  StartupChecklistStruct? startupChecklist, [
  bool forFieldValue = false,
]) {
  if (startupChecklist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(startupChecklist.toMap());

  // Add any Firestore field values
  startupChecklist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStartupChecklistListFirestoreData(
  List<StartupChecklistStruct>? startupChecklists,
) =>
    startupChecklists
        ?.map((e) => getStartupChecklistFirestoreData(e, true))
        .toList() ??
    [];

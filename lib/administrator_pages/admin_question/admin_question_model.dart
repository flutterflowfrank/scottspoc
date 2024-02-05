import '/flutter_flow/flutter_flow_util.dart';
import 'admin_question_widget.dart' show AdminQuestionWidget;
import 'package:flutter/material.dart';

class AdminQuestionModel extends FlutterFlowModel<AdminQuestionWidget> {
  ///  Local state fields for this component.

  bool inEditMode = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

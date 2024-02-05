import '/components/base_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_edit_startup_checklist_widget.dart'
    show AdminEditStartupChecklistWidget;
import 'package:flutter/material.dart';

class AdminEditStartupChecklistModel
    extends FlutterFlowModel<AdminEditStartupChecklistWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for baseButton component.
  late BaseButtonModel baseButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    baseButtonModel = createModel(context, () => BaseButtonModel());
  }

  @override
  void dispose() {
    baseButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

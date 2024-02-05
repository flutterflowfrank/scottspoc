import '/components/base_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_edit_mip_checklist_widget.dart' show AdminEditMipChecklistWidget;
import 'package:flutter/material.dart';

class AdminEditMipChecklistModel
    extends FlutterFlowModel<AdminEditMipChecklistWidget> {
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

import '/components/base_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'm_i_p_checklist_component_widget.dart' show MIPChecklistComponentWidget;
import 'package:flutter/material.dart';

class MIPChecklistComponentModel
    extends FlutterFlowModel<MIPChecklistComponentWidget> {
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

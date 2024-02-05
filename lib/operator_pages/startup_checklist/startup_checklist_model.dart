import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import '/operator_pages/startup_checklist_component/startup_checklist_component_widget.dart';
import 'startup_checklist_widget.dart' show StartupChecklistWidget;
import 'package:flutter/material.dart';

class StartupChecklistModel extends FlutterFlowModel<StartupChecklistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for StartupChecklistComponent component.
  late StartupChecklistComponentModel startupChecklistComponentModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    appBarModel = createModel(context, () => AppBarModel());
    startupChecklistComponentModel =
        createModel(context, () => StartupChecklistComponentModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel1.dispose();
    appBarModel.dispose();
    startupChecklistComponentModel.dispose();
    sideNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

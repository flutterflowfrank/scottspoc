import '/administrator_pages/admin_edit_mip_checklist/admin_edit_mip_checklist_widget.dart';
import '/administrator_pages/admin_edit_startup_checklist/admin_edit_startup_checklist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import 'manage_forms_widget.dart' show ManageFormsWidget;
import 'package:flutter/material.dart';

class ManageFormsModel extends FlutterFlowModel<ManageFormsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for AdminEditMipChecklist component.
  late AdminEditMipChecklistModel adminEditMipChecklistModel;
  // Model for AdminEditStartupChecklist component.
  late AdminEditStartupChecklistModel adminEditStartupChecklistModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    appBarModel = createModel(context, () => AppBarModel());
    adminEditMipChecklistModel =
        createModel(context, () => AdminEditMipChecklistModel());
    adminEditStartupChecklistModel =
        createModel(context, () => AdminEditStartupChecklistModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel1.dispose();
    appBarModel.dispose();
    tabBarController?.dispose();
    adminEditMipChecklistModel.dispose();
    adminEditStartupChecklistModel.dispose();
    sideNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/components/completed_checks_list_item_widget.dart';
import '/components/forms_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for FormsListItem component.
  late FormsListItemModel formsListItemModel1;
  // Model for FormsListItem component.
  late FormsListItemModel formsListItemModel2;
  // Model for FormsListItem component.
  late FormsListItemModel formsListItemModel3;
  // Model for FormsListItem component.
  late FormsListItemModel formsListItemModel4;
  // Model for CompletedChecksListItem component.
  late CompletedChecksListItemModel completedChecksListItemModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    appBarModel = createModel(context, () => AppBarModel());
    formsListItemModel1 = createModel(context, () => FormsListItemModel());
    formsListItemModel2 = createModel(context, () => FormsListItemModel());
    formsListItemModel3 = createModel(context, () => FormsListItemModel());
    formsListItemModel4 = createModel(context, () => FormsListItemModel());
    completedChecksListItemModel =
        createModel(context, () => CompletedChecksListItemModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel1.dispose();
    appBarModel.dispose();
    formsListItemModel1.dispose();
    formsListItemModel2.dispose();
    formsListItemModel3.dispose();
    formsListItemModel4.dispose();
    completedChecksListItemModel.dispose();
    sideNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

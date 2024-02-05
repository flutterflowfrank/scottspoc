import '/components/bag_check_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import '/operator_pages/m_i_p_checklist_component/m_i_p_checklist_component_widget.dart';
import 'm_i_p_bag_check_widget.dart' show MIPBagCheckWidget;
import 'package:flutter/material.dart';

class MIPBagCheckModel extends FlutterFlowModel<MIPBagCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel1;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for MIPChecklistComponent component.
  late MIPChecklistComponentModel mIPChecklistComponentModel;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel1;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel2;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel3;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel4;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel5;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel6;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel7;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel8;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel9;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel10;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel11;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel12;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel13;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel14;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel15;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel16;
  // Model for bagCheckInput component.
  late BagCheckInputModel bagCheckInputModel17;
  // Model for sideNav component.
  late SideNavModel sideNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel1 = createModel(context, () => SideNavModel());
    appBarModel = createModel(context, () => AppBarModel());
    mIPChecklistComponentModel =
        createModel(context, () => MIPChecklistComponentModel());
    bagCheckInputModel1 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel2 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel3 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel4 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel5 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel6 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel7 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel8 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel9 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel10 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel11 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel12 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel13 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel14 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel15 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel16 = createModel(context, () => BagCheckInputModel());
    bagCheckInputModel17 = createModel(context, () => BagCheckInputModel());
    sideNavModel2 = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel1.dispose();
    appBarModel.dispose();
    tabBarController?.dispose();
    mIPChecklistComponentModel.dispose();
    bagCheckInputModel1.dispose();
    bagCheckInputModel2.dispose();
    bagCheckInputModel3.dispose();
    bagCheckInputModel4.dispose();
    bagCheckInputModel5.dispose();
    bagCheckInputModel6.dispose();
    bagCheckInputModel7.dispose();
    bagCheckInputModel8.dispose();
    bagCheckInputModel9.dispose();
    bagCheckInputModel10.dispose();
    bagCheckInputModel11.dispose();
    bagCheckInputModel12.dispose();
    bagCheckInputModel13.dispose();
    bagCheckInputModel14.dispose();
    bagCheckInputModel15.dispose();
    bagCheckInputModel16.dispose();
    bagCheckInputModel17.dispose();
    sideNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

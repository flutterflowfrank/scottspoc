import '/components/login_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'log_in_register_widget.dart' show LogInRegisterWidget;
import 'package:flutter/material.dart';

class LogInRegisterModel extends FlutterFlowModel<LogInRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for nameDropDown widget.
  String? nameDropDownValue;
  FormFieldController<String>? nameDropDownValueController;
  // State field(s) for lineDropDown widget.
  String? lineDropDownValue;
  FormFieldController<String>? lineDropDownValueController;
  // State field(s) for shiftDropDown widget.
  String? shiftDropDownValue;
  FormFieldController<String>? shiftDropDownValueController;
  // State field(s) for productDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // Model for loginButton component.
  late LoginButtonModel loginButtonModel1;
  // State field(s) for emailAddressSignIn widget.
  FocusNode? emailAddressSignInFocusNode;
  TextEditingController? emailAddressSignInController;
  String? Function(BuildContext, String?)?
      emailAddressSignInControllerValidator;
  // State field(s) for passwordSignIn widget.
  FocusNode? passwordSignInFocusNode;
  TextEditingController? passwordSignInController;
  late bool passwordSignInVisibility;
  String? Function(BuildContext, String?)? passwordSignInControllerValidator;
  // Model for loginButton component.
  late LoginButtonModel loginButtonModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginButtonModel1 = createModel(context, () => LoginButtonModel());
    passwordSignInVisibility = false;
    loginButtonModel2 = createModel(context, () => LoginButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    loginButtonModel1.dispose();
    emailAddressSignInFocusNode?.dispose();
    emailAddressSignInController?.dispose();

    passwordSignInFocusNode?.dispose();
    passwordSignInController?.dispose();

    loginButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

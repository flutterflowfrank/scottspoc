import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checklist_submit_model.dart';
export 'checklist_submit_model.dart';

class ChecklistSubmitWidget extends StatefulWidget {
  const ChecklistSubmitWidget({super.key});

  @override
  State<ChecklistSubmitWidget> createState() => _ChecklistSubmitWidgetState();
}

class _ChecklistSubmitWidgetState extends State<ChecklistSubmitWidget> {
  late ChecklistSubmitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChecklistSubmitModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}

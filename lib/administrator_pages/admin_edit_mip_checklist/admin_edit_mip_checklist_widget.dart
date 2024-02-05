import '/administrator_pages/admin_question/admin_question_widget.dart';
import '/backend/schema/structs/index.dart';
import '/components/base_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_edit_mip_checklist_model.dart';
export 'admin_edit_mip_checklist_model.dart';

class AdminEditMipChecklistWidget extends StatefulWidget {
  const AdminEditMipChecklistWidget({
    super.key,
    required this.questions,
  });

  final MIPCheckStruct? questions;

  @override
  State<AdminEditMipChecklistWidget> createState() =>
      _AdminEditMipChecklistWidgetState();
}

class _AdminEditMipChecklistWidgetState
    extends State<AdminEditMipChecklistWidget> {
  late AdminEditMipChecklistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminEditMipChecklistModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Builder(
                    builder: (context) {
                      final questions =
                          widget.questions?.questions.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: questions.length,
                        itemBuilder: (context, questionsIndex) {
                          final questionsItem = questions[questionsIndex];
                          return Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: AdminQuestionWidget(
                                key: Key(
                                    'Keyaru_${questionsIndex}_of_${questions.length}'),
                                data: questionsItem,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 16.0, 32.0),
                  child: Container(
                    width: 200.0,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: wrapWithModel(
                        model: _model.baseButtonModel,
                        updateCallback: () => setState(() {}),
                        child: BaseButtonWidget(
                          icon: const Icon(
                            Icons.check_circle_outline_sharp,
                          ),
                          label: 'Submit',
                          onTap: () async {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

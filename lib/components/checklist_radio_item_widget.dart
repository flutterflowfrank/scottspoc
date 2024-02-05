import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checklist_radio_item_model.dart';
export 'checklist_radio_item_model.dart';

class ChecklistRadioItemWidget extends StatefulWidget {
  const ChecklistRadioItemWidget({
    super.key,
    required this.optionValue,
  });

  final String? optionValue;

  @override
  State<ChecklistRadioItemWidget> createState() =>
      _ChecklistRadioItemWidgetState();
}

class _ChecklistRadioItemWidgetState extends State<ChecklistRadioItemWidget> {
  late ChecklistRadioItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChecklistRadioItemModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.optionValue,
                    '<placeholder>',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'uxute7a1' /* *must pass */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Sora',
                          color: FlutterFlowTheme.of(context).error,
                        ),
                  ),
                ),
              ],
            ),
            FlutterFlowRadioButton(
              options: [
                FFLocalizations.of(context).getText(
                  'nlf6qpsb' /* Failed */,
                ),
                FFLocalizations.of(context).getText(
                  '95xfbp70' /* Passed */,
                )
              ].toList(),
              onChanged: (val) => setState(() {}),
              controller: _model.radioButtonValueController ??=
                  FormFieldController<String>(null),
              optionHeight: 32.0,
              textStyle: FlutterFlowTheme.of(context).labelMedium,
              selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium,
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.horizontal,
              radioButtonColor: FlutterFlowTheme.of(context).primary,
              inactiveRadioButtonColor:
                  FlutterFlowTheme.of(context).secondaryText,
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
          ].divide(const SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}

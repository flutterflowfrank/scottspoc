import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'completed_checks_list_item_model.dart';
export 'completed_checks_list_item_model.dart';

class CompletedChecksListItemWidget extends StatefulWidget {
  const CompletedChecksListItemWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.date,
    bool? isMissed,
  }) : isMissed = isMissed ?? false;

  final String? label;
  final Future Function()? onTap;
  final String? date;
  final bool isMissed;

  @override
  State<CompletedChecksListItemWidget> createState() =>
      _CompletedChecksListItemWidgetState();
}

class _CompletedChecksListItemWidgetState
    extends State<CompletedChecksListItemWidget> {
  late CompletedChecksListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletedChecksListItemModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      if (!widget.isMissed)
                        Icon(
                          Icons.check_circle_outlined,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      if (widget.isMissed)
                        Icon(
                          Icons.hourglass_top,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 24.0,
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.label,
                        'label',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Sora',
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.date,
                      'date',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

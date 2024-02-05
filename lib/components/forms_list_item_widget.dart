import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'forms_list_item_model.dart';
export 'forms_list_item_model.dart';

class FormsListItemWidget extends StatefulWidget {
  const FormsListItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget? icon;
  final String? label;
  final Future Function()? onTap;

  @override
  State<FormsListItemWidget> createState() => _FormsListItemWidgetState();
}

class _FormsListItemWidgetState extends State<FormsListItemWidget> {
  late FormsListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormsListItemModel());

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
                  widget.icon!,
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
              FaIcon(
                FontAwesomeIcons.angleRight,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

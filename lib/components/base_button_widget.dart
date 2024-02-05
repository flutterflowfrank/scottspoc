import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_button_model.dart';
export 'base_button_model.dart';

class BaseButtonWidget extends StatefulWidget {
  const BaseButtonWidget({
    super.key,
    this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget? icon;
  final String? label;
  final Future Function()? onTap;

  @override
  State<BaseButtonWidget> createState() => _BaseButtonWidgetState();
}

class _BaseButtonWidgetState extends State<BaseButtonWidget> {
  late BaseButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseButtonModel());

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

    return FFButtonWidget(
      onPressed: () async {
        await widget.onTap?.call();
      },
      text: widget.label!,
      icon: widget.icon,
      options: FFButtonOptions(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Sora',
              color: Colors.white,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

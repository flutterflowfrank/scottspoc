import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'side_nav_page_item_model.dart';
export 'side_nav_page_item_model.dart';

class SideNavPageItemWidget extends StatefulWidget {
  const SideNavPageItemWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final String? label;
  final bool? isSelected;
  final Widget? icon;
  final Future Function()? onTap;

  @override
  State<SideNavPageItemWidget> createState() => _SideNavPageItemWidgetState();
}

class _SideNavPageItemWidgetState extends State<SideNavPageItemWidget> {
  late SideNavPageItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavPageItemModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.onTap?.call();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: 44.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                () {
                  if (widget.isSelected!) {
                    return FlutterFlowTheme.of(context).tertiary;
                  } else if (_model.mouseRegionHovered) {
                    return FlutterFlowTheme.of(context).tertiary;
                  } else {
                    return FlutterFlowTheme.of(context).primary;
                  }
                }(),
                FlutterFlowTheme.of(context).primary,
              ),
              borderRadius: BorderRadius.circular(4.0),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
              child: Row(
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

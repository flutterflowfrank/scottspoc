import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import '/operator_pages/startup_checklist_component/startup_checklist_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'startup_checklist_model.dart';
export 'startup_checklist_model.dart';

class StartupChecklistWidget extends StatefulWidget {
  const StartupChecklistWidget({super.key});

  @override
  State<StartupChecklistWidget> createState() => _StartupChecklistWidgetState();
}

class _StartupChecklistWidgetState extends State<StartupChecklistWidget> {
  late StartupChecklistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartupChecklistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel2,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              currentPage: Navigation.StartupChecklist,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.sideNavModel1,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: const SideNavWidget(
                    currentPage: Navigation.StartupChecklist,
                  ),
                ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.appBarModel,
                      updateCallback: () => setState(() {}),
                      child: AppBarWidget(
                        label: 'Startup Checklist',
                        onDrawerTap: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 24.0),
                        child: StreamBuilder<StartupChecklistsRecord>(
                          stream: StartupChecklistsRecord.getDocument(
                              functions.startupCheckListRefFromString()!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnStartupChecklistsRecord =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'iqk7fhsj' /* Please carefully review each c... */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                wrapWithModel(
                                  model: _model.startupChecklistComponentModel,
                                  updateCallback: () => setState(() {}),
                                  child: StartupChecklistComponentWidget(
                                    questions: columnStartupChecklistsRecord
                                        .startupChecklist,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

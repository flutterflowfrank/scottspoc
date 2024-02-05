import '/administrator_pages/admin_edit_mip_checklist/admin_edit_mip_checklist_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/bag_check_input_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'm_i_p_bag_check_edit_model.dart';
export 'm_i_p_bag_check_edit_model.dart';

class MIPBagCheckEditWidget extends StatefulWidget {
  const MIPBagCheckEditWidget({super.key});

  @override
  State<MIPBagCheckEditWidget> createState() => _MIPBagCheckEditWidgetState();
}

class _MIPBagCheckEditWidgetState extends State<MIPBagCheckEditWidget>
    with TickerProviderStateMixin {
  late MIPBagCheckEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MIPBagCheckEditModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              currentPage: Navigation.Home,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
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
                    currentPage: Navigation.BagCheck,
                  ),
                ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.appBarModel,
                    updateCallback: () => setState(() {}),
                    child: AppBarWidget(
                      label: 'Checks',
                      onDrawerTap: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.78,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    unselectedLabelStyle: const TextStyle(),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    padding: const EdgeInsets.all(4.0),
                                    tabs: [
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '6iennpk9' /* MIP Check */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'oe6ku3ai' /* 5-Bag */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'iz8bqkuj' /* 12-Bag */,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      StreamBuilder<MipChecksRecord>(
                                        stream: MipChecksRecord.getDocument(
                                            functions
                                                .mipCheckDocumentRefFromString()!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final adminEditMipChecklistMipChecksRecord =
                                              snapshot.data!;
                                          return wrapWithModel(
                                            model: _model
                                                .adminEditMipChecklistModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: AdminEditMipChecklistWidget(
                                              questions:
                                                  adminEditMipChecklistMipChecksRecord
                                                      .mipCheck,
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 455.0, 105.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          constraints: const BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const BagCheckInputWidget(
                                                    optionValue: 'Bag 1:',
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const BagCheckInputWidget(
                                                    optionValue: 'Bag 2:',
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel3,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const BagCheckInputWidget(
                                                    optionValue: 'Bag 3:',
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel4,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const BagCheckInputWidget(
                                                    optionValue: 'Bag 4:',
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel5,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const BagCheckInputWidget(
                                                    optionValue: 'Bag 5:',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(6.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Success!'),
                                                              content: const Text(
                                                                  'Startup Checklist saved!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        context.pushNamed(
                                                          'HomePage',
                                                          queryParameters: {
                                                            'name':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .operatorName,
                                                              ParamType.String,
                                                            ),
                                                            'line':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .operatorLine,
                                                              ParamType.String,
                                                            ),
                                                            'shift':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .operatorShift,
                                                              ParamType.String,
                                                            ),
                                                            'product':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .operatorProduct,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0fs0tda8' /* Submit */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 455.0, 105.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          constraints: const BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel6,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 1:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel7,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 2:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel8,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 3:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel9,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 4:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel10,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 5:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel11,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 5:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel12,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 7:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel13,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 8:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel14,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 9:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel15,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 10:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel16,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 11:',
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel17,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: const BagCheckInputWidget(
                                                      optionValue: 'Bag 12:',
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(6.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Success!'),
                                                                content: const Text(
                                                                    'Form saved!'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );

                                                          context.pushNamed(
                                                            'HomePage',
                                                            queryParameters: {
                                                              'name':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .operatorName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'line':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .operatorLine,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'shift':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .operatorShift,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'product':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .operatorProduct,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  const TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'oc95ja4t' /* Submit */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                      ],
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

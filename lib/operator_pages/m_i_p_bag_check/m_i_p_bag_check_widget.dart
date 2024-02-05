import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/bag_check_input_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navigation/app_bar/app_bar_widget.dart';
import '/navigation/side_nav/side_nav_widget.dart';
import '/operator_pages/m_i_p_checklist_component/m_i_p_checklist_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'm_i_p_bag_check_model.dart';
export 'm_i_p_bag_check_model.dart';

class MIPBagCheckWidget extends StatefulWidget {
  const MIPBagCheckWidget({
    super.key,
    int? startingTab,
  }) : startingTab = startingTab ?? 0;

  final int startingTab;

  @override
  State<MIPBagCheckWidget> createState() => _MIPBagCheckWidgetState();
}

class _MIPBagCheckWidgetState extends State<MIPBagCheckWidget>
    with TickerProviderStateMixin {
  late MIPBagCheckModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MIPBagCheckModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tabBarController!.animateTo(
          widget.startingTab,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });

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
              currentPage: Navigation.BagCheck,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: const BoxConstraints(
                      maxWidth: 1170.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.appBarModel,
                          updateCallback: () => setState(() {}),
                          child: AppBarWidget(
                            label: 'Bag Checks',
                            onDrawerTap: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 24.0, 16.0, 24.0),
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
                                          '72f23d9g' /* MIP Check */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '0n6p6wky' /* 5-Bag */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '26iyzv6z' /* 12-Bag */,
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
                                          final mIPChecklistComponentMipChecksRecord =
                                              snapshot.data!;
                                          return wrapWithModel(
                                            model: _model
                                                .mIPChecklistComponentModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: MIPChecklistComponentWidget(
                                              questions:
                                                  mIPChecklistComponentMipChecksRecord
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
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BagCheckInputWidget(
                                                    optionValue:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'tugf892n' /* Bag 1: */,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BagCheckInputWidget(
                                                    optionValue:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xod00sj1' /* Bag 2: */,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel3,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BagCheckInputWidget(
                                                    optionValue:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'e80iw7w6' /* Bag 3: */,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel4,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BagCheckInputWidget(
                                                    optionValue:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'go6nvg1t' /* Bag 4: */,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .bagCheckInputModel5,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BagCheckInputWidget(
                                                    optionValue:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'wql2lxsx' /* Bag 5: */,
                                                    ),
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
                                                        'o8f6p5ya' /* Submit */,
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
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'cwi21xpj' /* Bag 1: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel7,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'ed5nu2fm' /* Bag 2: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel8,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'hczr7q4k' /* Bag 3: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel9,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'l7zc3iti' /* Bag 4: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel10,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'mofgybsw' /* Bag 5: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel11,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'vbcol2tz' /* Bag 5: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel12,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'lpalx20h' /* Bag 7: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel13,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '52cdwltt' /* Bag 8: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel14,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '9sr7qa98' /* Bag 9: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel15,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'jp8jr6ck' /* Bag 10: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel16,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'hwuadith' /* Bag 11: */,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .bagCheckInputModel17,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: BagCheckInputWidget(
                                                      optionValue:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '1fbngyi9' /* Bag 12: */,
                                                      ),
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
                                                          'bsr4luy5' /* Submit */,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

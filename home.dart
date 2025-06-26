import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: Offset(0.0, 18.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 260.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 260.0.ms,
            begin: Offset(0.0, 18.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(64.0, 100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF7A7A7A),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('HOME_PAGE_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(SignInWidget.routeName);
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
            child: Text(
              'Sign In Page',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Product Sans',
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://images.unsplash.com/photo-1543852786-1cf6624b9987?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxjYXRzfGVufDB8fHx8MTc1MDg0MzYwMnww&ixlib=rb-4.1.0&q=80&w=1080',
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF09173A),
                  Color(0xFF732295),
                  Color(0xFFEFABAC)
                ],
                stops: [0.1, 0.5, 1],
                begin: AlignmentDirectional(1, 0.87),
                end: AlignmentDirectional(-1, -0.87),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 900,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Color(0x00FFFFFF),
                                                offset: Offset(
                                                  1,
                                                  2,
                                                ),
                                              )
                                            ],
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xDA25272D),
                                                Color(0x4231353C)
                                              ],
                                              stops: [0, 1],
                                              begin:
                                                  AlignmentDirectional(1, 0.87),
                                              end: AlignmentDirectional(
                                                  -1, -0.87),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color(0x56FFFFFF),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 30),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'How do you feel today? Meow?',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFB7BDC7),
                                                                fontSize: 13,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation']!),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 20),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 15, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          logFirebaseEvent(
                                                              'HOME_TextField_ovagrpkj_ON_TEXTFIELD_SUB');
                                                          var _shouldSetState =
                                                              false;
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          var chatsRecordReference =
                                                              ChatsRecord
                                                                  .collection
                                                                  .doc();
                                                          await chatsRecordReference
                                                              .set(
                                                                  createChatsRecordData(
                                                            uid:
                                                                currentUserReference,
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            title:
                                                                valueOrDefault<
                                                                    String>(
                                                              'Chat Title (${valueOrDefault<String>(
                                                                dateTimeFormat(
                                                                    "M/d h:mm a",
                                                                    getCurrentTimestamp),
                                                                'Chart Title',
                                                              )})',
                                                              'Chat Title',
                                                            ),
                                                          ));
                                                          _model.chatRef = ChatsRecord
                                                              .getDocumentFromData(
                                                                  createChatsRecordData(
                                                                    uid:
                                                                        currentUserReference,
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    title: valueOrDefault<
                                                                        String>(
                                                                      'Chat Title (${valueOrDefault<String>(
                                                                        dateTimeFormat(
                                                                            "M/d h:mm a",
                                                                            getCurrentTimestamp),
                                                                        'Chart Title',
                                                                      )})',
                                                                      'Chat Title',
                                                                    ),
                                                                  ),
                                                                  chatsRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_app_state');
                                                          FFAppState()
                                                                  .awaitingReply =
                                                              true;
                                                          FFAppState().prompt =
                                                              _model
                                                                  .textController
                                                                  .text;
                                                          FFAppState()
                                                              .update(() {});
                                                          logFirebaseEvent(
                                                              'TextField_widget_animation');
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          var messagesRecordReference1 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference1
                                                              .set(
                                                                  createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message: FFAppState()
                                                                .systemMessage,
                                                            user: 'system',
                                                            uid:
                                                                currentUserReference,
                                                          ));
                                                          _model.msg1 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  createMessagesRecordData(
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    firstMessage:
                                                                        false,
                                                                    message:
                                                                        FFAppState()
                                                                            .systemMessage,
                                                                    user:
                                                                        'system',
                                                                    uid:
                                                                        currentUserReference,
                                                                  ),
                                                                  messagesRecordReference1);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_page_state');
                                                          _model
                                                              .addToInitialMessages(
                                                                  _model.msg1!);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          var messagesRecordReference2 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference2
                                                              .set(
                                                                  createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: true,
                                                            message: FFAppState()
                                                                .userReinforcement,
                                                            user: 'user',
                                                            uid:
                                                                currentUserReference,
                                                          ));
                                                          _model.msg2 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  createMessagesRecordData(
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    firstMessage:
                                                                        true,
                                                                    message:
                                                                        FFAppState()
                                                                            .userReinforcement,
                                                                    user:
                                                                        'user',
                                                                    uid:
                                                                        currentUserReference,
                                                                  ),
                                                                  messagesRecordReference2);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_page_state');
                                                          _model
                                                              .addToInitialMessages(
                                                                  _model.msg2!);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          var messagesRecordReference3 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference3
                                                              .set(
                                                                  createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message:
                                                                FFAppState()
                                                                    .gptOpener,
                                                            user: 'gpt',
                                                            uid:
                                                                currentUserReference,
                                                          ));
                                                          _model.msg3 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  createMessagesRecordData(
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    firstMessage:
                                                                        false,
                                                                    message:
                                                                        FFAppState()
                                                                            .gptOpener,
                                                                    user: 'gpt',
                                                                    uid:
                                                                        currentUserReference,
                                                                  ),
                                                                  messagesRecordReference3);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_page_state');
                                                          _model
                                                              .addToInitialMessages(
                                                                  _model.msg3!);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          var messagesRecordReference4 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference4
                                                              .set(
                                                                  createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message: _model
                                                                .textController
                                                                .text,
                                                            user: 'user',
                                                            uid:
                                                                currentUserReference,
                                                          ));
                                                          _model.msg4 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  createMessagesRecordData(
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    firstMessage:
                                                                        false,
                                                                    message: _model
                                                                        .textController
                                                                        .text,
                                                                    user:
                                                                        'user',
                                                                    uid:
                                                                        currentUserReference,
                                                                  ),
                                                                  messagesRecordReference4);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_page_state');
                                                          _model
                                                              .addToInitialMessages(
                                                                  _model.msg4!);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'TextField_clear_text_fields_pin_codes');
                                                          safeSetState(() {
                                                            _model
                                                                .textController
                                                                ?.clear();
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_navigate_to');

                                                          context.goNamed(
                                                            ChatWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'chatRef':
                                                                  serializeParam(
                                                                _model.chatRef
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
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

                                                          logFirebaseEvent(
                                                              'TextField_backend_call');
                                                          _model.gptResponse =
                                                              await AIChatCall
                                                                  .call(
                                                            messages: functions
                                                                .generateMessages(
                                                                    _model
                                                                        .initialMessages
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .prompt)
                                                                .toString(),
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .gptResponse
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'TextField_backend_call');

                                                            await MessagesRecord
                                                                    .createDoc(_model
                                                                        .chatRef!
                                                                        .reference)
                                                                .set(
                                                                    createMessagesRecordData(
                                                              timestamp:
                                                                  getCurrentTimestamp,
                                                              firstMessage:
                                                                  false,
                                                              message: (AIChatCall
                                                                      .messageContent(
                                                                (_model.gptResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!)
                                                                  .trim(),
                                                              user: 'gpt',
                                                              uid:
                                                                  currentUserReference,
                                                            ));
                                                            logFirebaseEvent(
                                                                'TextField_update_app_state');
                                                            FFAppState()
                                                                    .awaitingReply =
                                                                false;
                                                            FFAppState()
                                                                .update(() {});
                                                            logFirebaseEvent(
                                                                'TextField_widget_animation');
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation'] !=
                                                                null) {
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'TextField_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Oops, looks like that didn\'t go through. Let\'s try again!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        3000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'TextField_update_app_state');
                                                            FFAppState()
                                                                    .awaitingReply =
                                                                false;
                                                            FFAppState()
                                                                .update(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFFA5AAB4),
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText:
                                                              'Meow anything...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFFA5AAB4),
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color(0x0FFFFFFF),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      15,
                                                                      20,
                                                                      15),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFFA5AAB4),
                                                                  fontSize: 11,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                    .animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!)
                                                    .animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation']!,
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
                            ],
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
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:routine305/flutter_flow/flutter_flow_drop_down.dart';
import 'package:routine305/flutter_flow/flutter_flow_icon_button.dart';
import 'package:routine305/flutter_flow/flutter_flow_widgets.dart';
import 'package:routine305/flutter_flow/flutter_flow_theme.dart';
import 'package:routine305/index.dart';
import 'package:routine305/main.dart';
import 'package:routine305/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:routine305/backend/firebase/firebase_config.dart';
import 'package:routine305/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('US1 NewUser', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: AccountCreationPageWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(find.byKey(const ValueKey('Signup-Email_v84z')),
        'testuser69@gmail.com');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Password_j3mb')), 'password');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-ConfirmPassword_1g2d')), 'password');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Signup-Button_lsmf')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(find.byKey(const ValueKey('Name_x92o')), 'WeMadeIt');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('DropDown_mrxs')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Button_k7kz')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
  });

  testWidgets('US2 - User Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('LoginTab_2xl7')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('LoginTab_2xl7')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Login-Email_goqq')), 'scummins@uri.edu');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Login-Password_1qiv')), 'password');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Login-Button')));
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));
    expect(find.byKey(const ValueKey('Text_jtyt')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}

/*
 * Created by Nguyen Kim Khanh on 4/20/22, 7:00 PM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/20/22, 7:00 PM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../Routes/routes.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

signInWithPhone(
    String phoneNumber, String? smsCode, BuildContext context) async {
  await _auth.verifyPhoneNumber(
    phoneNumber: "+84" + phoneNumber,
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) async {
      User? user = (await _auth.signInWithCredential(credential)).user;

      assert(user?.displayName != null);
      assert(user!.isAnonymous);
      assert(user?.phoneNumber != null);

      final User currentUser = _auth.currentUser!;
      assert(user?.uid == currentUser.uid);
      // Once signed in, return the UserCredential
      Navigator.pushNamedAndRemoveUntil(context, PageRoutes.signUp, (route) =>false);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        Fluttertoast.showToast(
            msg: 'Số điện thoại không khả dụng.\nVui lòng nhập lại.');
      } else {
        Fluttertoast.showToast(
            msg:
                "Xác thực không thành công!\nVui lòng thử lại trong giây lát.");
      }
    },
    codeSent: (String verificationId, int? resendToken) async {
      if(smsCode!=null){
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        // Sign the user in (or link) with the credential
        await _auth.signInWithCredential(credential);
      }
    },
    codeAutoRetrievalTimeout: (String verificationId) {

    },
  );
}

Future<User?> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  try {
    final User user = (await _auth.signInWithCredential(credential)).user!;
    if (user.email != null && user.email != "") {
      assert(user.email != null);
    }
    assert(user.displayName != null);
    assert(!user.isAnonymous);

    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    // Once signed in, return the UserCredential
    Navigator.popAndPushNamed(context, PageRoutes.signUp);
    return user;
  } catch (e) {
    Fluttertoast.showToast(
        msg: "Lỗi: $e. \nVui lòng chọn phương thức đăng nhập khác.",
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
    return null;
  }
}

Future<User> signInWithApple(BuildContext context) async {
  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );

  print("appleCredential = $appleCredential");
  final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
  final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode);
  final User user = (await _auth.signInWithCredential(credential)).user!;
  print(user.email);
  if (user.email != null && user.email != "") {
    assert(user.email != null);
  }
  if (user.displayName != null && user.displayName != "") {
    assert(user.displayName != null);
  }
  assert(!user.isAnonymous);

  final User currentUser = _auth.currentUser!;
  assert(user.uid == currentUser.uid);
  Navigator.popAndPushNamed(context, PageRoutes.signUp);
  return user;
}

// ignore: missing_return
Future<User?> signInWithFacebook(BuildContext context) async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  try {
    final User user =
        (await _auth.signInWithCredential(facebookAuthCredential)).user!;
    if (user.email != null && user.email != "") {
      assert(user.email != null);
    }
    assert(user.displayName != null);
    assert(!user.isAnonymous);

    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
    Navigator.popAndPushNamed(context, PageRoutes.signUp);
    return user;
  } catch (e) {
    Fluttertoast.showToast(
        msg: "Lỗi: $e. \nVui lòng chọn phương thức đăng nhập khác.",
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
    return null;
  }
}

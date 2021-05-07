import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apolobytes/screens/home/home.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:apolobytes/services/database.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Login extends StatefulWidget {

  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
    phoneController.text = internationalizedPhoneNumber;
    });
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if(authCredential.credential != null){
        await DatabaseService(uid: authCredential.user.uid).updateUserData('new byter member');
      }


      setState(() {
        showLoading = false;
      });

      if(authCredential?.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        InternationalPhoneInput(
          decoration: InputDecoration(hintText: "Contacto telefónico"),
          onPhoneNumberChange: onPhoneNumberChange,
          initialPhoneNumber: phoneController.text,
          initialSelection: 'PT',
          showCountryCodes: true),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                //ScaffoldMessenger.of(context).showSnackBar
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message)));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("Seguinte"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Introduza o código OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("Verificar"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Text('Apolo Bytes'),
      ),
      body: Container(
         child: showLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
        padding: const EdgeInsets.all(16),
      ));
  }
}

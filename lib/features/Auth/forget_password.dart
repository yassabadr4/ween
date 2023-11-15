import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/buttons/custom_botton.dart';
import 'package:ween/core/function/app_router.dart';
import 'package:ween/features/Auth/widgets/custom_text_from_field.dart';


var verifiId= '';

FirebaseAuth auth = FirebaseAuth.instance;
var otp = '';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextFromField(
                labelText: 'ادخل رقم الهاتف',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.phone,
              ),
              CustomButton(
                title: 'ارسال',
                onPressd: () {
                  if (formKey.currentState!.validate()) {
                     sendOtp({phone}) async {
                      await auth.verifyPhoneNumber(
                        phoneNumber:phone,
                        verificationCompleted: (phoneAuthCredential)async{
                          await auth.signInWithCredential(phoneAuthCredential);
                        },
                        verificationFailed: (FirebaseAuthException e){
                          print(e.toString());
                        },
                        codeSent: (String? verificationId , int? resendToken){
                          verifiId = verificationId.toString();
                        },
                        codeAutoRetrievalTimeout: (value){},);
                    }
                    GoRouter.of(context).push(AppRouter.kOtpPage);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// final FirebaseAuth auth = FirebaseAuth.instance;
// String sms= '';
// _testOtp() async {
//   UserCredential _cerdential;
//   User _user;
//   await auth.verifyPhoneNumber(
//       verificationCompleted: (PhoneAuthCredential authCredential) async {
//         await auth.signInWithCredential(authCredential).then((value) {
//           GoRouter.of(context).push(AppRouter.kOtpPage);
//         });
//       }, verificationFailed: ((error) {
//     print(error);
//   }), codeSent: (String verificationId, [int? forceResendingToken]) {
//     showDialog(
//       context: context, barrierDismissible: false, builder: (context) =>
//         AlertDialog(
//           title: Text('test'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: phoneController,
//               )
//             ],
//           ),
//           actions: [
//             ElevatedButton(onPressed: (){
//               FirebaseAuth auth = FirebaseAuth.instance;
//               sms = phoneController.text;
//               PhoneAuthCredential _credenntial = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: sms);
//               auth.signInWithCredential(_credenntial).then((result){
//                 if(result != null){
//                   Navigator.pop(context);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => OtpPage()));
//                 }
//               }).catchError((e){
//                 print(e);
//               });
//             }, child: Text(
//                 'done'
//             ))
//           ],
//         ),
//     );
//   }, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
// }

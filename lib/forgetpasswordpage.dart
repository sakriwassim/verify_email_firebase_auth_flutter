import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: "sakriwassim@gmail.com");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password Reset Email has been sent !",
            style: TextStyle(fontSize: 20.0),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }




  // Future resetPassword() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //
  //   // var acs = ActionCodeSettings(
  //   //   url: 'https://ettaba-99fa8.firebaseapp.com/finishSignUp?cartId=1234',
  //   //   handleCodeInApp: true,
  //   // );
  //
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: emailController.text.trim(),
  //       // actionCodeSettings: acs,
  //     );
  //     Utils.showSnackBar("Password Reset Email Sent");
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     Utils.showSnackBar(e.message);
  //   } finally {
  //     Navigator.of(context).pop();
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("reset password"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Email"),
            ),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
                onPressed: resetPassword,
                child: Text("Reset Password")),
          ],
        ),
      ),
    );
  }
}


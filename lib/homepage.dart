import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return  Scaffold(
      appBar: AppBar(title: Text("home"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Signed In As",
              style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Text(user.email!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: () => FirebaseAuth.instance.signOut(), child: Text("Sign Out"))
        ],
      ),
    );
  }
}

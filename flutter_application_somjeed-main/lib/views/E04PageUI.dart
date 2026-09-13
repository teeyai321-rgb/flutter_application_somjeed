import 'package:flutter/material.dart';
import 'E03PageUI.dart';
import 'E05PageUI.dart';

class ForgotUi extends StatelessWidget {
  ForgotUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(children: [
                Stack(children: [
                  SizedBox(width: double.infinity, child: Image.asset('assets/images/img_orange2.png', fit: BoxFit.fitWidth)),
                  Positioned(left: 18, top: 18, child: SizedBox(width: 32, height: 32, child: IconButton(onPressed: () => Navigator.pop(context), style: IconButton.styleFrom(backgroundColor: Colors.white54, padding: EdgeInsets.zero), icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23)))),
                ]),
                const SizedBox(height: 58),
                const SizedBox(width: 330, child: Text('Forgot your password?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
                const SizedBox(height: 1),
                const SizedBox(width: 330, child: Text('Enter email address', style: TextStyle(fontSize: 10))),
                const SizedBox(height: 7),
                const SizedBox(width: 330, height: 34, child: TextField(decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 12), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey))))),
                const SizedBox(height: 13),
                SizedBox(width: 330, height: 42, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpUi())), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9810), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Send code', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)))),
                const SizedBox(height: 250),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text("Don't have an Account?", style: TextStyle(fontSize: 8)), TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterUi())), style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 3), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Create Account', style: TextStyle(fontSize: 8, color: Color(0xFFFF9810))))]),
                const SizedBox(height: 12),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

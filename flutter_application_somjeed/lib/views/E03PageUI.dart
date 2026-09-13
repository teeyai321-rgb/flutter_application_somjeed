import 'package:flutter/material.dart';
import 'E02PageUI.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({super.key});
  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  bool obscure = true;

  InputDecoration dec(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.grey)),
      );

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
                  Positioned(left: 18, top: 18, child: _Back(onPressed: () => Navigator.pop(context))),
                ]),
                const SizedBox(height: 7),
                const Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                const Text('Create your new account', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 13),
                ...[
                  TextField(decoration: dec('Name')),
                  TextField(decoration: dec('E-mail'), keyboardType: TextInputType.emailAddress),
                  TextField(decoration: dec('Phone'), keyboardType: TextInputType.phone),
                  TextField(obscureText: obscure, decoration: dec('Password').copyWith(suffixIcon: IconButton(onPressed: () => setState(() => obscure = !obscure), icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, size: 16, color: Colors.grey)))),
                ].map((w) => Padding(padding: const EdgeInsets.only(bottom: 7), child: SizedBox(width: 330, height: 34, child: w))),
                const SizedBox(height: 1),
                const SizedBox(
                  width: 330,
                  child: Text.rich(
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      style: TextStyle(fontSize: 7),
                      children: [
                        TextSpan(text: 'Terms & Conditions', style: TextStyle(color: Color(0xFFFF9810))),
                        TextSpan(text: '\nand ', style: TextStyle(color: Colors.black)),
                        TextSpan(text: 'Privacy Policy', style: TextStyle(color: Color(0xFFFF9810))),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(width: 330, height: 42, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9810), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Sign Up', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)))),
                const SizedBox(height: 12),
                const _Or(),
                const SizedBox(height: 14),
                const _Socials(),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already have an Account?', style: TextStyle(fontSize: 8)),
                  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginUI())), style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 3), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Log In', style: TextStyle(fontSize: 8, color: Color(0xFFFF9810)))),
                ]),
                const SizedBox(height: 12),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _Back extends StatelessWidget { final VoidCallback onPressed; const _Back({required this.onPressed}); @override Widget build(BuildContext context) => SizedBox(width: 32, height: 32, child: IconButton(onPressed: onPressed, style: IconButton.styleFrom(backgroundColor: Colors.white54, padding: EdgeInsets.zero), icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23))); }
class _Or extends StatelessWidget { const _Or(); @override Widget build(BuildContext context) => const SizedBox(width: 330, child: Row(children: [Expanded(child: Divider(color: Color(0xFFF4D49A))), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('OR', style: TextStyle(fontSize: 12))), Expanded(child: Divider(color: Color(0xFFF4D49A)))])); }
class _Socials extends StatelessWidget { const _Socials(); @override Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset('assets/images/img_g.png', width: 24, height: 24), const SizedBox(width: 22), Image.asset('assets/images/img_f.png', width: 24, height: 24), const SizedBox(width: 22), Image.asset('assets/images/img_a.png', width: 24, height: 24)]); }

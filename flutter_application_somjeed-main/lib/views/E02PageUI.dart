import 'package:flutter/material.dart';
import 'E03PageUI.dart';
import 'E04PageUI.dart';

const orange = Color(0xFFFF9810);

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool obscure = true;

  InputDecoration fieldDecoration(String hint, {Widget? suffix}) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
        suffixIcon: suffix,
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
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset('assets/images/img_orange2.png', fit: BoxFit.fitWidth),
                      ),
                      Positioned(
                        left: 18,
                        top: 18,
                        child: _BackButton(onPressed: () => Navigator.pop(context)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Welcome back', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  const Text('Login to your account', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 14),
                  _FormWidth(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: fieldDecoration('Enter email or phone'),
                    ),
                  ),
                  const SizedBox(height: 7),
                  _FormWidth(
                    child: TextField(
                      obscureText: obscure,
                      decoration: fieldDecoration(
                        'Password',
                        suffix: IconButton(
                          onPressed: () => setState(() => obscure = !obscure),
                          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, size: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 330,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotUi())),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: const Text('Forgot Password?', style: TextStyle(fontSize: 8, color: orange)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _FormWidth(
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: orange, foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: const Text('Log In', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _OrDivider(),
                  const SizedBox(height: 15),
                  const _Socials(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account?", style: TextStyle(fontSize: 8)),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterUi())),
                        style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 3), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: const Text('Create Account', style: TextStyle(fontSize: 8, color: orange)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormWidth extends StatelessWidget {
  final Widget child;
  final double? height;
  const _FormWidth({required this.child, this.height});
  @override
  Widget build(BuildContext context) => SizedBox(width: 330, height: height ?? 34, child: child);
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _BackButton({required this.onPressed});
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: onPressed,
          style: IconButton.styleFrom(backgroundColor: Colors.white54, padding: EdgeInsets.zero),
          icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23),
        ),
      );
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 330,
        child: Row(children: [
          const Expanded(child: Divider(color: Color(0xFFF4D49A), thickness: .8)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('OR', style: TextStyle(fontSize: 12))),
          const Expanded(child: Divider(color: Color(0xFFF4D49A), thickness: .8)),
        ]),
      );
}

class _Socials extends StatelessWidget {
  const _Socials();
  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/img_g.png', width: 24, height: 24),
        const SizedBox(width: 22),
        Image.asset('assets/images/img_f.png', width: 24, height: 24),
        const SizedBox(width: 22),
        Image.asset('assets/images/img_a.png', width: 24, height: 24),
      ]);
}

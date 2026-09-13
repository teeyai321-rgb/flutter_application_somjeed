import 'package:flutter/material.dart';

class CreatePasswordUi extends StatefulWidget {
  const CreatePasswordUi({super.key});
  @override
  State<CreatePasswordUi> createState() => _CreatePasswordUiState();
}

class _CreatePasswordUiState extends State<CreatePasswordUi> {
  bool obscure1 = true;
  bool obscure2 = true;

  InputDecoration dec(String hint, bool obscure, VoidCallback toggle) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 9, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: IconButton(onPressed: toggle, icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, size: 15, color: Colors.grey)),
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
                  Positioned(left: 18, top: 18, child: SizedBox(width: 32, height: 32, child: IconButton(onPressed: () => Navigator.pop(context), style: IconButton.styleFrom(backgroundColor: Colors.white54, padding: EdgeInsets.zero), icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23)))),
                ]),
                const SizedBox(height: 45),
                const SizedBox(width: 330, child: Text('Create New Password', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
                const SizedBox(height: 1),
                const SizedBox(width: 330, child: Text('Enter new password', style: TextStyle(fontSize: 10))),
                const SizedBox(height: 9),
                SizedBox(width: 330, height: 34, child: TextField(obscureText: obscure1, decoration: dec('Enter New password', obscure1, () => setState(() => obscure1 = !obscure1)))),
                const SizedBox(height: 7),
                SizedBox(width: 330, height: 34, child: TextField(obscureText: obscure2, decoration: dec('Confirm password', obscure2, () => setState(() => obscure2 = !obscure2)))),
                const SizedBox(height: 14),
                SizedBox(width: 330, height: 42, child: ElevatedButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9810), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Submit', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)))),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

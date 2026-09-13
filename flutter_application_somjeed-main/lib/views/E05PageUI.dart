import 'dart:async';
import 'package:flutter/material.dart';
import 'E06PageUI.dart';

class OtpUi extends StatefulWidget {
  const OtpUi({super.key});
  @override
  State<OtpUi> createState() => _OtpUiState();
}

class _OtpUiState extends State<OtpUi> {
  final controllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());
  Timer? timer;
  int seconds = 30;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() { if (seconds > 0) seconds--; });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    for (final c in controllers) c.dispose();
    for (final n in focusNodes) n.dispose();
    super.dispose();
  }

  Widget otpBox(int i) => SizedBox(width: 31, height: 31, child: TextField(
        controller: controllers[i], focusNode: focusNodes[i], maxLength: 1, keyboardType: TextInputType.number, textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        onChanged: (v) { if (v.isNotEmpty && i < 3) focusNodes[i + 1].requestFocus(); if (v.isEmpty && i > 0) focusNodes[i - 1].requestFocus(); },
        decoration: InputDecoration(counterText: '', filled: true, fillColor: const Color(0xFFE5E5E5), contentPadding: EdgeInsets.zero, border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none)),
      ));

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
                Padding(padding: const EdgeInsets.only(top: 12), child: Stack(children: [
                  const Center(child: Text('OTP Verification', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700))),
                  Positioned(left: 18, top: -6, child: SizedBox(width: 32, height: 32, child: IconButton(onPressed: () => Navigator.pop(context), style: IconButton.styleFrom(backgroundColor: const Color(0xFFFFF1B9), padding: EdgeInsets.zero), icon: const Icon(Icons.chevron_left, color: Colors.white, size: 23)))),
                ])),
                const SizedBox(height: 25),
                Image.asset('assets/images/img_orange3.png', width: 210, height: 210, fit: BoxFit.contain),
                const SizedBox(height: 18),
                const SizedBox(width: 330, child: Text('Enter OTP', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
                const SizedBox(height: 2),
                const SizedBox(width: 330, child: Text('An 4 digit code has been sent to your\nemail', style: TextStyle(fontSize: 9, height: 1.3))),
                const SizedBox(height: 11),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [otpBox(0), const SizedBox(width: 5), otpBox(1), const SizedBox(width: 5), otpBox(2), const SizedBox(width: 5), otpBox(3)]),
                const SizedBox(height: 10),
                Text.rich(TextSpan(text: 'You should receive the OTP in ', style: const TextStyle(fontSize: 8, color: Colors.black54), children: [TextSpan(text: '$seconds Second', style: const TextStyle(color: Color(0xFFFF9810)))])),
                const SizedBox(height: 12),
                SizedBox(width: 330, height: 42, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreatePasswordUi())), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9810), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Verify', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)))),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

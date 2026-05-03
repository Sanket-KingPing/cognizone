import 'package:flutter/material.dart';
import 'package:cognizone/dashboard.dart';

class MailIdPage extends StatefulWidget {
  const MailIdPage({super.key});

  @override
  State<MailIdPage> createState() => _MailIdPageState();
}

class _MailIdPageState extends State<MailIdPage> {
  final TextEditingController _mailIdController = TextEditingController();
  bool isDarkMode = true;

  @override
  void dispose() {
    _mailIdController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_mailIdController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    // Basic email validation
    if (!_isValidEmail(_mailIdController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    // Proceed to login/dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final bool rightIsDark = !isDarkMode;
    final Color bgColor = rightIsDark ? const Color(0xFF0A2342) : Colors.white;
    final Color headingColor = rightIsDark ? Colors.white : Colors.black87;
    final Color labelColor =
        rightIsDark ? Colors.white70 : const Color(0xFF0A2342);
    final Color borderColor =
        rightIsDark ? Colors.white54 : const Color(0xFF0A2342).withOpacity(0.3);
    final Color textColor = rightIsDark ? Colors.white : Colors.black87;
    final Color fillColor =
        rightIsDark ? Colors.white.withOpacity(0.12) : Colors.white;

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: headingColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Enter Email',
            style: TextStyle(color: headingColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Enter your email address',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: headingColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  'Please provide a valid email address to continue with Google sign-in',
                  style: TextStyle(
                    fontSize: 16,
                    color: labelColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      style: TextStyle(color: labelColor, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _mailIdController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        hintStyle:
                            TextStyle(color: labelColor.withOpacity(0.5)),
                        filled: true,
                        fillColor: fillColor,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: rightIsDark
                                ? Colors.white
                                : const Color(0xFF0A2342),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: labelColor,
                        ),
                      ),
                      onSubmitted: (_) => _handleContinue(),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2342),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: BorderSide(color: borderColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: headingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

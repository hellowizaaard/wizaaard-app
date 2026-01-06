import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/config/theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? gender;
  String? profession;
  bool agree = false;

  final professions = [
    "Games Designer",
    "Motion Graphic Designer",
    "UX Designer",
    "UI Designer",
    "UI/UX Designer",
    "2d/3d Designer",
    "Graphic Designer",
    "Product Designer",
    "Social Content Designer",
  ];

  void _openProfessionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModal) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Search your profession",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: professions.length,
                      itemBuilder: (_, i) {
                        return ListTile(
                          title: Text(professions[i]),
                          trailing: profession == professions[i]
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                )
                              : null,
                          onTap: () {
                            setState(() => profession = professions[i]);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Complete\nRegistration",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColorTheme.primary,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Text("Already have an account?"),
                    TextButton(onPressed: () {}, child: const Text("Login")),
                  ],
                ),

                _input("Full Name"),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: _box(),
                      child: const Text("+88"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: _input("Enter mobile number")),
                  ],
                ),

                const SizedBox(height: 10),

                _dropdown("Select Gender", gender, [
                  "Male",
                  "Female",
                  "Other",
                ], (v) => setState(() => gender = v)),

                const SizedBox(height: 10),

                InkWell(
                  onTap: _openProfessionSheet,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 55,
                    decoration: _box(),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text("I am a  "),
                        Text(
                          profession ?? "Select Profession/Occupation",
                          style: TextStyle(
                            color: profession == null
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                _password("Create password"),
                const SizedBox(height: 10),
                _password("Confirm password"),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Checkbox(
                      value: agree,
                      onChanged: (v) => setState(() => agree = v!),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(text: "I am agree to Weebird's "),
                            TextSpan(
                              text: "Terms",
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: " & their data in "),
                            TextSpan(
                              text: "privacy policy",
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorTheme.primaryDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Register Now",
                      style: TextStyle(color: Colors.white),
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

  Widget _input(String hint) => TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  Widget _password(String hint) => TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: hint,
      suffixIcon: const Icon(Icons.visibility_off),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  Widget _dropdown(
    String hint,
    String? value,
    List<String> items,
    Function(String) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) => onChanged(v!),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  BoxDecoration _box() => BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey.shade300),
  );
}

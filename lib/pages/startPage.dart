import 'package:flutter/material.dart';

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D4CD2),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D), // Dark color at the top
              Color(0xFF0137A9), // Slightly lighter at the bottom
            ],
          ),
        ),
        child: Stack(
          children: [
            // Skip button at top-right
            Positioned(
              top: 70,
              right: 30,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/homePage'),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Centered content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo + Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.videogame_asset_outlined,
                          color: Colors.amber,
                          size: 40,
                        ),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(text: "Book", style: TextStyle(color: Colors.white)),
                              TextSpan(text: "My", style: TextStyle(color: Colors.amber)),
                              TextSpan(text: "Console", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      "Book your game time at cafes near you.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Play More, Wait Less!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 70),

                    // Sign In Button
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Create Account Button
                    OutlinedButton(
                      onPressed: () => Navigator.pushNamed(context, '/incrementer'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "By continuing, you agree to our Terms of Service\nand Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

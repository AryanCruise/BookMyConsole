import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart'; // Add this import

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? selectedState;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Icon(Icons.videogame_asset, color: Colors.amber, size: 24),
            const SizedBox(width: 16),
            const Text.rich(
              TextSpan(
                text: 'Book',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'My', style: TextStyle(color: Colors.amber)),
                  TextSpan(text: 'Console', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D), // Dark color at the top
              Color(0xFF0137A9), // Slightly lighter at the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                child: Icon(Icons.location_on, size: 40, color: Colors.black),
              ),
              const SizedBox(height: 30),
              const Text(
                'Select Your Location',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'We need your location to show you the nearest gaming cafes',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 30),

              // --- State Dropdown ---
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text('Select your state', style: TextStyle(color: Colors.white54)),
                value: selectedState,
                items: ['Maharashtra'].map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                  });
                },
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
                buttonStyleData: const ButtonStyleData(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 50,
                ),
              ),

              const SizedBox(height: 20),

              // --- City Dropdown ---
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text('Select your city', style: TextStyle(color: Colors.white54)),
                value: selectedCity,
                items: ['Vashi', 'Nerul', 'Seawoods'].map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
                buttonStyleData: const ButtonStyleData(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 50,
                ),
              ),

              const SizedBox(height: 30),

              // --- Continue Button ---
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/homePage'),
                  child: const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

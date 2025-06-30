import 'package:book_my_console/models/cafe_data.dart';
import 'package:book_my_console/pages/receipt_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final CafeData cafeData;

  const BookingPage({super.key, required this.cafeData});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedCategory = 0;
  int hours = 1;
  int seats = 1;
  final List<int> prices = [80, 90, 120];
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    int totalPrice = hours * seats * prices[selectedCategory];
    const techIcons = {
      'PS5': Icons.videogame_asset,
      'Xbox': Icons.videogame_asset,
      'PC': Icons.computer,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              const Icon(Icons.videogame_asset, color: Colors.amber, size: 24),
              const SizedBox(width: 12),
              const Text.rich(
                TextSpan(
                  text: 'Book',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'My', style: TextStyle(color: Colors.amber)),
                    TextSpan(
                      text: 'Console',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF0D0D0D), // Dark color at the top
              const Color(0xFF012E88), // Slightly lighter at the bottom
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.cafeData.imagePath),
                        fit: BoxFit.fill,
                      ),
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cafeData.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: 18,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              widget.cafeData.rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white70,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          widget.cafeData.location,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        spacing: 8.0,
                        children:
                            widget.cafeData.options
                                .map(
                                  (tech) => Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      border: Border.all(
                                        color: Colors.amber,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          techIcons[tech],
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          tech,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Divider(color: Colors.white70, thickness: 1),
                  const SizedBox(height: 15),
                  Text(
                    'Book Your Session',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Select Date',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );
                      if (picked != null) setState(() => selectedDate = picked);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month, color: Colors.amber),
                          const SizedBox(width: 12),
                          Text(
                            DateFormat.yMMMMd().format(selectedDate),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Select Time',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() => selectedTime = time.format(context));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.amber),
                          const SizedBox(width: 12),
                          Text(
                            selectedTime ?? 'Select Time',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hours', style: TextStyle(color: Colors.white70)),
                        Row(
                          children: [
                            IconButton(onPressed: () => setState(() => hours = (hours > 1) ? hours - 1 : 1), icon: const Icon(Icons.remove, color: Colors.white)),
                            Text('$hours hour', style: const TextStyle(color: Colors.white)),
                            IconButton(onPressed: () => setState(() => hours++), icon: const Icon(Icons.add, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Seats', style: TextStyle(color: Colors.white70)),
                        Row(
                          children: [
                            IconButton(onPressed: () => setState(() => seats = (seats > 1) ? seats - 1 : 1), icon: const Icon(Icons.remove, color: Colors.white)),
                            Text('$seats seat', style: const TextStyle(color: Colors.white)),
                            IconButton(onPressed: () => setState(() => seats++), icon: const Icon(Icons.add, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Price', style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('₹$totalPrice', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('$hours hour × $seats seat\n@ ₹${prices[selectedCategory]}/hour per seat', style: const TextStyle(color: Colors.white60)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingConfirmedPage(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Continue Payment', style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'Roboto'),),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

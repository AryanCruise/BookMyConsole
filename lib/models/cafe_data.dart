import 'package:flutter/material.dart';

class CafeData {
  final String name;
  final String imagePath;
  final String sectorCity;
  final String location;
  final List<String> options;
  final int price;
  final double rating;

  CafeData({
    required this.name,
    required this.imagePath,
    required this.sectorCity,
    required this.location,
    required this.options,
    required this.price,
    required this.rating,
  });

  static List<CafeData> getCafes() {
    List<CafeData> cafes = [];
    cafes.add(
      CafeData(
        name: 'WarCry E-Sports',
        imagePath: 'assets/warcry_nerul_2.png',
        sectorCity: 'Sector 21, Nerul',
        location: 'Shop No. 4 No. 88, Royal Garden Society, near Agarwal Corner, Nerul East, Sector 21, Nerul, Navi Mumbai',
        options: ['PS5', 'Xbox', 'PC'],
        price: 80,
        rating: 4.5,
      ),
    );
    cafes.add(
      CafeData(
        name: 'Mystic Gaming',
        imagePath: 'assets/mystic_gaming.png',
        sectorCity: 'Sector 22, Nerul',
        location: 'Shop B, Amrita Sadan, Railway Station, 02, Nerul(W, opposite Nerul, Nerul East, Sector 22, Nerul, Navi Mumbai',
        options: ['Xbox', 'PC'],
        price: 90,
        rating: 4.3,
      ),
    );
    cafes.add(
      CafeData(
        name: 'Wartex Gaming',
        imagePath: 'assets/wartex_gaming.png',
        sectorCity: 'Sector 19, Nerul',
        location: 'G-19, Hawares Centurion Mall, Seawood Fountain, Nerul East, Sector 19, Nerul, Navi Mumbai',
        options: ['PS4', 'Xbox', 'PC'],
        price: 100,
        rating: 4.7,
      ),
    );
    cafes.add(
      CafeData(
        name: 'CT-Spawn',
        imagePath: 'assets/ctspawn_nerul_4.png',
        sectorCity: 'Sector 19, Nerul',
        location: 'Shop no. 07,Plot no 22 & 23, Platinum Group, Nerul East, Sector 29, Nerul, Navi Mumbai',
        options: ['PS5', 'PC'],
        price: 80,
        rating: 4.1,
      ),
    );
    cafes.add(
      CafeData(
        name: 'Red Wolf Esports',
        imagePath: 'assets/redwolf_esports.png',
        sectorCity: 'Sector 19A, Nerul',
        location: 'G-23 Ground Floor, Hawares Centurion Mall, Plot - 88/91, Nerul East, Sector 19A, Nerul, Navi Mumbai',
        options: ['PS5', 'Xbox', 'PC'],
        price: 90,
        rating: 4.4,
      ),
    );
    cafes.add(
      CafeData(
        name: 'iNet Zone',
        imagePath: 'assets/inet_zone.png',
        sectorCity: 'Sector-21, Nerul',
        location: 'Shop No, B-10, Ground Floor, Nerul Railway Stn Complex (East), Sector-21, Nerul, Navi Mumbai',
        options: ['PC'],
        price: 60,
        rating: 3.9,
      ),
    );
    return cafes;
  }
}





import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState()
 => _ProfileScreenState();
}

class _ProfileScreenState extends
 State<ProfileScreen> {

   String buyerName = "-";
  String shopName = "-";
  String mobile = "-";
  String address = "-";
  Future<void> _loadProfile() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    buyerName = prefs.getString('buyerName') ?? "-";
    shopName = prefs.getString('shopName') ?? "-";
    mobile = prefs.getString('mobile') ?? "-";
    address = prefs.getString('address') ?? "-";
  });
}
  @override
void initState() {
  super.initState();
  _loadProfile();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyer Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),
            Text(
            buyerName,
            style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
            ),
                    

            const SizedBox(height: 10),

            Text("Shop Name: $shopName"),

            const SizedBox(height: 10),

            Text("Mobile: $mobile"),

            const SizedBox(height: 10),

            Text("Address: $address"),

            const SizedBox(height: 30),

            ElevatedButton(
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        buyerName = result["name"];
        shopName = result["shop"];
        mobile = result["mobile"];
        address = result["address"];
      });
    }
  },
  child: const Text("Edit Profile"),
),

          ],
        ),
      ),
    );
  }
}

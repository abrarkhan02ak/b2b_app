import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
   
  @override
  State<EditProfileScreen>
 createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends
 State<EditProfileScreen> {

final nameController = TextEditingController();
final shopController = TextEditingController();
final mobileController = TextEditingController();
final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
           controller: nameController,
              decoration: const InputDecoration(
                labelText: "Buyer Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
            controller: shopController,
              decoration: const InputDecoration(
                labelText: "Shop Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
            controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
            controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

           ElevatedButton(
   onPressed: () async {
  final prefs = await
 SharedPreferences.getInstance();

prefs.setString('buyerName',
 nameController.text);
  prefs.setString('shopName',
 shopController.text);
prefs.setString('mobile',
 mobileController.text);
prefs.setString('address',
 addressController.text);
    Navigator.pop(
      context,
      {
        "name": nameController.text,
        "shop": shopController.text,
        "mobile": mobileController.text,
        "address": addressController.text,
      },
    );
  },
  child: const Text("Save Profile"),
),

          ],
        ),
      ),
    );
  }
}

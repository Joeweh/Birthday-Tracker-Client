import 'package:birthday_tracker_client/components/drawer_fragment.dart';
import 'package:birthday_tracker_client/models/birthday.dart';
import 'package:birthday_tracker_client/screens/add_birthday.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ViewBirthdayScreen extends StatefulWidget {
  const ViewBirthdayScreen({super.key});

  @override
  State<ViewBirthdayScreen> createState() => _ViewBirthdayScreenState();
}

class _ViewBirthdayScreenState extends State<ViewBirthdayScreen> {
  List<Birthday> birthdays = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    GetIt getIt = GetIt.instance;

    birthdays = getIt<List<Birthday>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birthdays"),
      ),
      drawer: const DrawerFragment(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AddBirthdayScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: birthdays.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                title: Text(birthdays[index].name),
                subtitle: Text(birthdays[index].getFormattedDate()),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}

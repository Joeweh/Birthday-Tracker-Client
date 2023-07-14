import 'package:birthday_tracker_client/models/birthday.dart';
import 'package:birthday_tracker_client/screens/view_birthday.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddBirthdayScreen extends StatefulWidget {
  const AddBirthdayScreen({super.key});

  @override
  State<AddBirthdayScreen> createState() => _AddBirthdayScreenState();
}

class _AddBirthdayScreenState extends State<AddBirthdayScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
              ),
              TextFormField(
                controller: dateController,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900, 1),
                      lastDate: DateTime.now(),
                  );

                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }

                  dateController.text = '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';

                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              OutlinedButton(
                onPressed: () {
                  GetIt getIt = GetIt.instance;
                  
                  getIt<List<Birthday>>().add(Birthday(name: nameController.text.trim(), date: selectedDate));
                  
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ViewBirthdayScreen(),
                    ),
                  );
                },
                child: const Text("Add Birthday"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

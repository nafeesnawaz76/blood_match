import 'package:blood/view/home_screen.dart';
import 'package:blood/view/nav_bar.dart';
import 'package:blood/widgets/custom_button.dart';
import 'package:blood/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.initialTabIndex});

  final int initialTabIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: initialTabIndex,
        length: 2,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: 375,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 6,
                        width: 48,
                        decoration: BoxDecoration(
                            color: const Color(0xffd2d4d8),
                            borderRadius: BorderRadius.circular(6)),
                      )),
                  // SizedBox(
                  //   height: 12.h,
                  // ),
                  const TabBar(
                    tabs: [
                      Tab(text: "Create Account"),
                      Tab(text: "Login"),
                    ],
                    //isScrollable: true,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    labelColor: Color(0xffEB4646),
                    unselectedLabelColor: Color(0xff89909E),
                    indicatorColor: Color(0xffEB4646),
                    dividerHeight: 0,
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [RegisterTab(), LoginTab()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/logo.png', height: 150.0),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormField(
              hintText: "",
              fieldname: '  Email Address',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              obsecuretxt: true,
              hintText: "",
              fieldname: '  Password',
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              clr: Colors.red,
              txt: "Login",
              btnTxtClr: Colors.white,
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              clr: const Color(0xffF4F4F4),
              txt: "Login with Google",
              btnTxtClr: Colors.black,
              image: true,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterTab extends StatefulWidget {
  const RegisterTab({
    super.key,
  });

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  String? selectedBloodType;

  final List<String> genders = ['Male', 'Female', 'Other'];

  String? selectedGender;

  String? phoneNumber;

  DateTime? selectedDate; // Stores the selected date

  final DateFormat _dateFormat =
      DateFormat('yyyy-MM-dd'); // Formats the date , Intl package

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      // barrierColor: Colors.red,
      context: context,
      initialDate: DateTime(2000), // Default date
      firstDate: DateTime(1900), // Minimum selectable date
      lastDate: DateTime.now(), // Maximum selectable date (today)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/logo.png', height: 150.0),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormField(
              hintText: "",
              fieldname: '  Full Name',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              hintText: "",
              fieldname: '  Email Address',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFormField(
              obsecuretxt: true,
              hintText: "",
              fieldname: '  Password',
            ),
            const SizedBox(height: 10),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Phone Number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 5),

            IntlPhoneField(
              decoration: InputDecoration(
                // labelText: 'Phone Number',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              initialCountryCode: 'PK', // Default country code (e.g., Pakistan)
              onChanged: (PhoneNumber phone) {
                setState(() {
                  phoneNumber = phone
                      .completeNumber; // Stores the complete phone number with country code
                });
                //print('Phone number with code: $phoneNumber');
              },
            ),
            const CustomTextFormField(
              hintText: "",
              fieldname: '  City',
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(
              hintText: "",
              fieldname: '  Address',
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red)),
                    labelText: 'Date of Birth',
                    hintText: 'Select your date of birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.red,
                    ),
                  ),
                  controller: TextEditingController(
                    text: selectedDate != null
                        ? _dateFormat.format(selectedDate!)
                        : '',
                  ),
                  readOnly: true,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // // Register Button
            // ElevatedButton(
            //   onPressed: () {
            //     if (selectedDate != null) {
            //       print("Date of Birth: ${_dateFormat.format(selectedDate!)}");
            //       // Save DOB to Firebase or continue with registration process
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Please select your date of birth")),
            //       );
            //     }
            //   },
            //   child: const Text('Register'),
            // ),

            DropdownButtonFormField<String>(
              value: selectedGender,
              hint: const Text("Select Gender"),
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
              items: genders.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              value: selectedBloodType,
              hint: const Text("Select Blood Type"),
              onChanged: (newValue) {
                setState(() {
                  selectedBloodType = newValue;
                });
              },
              items: bloodTypes.map((bloodType) {
                return DropdownMenuItem(
                  value: bloodType,
                  child: Text(bloodType),
                );
              }).toList(),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              clr: Colors.red,
              txt: "Register",
              btnTxtClr: Colors.white,
              onpressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              clr: const Color(0xffF4F4F4),
              txt: "Sign up with Google",
              btnTxtClr: Colors.black,
              image: true,
              onpressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

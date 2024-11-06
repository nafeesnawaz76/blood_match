import 'package:blood/view/home_screen.dart';
import 'package:blood/widgets/custom_button.dart';
import 'package:blood/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.initialTabIndex});

  final int initialTabIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialTabIndex,
      length: 2,
      child: Scaffold(
        body: Container(
            width: 375,
            height: 812,
            decoration: const BoxDecoration(color: Colors.red
                // image: DecorationImage(
                //     image: NetworkImage(
                //       "https://i.pinimg.com/236x/e6/fa/3d/e6fa3da270a13f1b8f9d3b8ad132fd00.jpg",
                //     ),
                //     fit: BoxFit.cover),
                ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 576,
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
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
            )),
      ),
    );
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextFormField(
            hintText: "",
            fieldname: '  Email Address',
          ),
          const SizedBox(
            height: 16,
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
                    color: Color(0xffEB4646),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            clr: const Color(0xffEB4646),
            txt: "Login",
            btnTxtClr: Colors.white,
            onpressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class RegisterTab extends StatelessWidget {
  const RegisterTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        children: [
          const CustomTextFormField(
            hintText: "",
            fieldname: '  Full Name',
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextFormField(
            hintText: "",
            fieldname: '  Email Address',
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextFormField(
            obsecuretxt: true,
            hintText: "",
            fieldname: '  Password',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            clr: const Color(0xffEB4646),
            txt: "Registration",
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

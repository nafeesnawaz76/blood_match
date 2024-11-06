import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.clr,
    required this.onpressed,
    required this.txt,
    this.fontStyle,
    required this.btnTxtClr,
    this.image = false,
  });

  final Color clr;
  final VoidCallback onpressed;
  final String txt;
  final FontStyle? fontStyle;
  final Color btnTxtClr;
  final bool image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            backgroundColor: WidgetStatePropertyAll(
              clr,
            ),
            minimumSize: const WidgetStatePropertyAll(
              Size(double.infinity, 50),
            ),
            maximumSize: const WidgetStatePropertyAll(
              Size(double.infinity, 50),
            ),
          ),
          onPressed: onpressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image
                  ? Image.network(
                      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                      height: 25,
                    )
                  : Container(),
              image
                  ? const SizedBox(
                      width: 10,
                    )
                  : Container(),
              Text(
                txt,
                style: TextStyle(
                  color: btnTxtClr,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontStyle: fontStyle,
                ),
              ),
            ],
          )),
    );
  }
}

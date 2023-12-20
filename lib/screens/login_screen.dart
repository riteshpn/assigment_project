import 'package:assigment_project/constant/colors.dart';
import 'package:assigment_project/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            ClipPath(
              clipper: Clip1Clipper(),
              child: Container(
                height: 250,
                width: 250,
                color: CommonConstant.darkBlue,
                child: Center(
                  child: Text(
                    'Logi',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomTextFormField(
                  labelText: 'Email',
                  hintText: 'hello@reallygreat',
                  inputType: TextInputType.emailAddress,
                )),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.width);
    path.quadraticBezierTo(
        size.width / 0.9, size.height, size.width, size.height - 300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

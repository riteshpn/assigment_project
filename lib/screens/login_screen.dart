import 'package:assigment_project/constant/colors.dart';
import 'package:assigment_project/widgets/blue_button.dart';
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
            const SizedBox(
              height: 20,
            ),
            ClipPath(
              clipper: Clip1Clipper(),
              child: Container(
                height: 250,
                width: 250,
                color: CommonConstant.darkBlue,
                child: const Center(
                  child: Text(
                    'Login',
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
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomTextFormField(
                  labelText: 'Email',
                  hintText: 'hello@reallygreat',
                  inputType: TextInputType.emailAddress,
                )),
            const SizedBox(
              height: 35,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomTextFormField(
                  hintText: 'Password',
                  labelText: 'Password',
                  isPasswordField: true,
                  inputType: TextInputType.text,
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: BlueButton(title: 'login', onTap: () {}),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text('Not have account?'),
                ),
                Center(
                    child:
                        InkWell(onTap: () {}, child: const Text('Signup here')))
              ],
            )
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

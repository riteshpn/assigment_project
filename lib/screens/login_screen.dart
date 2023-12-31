import 'package:assigment_project/constant/colors.dart';
import 'package:assigment_project/global/showtoast.dart';
import 'package:assigment_project/screens/home_page.dart';
import 'package:assigment_project/screens/sign_up.dart';
import 'package:assigment_project/user_auth/firebase_auth_services.dart';
import 'package:assigment_project/widgets/blue_button.dart';
import 'package:assigment_project/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  bool _isSigning = false;

  TextEditingController __useremailController = TextEditingController();
  TextEditingController __userpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    clearTextFields();
  }

  void clearTextFields() {
    __useremailController.clear();
    __userpasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
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
                  height: screenWidth * 0.70,
                  width: screenWidth * 0.70,
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
              SizedBox(
                height: screenWidth * 0.30,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomTextFormField(
                    controller: __useremailController,
                    labelText: 'Email',
                    hintText: 'hello@reallygreat',
                    inputType: TextInputType.emailAddress,
                  )),
              const SizedBox(
                height: 35,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomTextFormField(
                    controller: __userpasswordController,
                    hintText: '*******',
                    labelText: 'Password',
                    isPasswordField: true,
                    inputType: TextInputType.text,
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BlueButton(
                    title: 'login',
                    isLoading: _isSigning,
                    onTap: () {
                      _signIn();
                    }),
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
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text('Signup here')))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = __useremailController.text;
    String password = __userpasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is sucessfully signed in");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      clearTextFields();
    } else {
      showToast(message: 'some error ocurred');
    }
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

import 'package:assigment_project/global/showtoast.dart';
import 'package:assigment_project/screens/home_page.dart';
import 'package:assigment_project/screens/login_screen.dart';
import 'package:assigment_project/user_auth/firebase_auth_services.dart';
import 'package:assigment_project/widgets/blue_button.dart';
import 'package:assigment_project/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedValue = 'Owner/Renter';
  bool _isSighnUp = false;
  final FireBaseAuthService _auth = FireBaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController __useremailController = TextEditingController();
  final TextEditingController __userpasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    __useremailController.dispose();
    __userpasswordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    clearTextFields();
  }

  void clearTextFields() {
    __useremailController.clear();
    __userpasswordController.clear();
    __userpasswordController.clear();
    _phoneController.clear();
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
                  // height: 230,
                  height: screenWidth * 0.60,
                  width: screenWidth * 0.60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'SignUp',
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
                height: 20,
              ),
              CustomTextFormField(
                controller: _usernameController,
                labelText: 'Name',
                hintText: 'James Morgan',
                inputType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                controller: __useremailController,
                labelText: 'Email',
                hintText: 'hello@reallygreatsite.com',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                controller: __userpasswordController,
                labelText: 'Password',
                hintText: '*****',

                // suffixIcon: Icon(
                //   Icons.lock,
                //   color: Colors.blue,
                //   size: 30,
                // ),
                isPasswordField: true,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                controller: _phoneController,
                labelText: 'Mobile',
                hintText: '012345566',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: 350,
                color: Colors.transparent,
                child: Stack(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                icon:
                                    const SizedBox(), // Empty SizedBox to hide default icon
                                underline:
                                    const SizedBox(), // Hides the default underline
                                value: selectedValue,
                                isExpanded: true,
                                itemHeight: 60,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items:
                                    <String>['Owner', 'Renter', 'Owner/Renter']
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Center(
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                            Container(
                                width: screenWidth * 0.2,
                                height: screenWidth * 0.2,
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: const Icon(Icons.arrow_drop_down,
                                    color: Colors.white, size: 30)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: screenWidth * 0.08,
                    right: screenWidth * 0.02,
                    child: const Text(
                      'User Type',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BlueButton(
                    title: _isSighnUp ? 'Signing Up...' : 'SignUp',
                    onTap: () {
                      if (!_isSighnUp) {
                        _signUp();
                        showToast(message: 'Signup initiated');
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(child: Text('Already Registered?')),
                  Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text('Log in here')))
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSighnUp = true;
    });
    String username = _usernameController.text;
    String email = __useremailController.text;
    String password = __userpasswordController.text;
    String phone = _phoneController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSighnUp = false;
    });

    if (user != null) {
      showToast(message: 'user is successfully created');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      clearTextFields();
    } else {
      showToast(message: "Some error Happened");
    }
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.width); // Adjust the curve height here
    path.quadraticBezierTo(
        size.width / 0.9, size.height, size.width, size.height - 300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

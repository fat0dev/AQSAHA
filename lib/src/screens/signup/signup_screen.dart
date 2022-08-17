
import 'dart:typed_data';
import 'package:aqsaha/src/resourses/auth_methods.dart';
import 'package:aqsaha/src/resposive/mobile_screen_layout.dart';
import 'package:aqsaha/src/resposive/resposive_layout.dart';
import 'package:aqsaha/src/resposive/web_screen_layout.dart';
import 'package:aqsaha/src/screens/screens.dart';
import 'package:aqsaha/src/theme/theme.dart';
import 'package:aqsaha/src/utils/utils.dart';
import 'package:aqsaha/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Text(
                'Aqsaha',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  letterSpacing: -1.5,
                  height: 64,
                ),
                
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.teal,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                          backgroundColor: Colors.red,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: AqsahaColors.secondary,
                  ),
                  child: !_isLoading
                      ? const Text(
                          'Sign up',
                        )
                      : CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      'Already have an account?',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Login.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:aqsaha/src/theme/theme.dart';
// import 'package:flutter/material.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         resizeToAvoidBottomInset: false,
//         body: PageView(
//           controller: _pageController,
//           children: [
//             // buildSignUpBody1(),
//             // buildSignUpBody2(),
//             // buildSignUpBody3(),
//           ],
//         )
//       ),
//     );
//   }

//   Widget buildSignUpBody1() {
//     final scrollController = ScrollController();
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         // color: Colors.black,
//       ),
//       child: Column(
//         children: [
//           const Text(
//                   'Create an Account',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//           Card(
//             margin: const EdgeInsets.all(10),
//             color: Theme.of(context).cardColor,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: buildTextField(
//                         hint: 'Fat tim Moy Hassan',
//                         label: 'Full Name'
//                         ),
//                       ),
//                       const SizedBox(width: 5,),
//                       Expanded(
//                       child: buildTextField(
//                         hint: 'AL Aqsa',
//                         label: 'Last Name'
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: buildTextField(
//                         hint: 'Male or famel',
//                         label: 'Gender'
//                         )),
//                     const SizedBox(width: 5,),
//                     Expanded(
//                       child: buildTextField(
//                         hint: 'ex: 22',
//                         label: 'Age'
//                         )),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'plastinian',
//                     label: 'Naionality'
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           buildBottom()

//         ],
//       ),
//     );
//   }

//   Widget buildTextField({
//     required String hint,
//     required String label,

//   }) {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: hint,
//         label: Text(label),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//       ),
//     );
//   }


//   Widget buildBottom(){
//     return Container(
//             margin: const EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.tealAccent,
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: Colors.transparent,
//                   )
//                 ),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(20),
//                   onTap: (){}, 
//                   child: const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                      'Next'
//                 ),
//                   )),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: Colors.tealAccent,
//                     width: 2,
//                   )
//                 ),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(20),
//                   onTap: (){}, 
//                   child: const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                      'Previous',
//                      style: TextStyle(
//                        color: AqsahaColors.textFaded
//                      ),
//                 ),
//                   )),
//               ),
                      
//               ],
//             ),
//           );
//   }

//   Widget buildSignUpBody2() {
//     final scrollController = ScrollController();
//     return Card(
//       child: Column(
//       children: [
//       Card(
//         margin: const EdgeInsets.all(10),
//         color: Theme.of(context).cardColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Create an Account',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Expanded(
//               child: buildTextField(
//                 hint: 'Al Aqsa University',
//                 label: 'University Name'
//                 ),
//               ),
//               const SizedBox(
//               height: 10,
//             ),
//               Expanded(
//               child: buildTextField(
//                 label: 'Field of Study',
//                 hint: 'ex: Software Engineering'
//                 ),
//               ),
//               const SizedBox(
//               height: 10,
//             ),
//               Expanded(
//               child: buildTextField(
//                 label: 'Year of Study',
//                 hint: 'ex: third year or graduated'
//                 ),
//               ),
//             const SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: buildTextField(
//                 hint: '070000010',
//                 label: 'Phone Number'
//                 )),
//             Row(
//               children: [
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'your email'
//                     )),
//                 const SizedBox(width: 5,),
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'you email again'
//                     )),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'your email'
//                     )),
//                 const SizedBox(width: 5,),
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'you email again'
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
      
//       buildBottom()
    
//       ],
//       ),
//     );
// }

//   Widget buildSignUpBody3(){
//     return Card(
//       child: Column(
//       children: [
//       Card(
//         margin: const EdgeInsets.all(10),
//         color: Theme.of(context).cardColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Create an Account',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//            Row(
//               children: [
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'OTP',
//                     label: 'ex: 5555'
//                     )),
//                 const SizedBox(width: 5,),
//                 Expanded(
//                   child: buildTextField(
//                   hint: '070000010',
//                   label: 'Phone Number'
//                 )),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'your email'
//                     )),
//                 const SizedBox(width: 5,),
//                 Expanded(
//                   child: buildTextField(
//                     hint: 'example@gmail.com',
//                     label: 'you email again'
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
      
//       buildBottom()
    
//       ],
//       ),
//     );
//   }
// }


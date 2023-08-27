import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screens/signup_screen.dart';
import 'package:e_mart/views/home_screens/home.dart';
import 'package:e_mart/widgets_common/applogo_widget.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/custom_textfield.dart';
import 'package:e_mart/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(AuthController());
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,

            Obx(
                () => Column(
                children: [
                  customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                  customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetPassword.text.make())
                  ),
                  5.heightBox,
                  controller.isLoading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: () async {
                      controller.isLoading(true);
                      await controller.loginMethod(context: context).then((value){
                        if(value != null) {
                          VxToast.show(context, msg: loggedIn);
                          Get.offAll(() => const Home());
                        } else {
                          controller.isLoading(false);
                        }
                      });
                  })
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(color: lightGolden, title: signup, textColor: redColor, onPress: (){
                    Get.to(() => const SignupScreen());
                  })
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(
                          socialIconList[index],
                          width: 30,
                        ),
                      ),
                    ))
                  )
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowXs.make(),
            ),
          ],
        ),
      ),
    ));
  }
}

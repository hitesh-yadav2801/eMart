import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/custom_textfield.dart';
import 'package:e_mart/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(color: redColor,onPress: (){}, textColor: whiteColor, title: "Change"),
              Divider(),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false),
              customTextField(hint: passwordHint, title: password, isPass: true),
            ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50)).make(),
        ),
      )
    );
  }
}

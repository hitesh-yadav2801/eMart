import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screens/login_screen.dart';
import 'package:e_mart/views/profile_screens/components/details_card.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(child: Column(
          children: [
            // Edit Profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: whiteColor,),
              ).onTap(() {
                Get.to(() => const EditProfileScreen());
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      "customer@example.com".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor
                      )
                    ),
                      onPressed: () async {
                      await Get.put(AuthController().signoutMethod(context));
                      Get.offAll(() => const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).white.make(),
                  )
                ],
              ),
            ),
            12.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth / 3.4),
                detailsCard(count: "675", title: "your orders", width: context.screenWidth / 3.4),
              ],
            ),
            // Buttons section

            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index){
                return const Divider(
                  color: lightGrey,
                );
              },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(profileButtonsIcon[index], width: 22,),
                  title: profileButtonsList[index].text.fontFamily(bold).color(darkFontGrey).make(),
                );
              }
            ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
          ],
        )),
      )
    );
  }
}

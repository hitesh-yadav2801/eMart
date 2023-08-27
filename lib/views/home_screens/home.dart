import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/controllers/home_controller.dart';
import 'package:e_mart/views/cart_screens/cart_screen.dart';
import 'package:e_mart/views/category_screens/category_screen.dart';
import 'package:e_mart/views/home_screens/home_screen.dart';
import 'package:e_mart/views/profile_screens/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init controller
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,), label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() =>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          items: navBarItem,
          onTap: (value){
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}

import '../models/auth_model.dart';
import '../providers/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../themes/theme_service.dart';
import '../widgets/drawer_widget.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/pets_page.dart';
import 'pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  AuthModel? authModel;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getHomeModel(context);
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
        key: widget._scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(76, 242, 242, 242),
          actions: [
            IconButton(
                onPressed: () {
                  widget._scaffoldKey.currentState?.openEndDrawer();
                },
                icon: Icon(
                  Icons.read_more_rounded,
                  color: !ThemeService().isDarkModeActive()
                      ? Colors.white
                      : Colors.black87,
                )),
          ],
        ),
        endDrawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(76, 242, 242, 242),
            child: _buildUi(homeViewModel, context)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: homeViewModel.currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showSelectedLabels: false, // <-- HERE
          showUnselectedLabels: false, // <-- AND HERE
          onTap: (value) {
            homeViewModel.setCurrentIndex(value);
            homeViewModel.pageController.jumpToPage(value);
          },
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(AssetImage("assets/images/pawprint.png")),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
          ],
        ));
  }
}

_buildUi(HomeViewModel homeViewModel, BuildContext context) {
  /*
  if (!homeViewModel.loading) {
    return const Center(
      child: HomeShimmer(),
    );
  }

  if (homeViewModel.error != null) {
    return Center(
      child: Text(homeViewModel.error.toString()),
    );
  }*/

  // if (homeViewModel.homeModel != null) {
  return PageView(
    controller: homeViewModel.pageController,
    children: [
      ProfilePage(),
      CartPage(),
      PetsPage(),
      HomePage(),
    ],
    onPageChanged: (page) {
      homeViewModel.setCurrentIndex(page);
    },
  );
  //}
}

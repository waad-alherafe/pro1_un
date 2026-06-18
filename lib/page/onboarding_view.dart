import 'package:flutter/material.dart';
import 'package:pro1_un/page/ecom_view.dart';
import 'package:pro1_un/page/login_view.dart';
import 'package:pro1_un/page/register_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnboardingItem> pages = const [
    OnboardingItem(
      icon: Icons.shopping_bag_outlined,
      title: 'Welcome to PocketShop',
      description:
          'Discover fashion, gifts, gadgets, watches, and accessories in one clean shopping experience.',
      backgroundColor: Color(0xFFF6EEFD),
      iconColor: Color(0xFFA677F9),
    ),
    OnboardingItem(
      icon: Icons.category_outlined,
      title: 'Explore Categories',
      description:
          'Browse your favorite categories easily and find products that match your style.',
      backgroundColor: Color(0xFFC7DEFF),
      iconColor: Color(0xFF338AFF),
    ),
    OnboardingItem(
      icon: Icons.local_mall_outlined,
      title: 'Shop Freely',
      description:
          'Navigate the store, search products, view offers, and sign in only when you are ready to buy.',
      backgroundColor: Color(0xFFFFF3E7),
      iconColor: Color(0xFFFFD09D),
    ),
  ];

  void goToShop() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EcomView()),
    );
  }

  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterView()),
    );
  }

  void nextPage() {
    if (currentPage == pages.length - 1) {
      goToShop();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == pages.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.storefront,
                    color: Color(0xFF8204FF),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Pocket',
                    style: TextStyle(
                      color: Color(0xFF040008),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Shop',
                    style: TextStyle(
                      color: Color(0xFF8204FF),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: goToShop,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF8204FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = pages[index];

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final bool compact = constraints.maxHeight < 360;
                        final double imageSize = compact ? 150 : 190;
                        final double imageRadius = compact ? 28 : 35;
                        final double iconSize = compact ? 70 : 88;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: imageSize,
                              height: imageSize,
                              decoration: BoxDecoration(
                                color: item.backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  imageRadius,
                                ),
                              ),
                              child: Icon(
                                item.icon,
                                size: iconSize,
                                color: item.iconColor,
                              ),
                            ),
                            SizedBox(height: compact ? 22 : 40),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: compact ? 24 : 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: compact ? 10 : 14),
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF807F7F),
                                fontSize: compact ? 14 : 16,
                                height: 1.5,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? const Color(0xFF8204FF)
                          : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8204FF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    isLastPage ? 'Start Shopping' : 'Next',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: goToShop,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF8204FF),
                    side: const BorderSide(color: Color(0xFF8204FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Skip for Now',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Color(0xFF807F7F), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: goToLogin,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFF8204FF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '  |  ',
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                  GestureDetector(
                    onTap: goToRegister,
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xFF8204FF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final IconData icon;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color iconColor;

  const OnboardingItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.iconColor,
  });
}

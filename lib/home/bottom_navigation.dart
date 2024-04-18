import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/corzina/cosmetics_page.dart';
import 'package:qr_code_scanner_app/corzina/food_page.dart';
import 'package:qr_code_scanner_app/home/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 2;
  bool _isHomePage = true;

  final List _pages = [
    Container(color: Colors.amber),
    Container(color: Colors.black),
    const HomePage(),
    Container(color: Colors.red),
    Container(color: Colors.red),
    // Korzina()
  ];

  final List<String> _bottomNavItemAssets = [
    'assets/icons/lenta.png',
    'assets/icons/home2.png',
    'assets/icons/home1.png',
  ];

  bool _isCartExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: SizedBox(
              height: 85,
              child: BottomNavigationBar(
                fixedColor: const Color(0xffF72055),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(_bottomNavItemAssets[0]),
                    label: 'Лента',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Избранное',
                  ),
                  BottomNavigationBarItem(
                    icon: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffF72055),
                          width: 2.0,
                        ),
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          _isHomePage
                              ? _bottomNavItemAssets[2]
                              : _bottomNavItemAssets[1],
                          height: 30,
                        ),
                      ),
                    ),
                    label: '',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Профиль',
                  ),
                  const BottomNavigationBarItem(
                    icon: Visibility(
                      visible: false,
                      child: Icon(Icons.shopping_cart),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 7.0,
            right: 16.0,
            child: Material(
              color: const Color.fromARGB(255, 254, 252, 252),
              type: MaterialType.circle,
              elevation: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isCartExpanded = !_isCartExpanded;
                  });
                },
                child: SizedBox(
                  width: 56.0,
                  height: 56.0,
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: _isCartExpanded
                            ? const Color(0xffF72055)
                            : Colors.grey,
                        size: 26.4,
                      ),
                      Text(
                        "Корзина",
                        style: TextStyle(
                          fontSize: 12,
                          color: _isCartExpanded
                              ? const Color(0xffF72055)
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isCartExpanded) ...[
            Positioned(
              bottom: 70.0,
              right: 3.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(380),
                  topRight: Radius.circular(380),
                ),
                child: Container(
                  color: Colors.white,
                  height: 177.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FoodsCorzinaView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80, 80),
                          shape: const CircleBorder(),
                          backgroundColor: const Color(0xFFF5F5F6),
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/food.png'),
                            const Text('Еда'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TovariCorzina(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(80, 80),
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xFFF5F5F6),
                            ),
                            child: Column(
                              children: [
                                Image.asset('assets/images/cosmetic.png'),
                                const Text('Товары'),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8.0,
                            right: 14.0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 17,
                                minHeight: 16,
                              ),
                              child: const Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        _isHomePage = true;
      } else {
        _isHomePage = false;
      }
    });
  }
}

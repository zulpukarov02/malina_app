import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/home/gr_scaner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List colors = [
  const Color(0xffD4E5FF),
  const Color(0xffFFD3BA),
  const Color(0xffFFDEDE),
  Colors.black,
  Colors.green,
  Colors.yellow,
];
List<String> texts = ['Маркет', 'Вакансии', 'Цветы'];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 15),
              child: TextFormField(
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: h * 0.023,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  prefixIconColor: Colors.grey,
                  prefixIcon: const Icon(Icons.search),
                  label: const Text('Искать в Malina'),
                  labelStyle:
                      TextStyle(fontSize: h * 0.023, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrScannerPage(),
                  ),
                );
              },
              child: Container(
                height: h * 0.120,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xffF72055),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 36,
                      child: Image.asset(
                        'assets/images/gr.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Сканируй QR-код и заказывай\n прямо в заведении ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/eda.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/byuti.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Text(
                        'Скоро в Malina',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: SizedBox(
                    height: 86,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: colors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final color = colors[index];
                        final text = index < texts.length ? texts[index] : '';

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Text(
                                text,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

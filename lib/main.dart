import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: camel_case_types
class homePage extends StatelessWidget {
  const homePage({super.key});
  static const IconData messagesIcon =
      IconData(0xe155, fontFamily: "MaterialIcons");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Text("Select Messages"),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Edit Pins"),
            ),
            ListTile(
              title: Text("Edit Name And Photo"),
            ),
            ListTile(
              title: Text("Show Recently Deleted"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                    color: Color.fromARGB(255, 24, 110, 219), fontSize: 18),
              ));
        }),
        elevation: 0,
        title: const Text("Messages",
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: Image.asset(
                  "assets/images/new_message.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        addRepaintBoundaries: true,
        children: const <Widget>[
          msgButton(namaPengirim: "Tes", isiChat: "tes"),
          ChatList(
            nama: "Ge Cantik",
            isiChat: "Bekeng Kopi",
          ),
          ChatList(
              nama: "STARBUCKS",
              isiChat: "HANYA HARI INI. BELI 1 GRATIS 1 SEMUA MINUMAN"),
          ChatList(
              nama: "Telkomsel",
              isiChat: "Paket INTERNET dan Telpon paling Murah"),
          ChatList(
              nama: "121202",
              isiChat: "Balas SMS ketik YA untuk langgangan NSP"),
          ChatList(nama: "IQOS", isiChat: "Kesempatan terakhir!"),
          ChatList(nama: "Bill", isiChat: "bukan dari mac"),
          ChatList(nama: "Degara", isiChat: "Bengkel ini dik"),
          ChatList(nama: "Papa", isiChat: "Attachment: 1 Image")
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

//final String waktu = DateFormat("HH:mm:ss").format(DateTime.now());
class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  String time = '';

  @override
  void initState() {
    super.initState();
    _getTime();
  }

  void _getTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat('dd-MM-yyyy').format(now);
    setState(() {
      time = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(time);
  }
}

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.nama,
    required this.isiChat,
  });

  final String nama;
  final String isiChat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: 80,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 6, 168, 197),
          backgroundBlendMode: BlendMode.overlay),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/images/blank_pp.png",
              width: 45,
              height: 45,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nama,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isiChat,
                      style: const TextStyle(
                          color: Color.fromRGBO(136, 136, 136, 1)),
                    ),
                  ),
                ],
              ),
            )),
            const Padding(
              padding: EdgeInsets.only(right: 20.0, bottom: 40),
              child: CurrentTime(),
            )
          ],
        ),
      ),
    );
  }
}

class msgButton extends StatelessWidget {
  const msgButton(
      {super.key, required this.namaPengirim, required this.isiChat});
  final String namaPengirim;
  final String isiChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(2),
        height: 80,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 6, 168, 194),
            backgroundBlendMode: BlendMode.overlay),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/images/blank_pp.png",
                width: 45,
                height: 45,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        namaPengirim,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isiChat,
                        style:
                            TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),
                      ),
                    )
                  ],
                ),
              )),
              const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 40),
                child: CurrentTime(),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print("button berhasil");
      },
    );
  }
}

import 'package:aicycle_buyme_lib/aicycle.dart';
import 'package:aicycle_buyme_lib/features/folder_details/presentation/folder_detail_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AICycle.initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController externalClaimIdController =
      TextEditingController();

  @override
  void initState() {
    tokenController.text =
        "2cef5:44c332de62534cdea6f3c27b7afdba0aa254f90b562c47aa9087db66764be4be";
    externalClaimIdController.text = "4";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FolderDetailPage(),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           TextField(
      //             controller: tokenController,
      //             decoration: InputDecoration(
      //               hintText: 'Enter your token',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 16),
      //           TextField(
      //             controller: externalClaimIdController,
      //             decoration: InputDecoration(
      //               hintText: 'Enter your externalClaimId',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 24),
      //           ElevatedButton(
      //             onPressed: () async {
      //               if (tokenController.text.isEmpty ||
      //                   externalClaimIdController.text.isEmpty) {
      //                 ScaffoldMessenger.of(context).showSnackBar(
      //                   const SnackBar(
      //                     content: Text(
      //                         "Please enter your token and externalClaimId"),
      //                   ),
      //                 );
      //                 return;
      //               }
      //               await AICycle.createFolder(
      //                 token: tokenController.text,
      //                 externalClaimId: externalClaimIdController.text,
      //               );
      //             },
      //             child: const Text(
      //               "GO",
      //               style: TextStyle(fontSize: 14, color: Colors.blueAccent),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

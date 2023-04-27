import 'package:flutter/material.dart';
import 'package:speedmeter/location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: _appBar(),
        body: _buildUI(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.purple[800],
      elevation: 0.0,
      title: const Text(
        'My App',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 30.0,
            runSpacing: 30.0,
            alignment: WrapAlignment.spaceAround,
            children: <Widget>[
              const Divider(color: Colors.white, height: 20),
              _buildSpeedSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpeedSection() {
    return SizedBox(
      height: 150,
      width: 170,
      child: Column(
        children: const <Widget>[
          Text(
            'SPEED',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          // PermissionStatusWidget(),
          // ServiceEnabledWidget(),
          // GetLocationWidget(),
          ListenLocationWidget(),
        ],
      ),
    );
  }
}

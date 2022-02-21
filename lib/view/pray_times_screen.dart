import 'package:pray_times_api/controller/pray_time_controller.dart';
import 'package:pray_times_api/model/pray_times_model.dart';
import 'package:flutter/material.dart';

class PrayTimesScreen extends StatefulWidget {
  const PrayTimesScreen({Key? key}) : super(key: key);

  @override
  _PrayTimesScreenState createState() => _PrayTimesScreenState();
}

class _PrayTimesScreenState extends State<PrayTimesScreen> {
  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pray Times In Damas'),
          ),
          body: Center(
            child: FutureBuilder<Data>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text('Fajr'),
                            Text('Dhuhr'),
                            Text('Asr'),
                            Text('Maghrib'),
                            Text('Isha'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(snapshot.data!.data.timings.fajr),
                            Text(snapshot.data!.data.timings.dhuhr),
                            Text(snapshot.data!.data.timings.asr),
                            Text(snapshot.data!.data.timings.maghrib),
                            Text(snapshot.data!.data.timings.isha),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text(snapshot.data!.data.meta.timezone),
                      ],),)
                    ],
                  ),
                ),
              );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      
    );
  }
}
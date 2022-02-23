import 'package:intl/intl.dart';
import 'package:pray_times_api/controller/pray_time_controller.dart';
import 'package:pray_times_api/model/pray_times_model.dart';
import 'package:flutter/material.dart';

class PrayTimesView extends StatefulWidget {
  const PrayTimesView({Key? key}) : super(key: key);

  @override
  _PrayTimesViewState createState() => _PrayTimesViewState();
}

class _PrayTimesViewState extends State<PrayTimesView> {
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
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Image.network(
          "https://images.unsplash.com/photo-1565828480412-f95f33fe9e70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1ha2thaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: FutureBuilder<Data>(
            future: futureData,
            builder: (context, snapshot) {
              var howManyMinutesToAdd = 40;

              var fadjr = DateTime.parse(
                  "0000-00-00 ${snapshot.data!.data.timings.fajr}");
              var fadjrEdit = fadjr.add(Duration(minutes: howManyMinutesToAdd));

              var dhuhr = DateTime.parse(
                  "0000-00-00 ${snapshot.data!.data.timings.dhuhr}");
              var dhuhrEdit = dhuhr.add(Duration(minutes: howManyMinutesToAdd));

              var asr = DateTime.parse(
                  "0000-00-00 ${snapshot.data!.data.timings.asr}");
              var asrEdit = asr.add(Duration(minutes: howManyMinutesToAdd));

              var maghrib = DateTime.parse(
                  "0000-00-00 ${snapshot.data!.data.timings.maghrib}");
              var maghribEdit =
                  maghrib.add(Duration(minutes: howManyMinutesToAdd));

              var isha = DateTime.parse(
                  "0000-00-00 ${snapshot.data!.data.timings.isha}");
              var ishaEdit = isha.add(Duration(minutes: howManyMinutesToAdd));



              



              if (snapshot.hasData) {
                return Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/84/84660.png",
                              height: MediaQuery.of(context).size.height,
                              color: Colors.yellow.withOpacity(.8),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Prayer Times',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.yellow,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.nights_stay_rounded),
                                SizedBox(width: 20),
                                Text('Fajr'),
                                SizedBox(width: 20),
                                Text(
                                  '${DateFormat('kk:mm').format(fadjrEdit)}'
                                ),
                                //  Text(snapshot.data!.data.meta.timezone),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.wb_sunny_rounded),
                                SizedBox(width: 20),
                                Text('Dhuhr'),
                                SizedBox(width: 20),
                                Text(
                                  '${DateFormat('kk:mm').format(dhuhrEdit)}'
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.wb_sunny_rounded),
                                SizedBox(width: 20),
                                Text('Asr'),
                                SizedBox(width: 20),
                                Text(
                                  '${DateFormat('kk:mm').format(asrEdit)}'
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.nights_stay_rounded),
                                SizedBox(width: 20),
                                Text('Maghrib'),
                                SizedBox(width: 20),
                                Text(
                                 '${DateFormat('kk:mm').format(maghribEdit)}'
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.nights_stay_rounded),
                                SizedBox(width: 20),
                                Text('Isha'),
                                SizedBox(width: 20),
                                Text(
                                  '${DateFormat('kk:mm').format(ishaEdit)}'
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ]),
    ));
  }
}

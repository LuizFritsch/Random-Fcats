import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../bloc/bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/background2.jpg",
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomLeft,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          BlocBuilder<FactBloc, FactState>(
                            builder: (context, state) {
                              if (state is Initial) {
                                return Container(
                                  padding: EdgeInsets.only(
                                    top: 50.0,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 90.0,
                                    left: 50.0,
                                    right: 50.0,
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      matchTextDirection: true,
                                      repeat: ImageRepeat.noRepeat,
                                      image: AssetImage("assets/cat.png"),
                                    ),
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 8,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              }
                              if (state is Loading) {
                                print('loading image');
                                return Container(
                                  padding: EdgeInsets.only(
                                    top: 50.0,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 90.0,
                                    left: 50.0,
                                    right: 50.0,
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      matchTextDirection: true,
                                      repeat: ImageRepeat.noRepeat,
                                      image: AssetImage("assets/nyan.gif"),
                                    ),
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 8,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              }
                              if (state is Loaded) {
                                print('image loaded');
                                return Container(
                                  padding: EdgeInsets.only(
                                    top: 50.0,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 90.0,
                                    left: 50.0,
                                    right: 50.0,
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(state.image.url),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40.0,
                              right: 30.0,
                              top: 10.0,
                            ),
                            child: BlocBuilder<FactBloc, FactState>(
                              builder: (context, state) {
                                if (state is Initial) {
                                  return Text(
                                    'Generate a random fact by clicking on the button below.',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                  );
                                }
                                if (state is Loading) {
                                  print('loading fact');
                                  return JumpingDotsProgressIndicator(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  );
                                }
                                if (state is Loaded) {
                                  print('fact loaded');
                                  return Text(
                                    state.fact.fact,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
                                  );
                                }
                                if (state is Failure) {
                                  return Text(
                                    'An error occurred.',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 0.0, left: 40.0, right: 40.0),
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 50.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color(0xFFE91E63),
                                    shadowColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    return [
                                      context
                                          .read<FactBloc>()
                                          .add(RequestFact())
                                    ];
                                  },
                                  child: Text(
                                    'Generate a Random Fact',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

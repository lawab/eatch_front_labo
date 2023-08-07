import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laba/menu.dart';
import 'package:laba/palette.dart';
import 'package:laba/service/getFournisseur.dart';
import 'package:laba/service/getLabo.dart';
import 'package:laba/service/getMatiereBrute.dart';
import 'package:laba/service/getMatiereFini.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaboAccueil extends ConsumerStatefulWidget {
  const LaboAccueil({Key? key}) : super(key: key);

  @override
  LaboAccueilState createState() => LaboAccueilState();
}

class LaboAccueilState extends ConsumerState<LaboAccueil> {
  @override
  void initState() {
    rr();
    // TODO: implement initState
    super.initState();
  }

  void rr() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', 30);
  }

  var nomController = TextEditingController();
  var emailController = TextEditingController();
  var adresseController = TextEditingController();
  var employeController = TextEditingController();
  List<int> _selectedFile = [];
  FilePickerResult? result;
  PlatformFile? file;
  bool filee = false;
  Uint8List? selectedImageInBytes;
  bool _selectFile = false;
  MediaQueryData mediaQueryData(BuildContext context) {
    return MediaQuery.of(context);
  }

  Size size(BuildContext buildContext) {
    return mediaQueryData(buildContext).size;
  }

  double width(BuildContext buildContext) {
    return size(buildContext).width;
  }

  double height(BuildContext buildContext) {
    return size(buildContext).height;
  }

  List<String> listLaboratoire = [];
  bool create = false;
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(getDataLaboratoriesFuture);
    return Scaffold(
      backgroundColor: const Color(0xFFF4B012),
      body:
          //////////////////
          Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 20,
        alignment: Alignment.center,
        child: Card(
          color: Palette.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              child: viewModel.listLabo.isEmpty
                  ? const Center(
                      child: Text('PAS DE LABORATOIRE'),
                    )
                  : ListView.builder(
                      itemCount: viewModel.listLabo.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          child: SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 3 + 100,
                            child: Column(children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 3 + 50,
                                width:
                                    MediaQuery.of(context).size.width / 3 + 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15.0),
                                  //color: Colors.white,

                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://13.39.81.126:4015${viewModel.listLabo[index].image.toString()}'), //13.39.81.126:4002 //13.39.81.126
                                      //image: AssetImage('Logo_Eatch_png.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                child: Text(
                                  viewModel.listLabo[index].laboName!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.yellowColor),
                                ),
                              ),
                            ]),
                          ),
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('idLabo',
                                viewModel.listLabo[index].sId.toString());
                            prefs.setBool('lab', true);
                            prefs.setInt('index', 9);
                            ref.refresh(getDataFournisseurFuture);
                            ref.refresh(getDataMatiereBruteFuture);
                            ref.refresh(getDataMatiereFiniFuture);
                            ref.refresh(getDataLaboratoriesFuture);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AccuilLabo(),
                              ),
                            );
                          },
                        );
                      }),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlaco_point/models/puesto.dart';
import 'package:tlaco_point/services/Stands/photo/getStandPhotoService.dart';
import 'package:tlaco_point/services/Stands/photo/setStandPhoto.dart';
import 'package:tlaco_point/utils/utils.dart';

class AddStandPhoto extends StatefulWidget {
  final Puesto puesto;
  const AddStandPhoto({Key key, this.puesto}) : super(key: key);

  static const String routeName = 'menu';

  @override
  _AddStandPhotoState createState() => _AddStandPhotoState();
}

class _AddStandPhotoState extends State<AddStandPhoto> {
  Uint8List bytes;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _obtenerImagenCargada(widget.puesto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: bytes == null
                  ? Image.asset('assets/no-image.png')
                  : Image.memory(bytes),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed:
                    bytes != null ? () => _cargar(widget.puesto, bytes) : null,
                icon: Icon(Icons.file_upload),
                label: Text('Cargar foto'))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_a_photo), onPressed: getImage));
  }

  Future<void> getImage() async {
    final PickedFile pickedFile =
        await picker.getImage(source: ImageSource.camera);
    final Uint8List imagebytes = await pickedFile.readAsBytes();
    setState(() {
      bytes = imagebytes;
    });
  }

  void _cargar(Puesto puesto, Uint8List bytes) async {
    String respuesta = await SetStandPhotoService.cargar(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal,
        bytes: bytes);
    //print(respuesta);

    if (respuesta == "Foto cargada exitosamente") {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("EXITO"),
              content: Text(respuesta),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          });
      Navigator.pop(context);
    } else {
      mostrarDialog(context: context, title: 'ERROR', content: respuesta);
    }
  }

  void _obtenerImagenCargada(Puesto puesto) async {
    final Uint8List bytesDownloaded = await GetStandPhoto.obtener(
        idFranquicia: puesto.tpFranquicia.idFranquicia,
        idSucursal: puesto.tpSucursal.idSucursal);
    if (bytesDownloaded == null) return;
    setState(() {
      bytes = bytesDownloaded;
    });
  }
}

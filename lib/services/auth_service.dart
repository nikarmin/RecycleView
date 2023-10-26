import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coleta.dart';
import '../models/usuario.dart';
import '../shared/config.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  User? usuario;
  User? usuario2;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  adicionarModel(Usuario usuario) async {
    await _db.collection('usuarios').add(usuario.toJson());
  }

  registrar(String email, String senha, String nome, Usuario user) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      adicionarModel(user);
      _getUser();
      usuario?.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  registrar2(Usuario usuario) async {
    try {
      await _db.collection('usuarios').add(usuario.toJson());
      _getUser();
    } on FirebaseException catch (e) {
      Exception(e.message);
    }
  }

  login(String email, String senha) async {
    User? userLogin;
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
      userLogin = userCredential.user;

      return 'sucecess';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        String msg = 'user-not-found';
        return msg;
      } else if (e.code == 'wrong-password') {
        String msg = 'wrong-password';
        return msg;
      }
    }
  }

  Future resetEmail(String newEmail) async {
    var message;
    usuario!
        .updateEmail(newEmail)
        .then(
          (value) => message = 'Success',
        )
        .catchError((onError) => message = 'error');
    return message;
  }

  editar(String nome, String senha, String email) async {
    bool envio;
    try {
      if (senha.isNotEmpty) {
        await changePassword(senha);
        await usuario?.updateDisplayName(nome);
        await usuario?.updateEmail(email);
      } else {
        await usuario?.updateDisplayName(nome);
        //resetEmail(email); arrumar
      }
      _getUser();
      envio = true;
    } on Exception catch (e) {
      envio = false;
      print(e.toString());
    }

    return envio;
  }

  void sendOtp(String email) async {
    bool result = await EmailAuth(sessionName: 'RecycleView')
        .sendOtp(recipientMail: email);
    if (result) {
      print('OTP enviado');
    } else {
      print('erro');
    }
  }

  void verify(String email) {
    final TextEditingController otpController = TextEditingController();
    EmailAuth(sessionName: 'RecycleView')
        .validateOtp(recipientMail: email, userOtp: otpController.value.text);
  }

  Future<void> changePassword(String newPassword) async {
    String? _token;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(newPassword);
    _token = sharedPreferences.getString("token");
    final url = Config.chave;
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'idToken': _token,
            'password': newPassword,
            'returnSecureToken': true,
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  updateFoto(Uint8List? url) async {
    var collection = _db.collection('usuarios');
    await collection.doc(usuario?.uid).update({'urlFoto': url.toString()});

    _getUser();
  }

  getPontoDeColeta() async {
    var colecao = _db.collection('pontos_de_coleta');
    final QuerySnapshot<Map<String, dynamic>> listaDePontos;
    try {
      listaDePontos = await colecao.get();
    } catch (e) {
      print(e.toString());
    }
  }

  adicionarMaterialReciclado(
      int countMetal, int countPlastico, int countPapel, int countVidro) async {
    final user = _db
        .collection('usuarios')
        .where('email', isEqualTo: usuario?.email)
        .get(); // Use get() em vez de snapshots() para obter os documentos uma vez

    final documents = await user;

    if (documents.docs.isNotEmpty) {
      final doc = documents.docs.first;
      final qAntMetal = doc['qtdMetal'] ?? 0;
      final qAntPlastico = doc['qtdPlastico'] ?? 0;
      final qAntPapel = doc['qtdPapel'] ?? 0;
      final qAntVidro = doc['qtdVidro'] ?? 0;

      doc.reference.update({
        'qtdMetal': qAntMetal + countMetal,
        'qtdPapel': qAntPapel + countPapel,
        'qtdPlastico': qAntPlastico + countPlastico,
        'qtdVidro': qAntVidro + countVidro,
      });
    }
  }

  pegarFoto() async {
    var collection = _db.collection('usuarios');
    var doc = await collection.doc(usuario?.uid).get();
    var url = doc.data()!['urlFoto'];
    return url;
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}

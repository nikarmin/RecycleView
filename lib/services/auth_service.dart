import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'dart:io' as io;

import '../models/usuario.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  User? usuario;
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
      await _db.collection('usuários').add(usuario.toJson());
      _getUser();
    } on FirebaseException catch (e) {
      Exception(e.message);
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('')));
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        print('SENHA INCORRETA');
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

// final bytes = io.File(imageBytes.path).readAsBytesSync();

// String img64 = base64Encode(bytes);

  updateFoto(Uint8List? url) async {
    var collection = _db.collection('usuarios');
    await collection.doc(usuario?.uid).update({'urlFoto': url.toString()});

    _getUser();
    // var collection = _db
    //     .collection('usuarios')
    //     .doc(usuario?.uid)
    //     .update({'urlFoto': url.toString()});
    // try {
    //   print("IMAGEMMMMMMMMMMM: " + url.toString());
    //   await usuario?.updatePhotoURL(url.toString());
    //   _getUser();
    //   print(usuario?.photoURL);
    // } on FirebaseException catch (e) {
    //   throw Exception(e.message);
    // }
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
      int cMetal, int cPapel, int cPlastico, int cVidro) async {
    var collection = _db.collection('usuarios');
    collection.where('email', isEqualTo: usuario?.email).get().then((value) {
      value.docs.add({
        'qtdMetal': cMetal,
        'qtdPapel': cPapel,
        'qtdPlastico': cPlastico,
        'qtdVidro': cVidro,
      } as QueryDocumentSnapshot<Map<String, dynamic>>);
    });

    // collection.where('email', isEqualTo: usuario?.email).get().then((value) {
    //   value.docs.add({
    //     'qtdMetal': cMetal,
    //     'qtdPapel': cPapel,
    //     'qtdPlastico': cPlastico,
    //     'qtdVidro': cVidro,
    //   } as QueryDocumentSnapshot<Map<String, dynamic>>);
    // });
    // await collection.doc(usuario?.email).set({
    //   'qtdMetal': cMetal,
    //   'qtdPapel': cPapel,
    //   'qtdPlastico': cPlastico,
    //   'qtdVidro': cVidro,
    // });
    // await collection
    //     .doc(usuario?.uid)
    //     .collection('cadastro_de_pontos')
    //     .doc(usuario?.uid)
    //     .update({
    //   'qtdMetal': cMetal,
    //   'qtdPapel': cPapel,
    //   'qtdPlastico': cPlastico,
    //   'qtdVidro': cVidro,
    // });
  }

  pegarFoto() async {
    var collection = _db.collection('usuarios');
    var doc = await collection.doc(usuario?.uid).get();
    var url = doc.data()!['urlFoto'];
    return url;
  }

  adicionarCep(int cep) async {}

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}

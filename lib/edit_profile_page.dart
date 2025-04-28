// edit_profile_page.dart
import 'package:flutter/material.dart';
import 'user.dart';

class EditProfilePage extends StatefulWidget {
  final Utilisateur utilisateur;
  const EditProfilePage({super.key, required this.utilisateur});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _controller;


  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomController;
  late TextEditingController _emailController;
  late TextEditingController _telController;
  late TextEditingController _titreController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    //_controller = TextEditingController(text: widget.currentName);
    _nomController = TextEditingController(text: widget.utilisateur.nom);
    _emailController = TextEditingController(text: widget.utilisateur.email);
    _telController = TextEditingController(text: widget.utilisateur.telephone);
    _titreController = TextEditingController(text: widget.utilisateur.titre);
    _bioController = TextEditingController(text: widget.utilisateur.bio);
  }

  @override
  void dispose() {
    //_controller.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _telController.dispose();
    _titreController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier le profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) => value == null || value.isEmpty ? 'Veuillez entrer un nom' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value == null || !value.contains('@') ? 'Email invalide' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _telController,
                decoration: const InputDecoration(labelText: 'Téléphone'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _titreController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Présentation'),
                maxLines: 5,
              ),

              const SizedBox(height: 30), // espace entre texte et boutons

              // Les boutons "Valider" et "Annuler"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text('Valider'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final utilisateurModifie = Utilisateur(
                          nom: _nomController.text,
                          email: _emailController.text,
                          telephone: _telController.text,
                          titre: _titreController.text,
                          bio: _bioController.text,
                        );
                        Navigator.pop(context, utilisateurModifie); // Renvoyer la nouvelle valeur
                      }
                    },
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.close),
                    label: const Text('Annuler'),
                    onPressed: () => Navigator.pop(context), // Fermer la page sans enregistrer
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

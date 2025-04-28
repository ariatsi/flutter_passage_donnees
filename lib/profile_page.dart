// profile_page.dart
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Le nom de l’utilisateur (modifiable)
  String _nom = 'Alex Dupont';

  late Utilisateur _utilisateur;

  @override
  void initState() {
    super.initState();
    _utilisateur = Utilisateur(
      nom: 'Alex Dupont',
      email: 'alex.dupont@email.com',
      telephone: '+33 6 12 34 56 78',
      titre: 'Développeur Flutter',
      bio:'Passionné par le développement mobile et les interfaces modernes. '
          'J’aime créer des applications performantes, élégantes et intuitives. '
          'Je suis convaincu que l’expérience utilisateur est au cœur de toute application réussie. '
          'Dans mon temps libre, je me forme aux dernières tendances en développement Flutter, '
          'et j’expérimente de nouvelles idées pour améliorer mes compétences techniques. '
          'Je porte une attention particulière aux détails visuels, à l’accessibilité, '
          'et à la fluidité des interfaces. \n'
          'Mon objectif est de créer des solutions fiables, maintenables et agréables à utiliser, '
          'autant pour les utilisateurs finaux que pour les équipes qui assureront leur évolution. '
          'Je m’intéresse aussi à l’architecture logicielle, à l’optimisation des performances '
          'et à la qualité du code. \n'
          'Collaborer, échanger et apprendre continuellement sont pour moi des moteurs essentiels '
          'dans une carrière de développeur.',
    );
  }

  // Fonction appelée quand on clique sur “Modifier le profil”
  void _modifierProfil() async {
    final utilisateurModifie = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(utilisateur: _utilisateur),
      ),
    );

    if (utilisateurModifie != null && utilisateurModifie is Utilisateur) {
      setState(() {
        _utilisateur = utilisateurModifie;
      });
    }
  }


  // Widget build(BuildContext context) {...}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image de profil
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),

                const SizedBox(height: 20),
                // const Text(
                //   'Alex Dupont',
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                Text(
                  _utilisateur.nom,
                  //_nom,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  _utilisateur.titre,
                  //'Développeur Flutter',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.teal),
                    SizedBox(width: 10),
                    Text(_utilisateur.telephone),
                    //Text('+33 6 12 34 56 78'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.teal),
                    SizedBox(width: 10),
                    Text(_utilisateur.email),
                    //Text('alex.dupont@email.com'),
                  ],
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    _utilisateur.bio,
                    // 'Passionné par le développement mobile et les interfaces modernes. '
                    // 'J’aime créer des applications performantes, élégantes et intuitives. '
                    // 'Je suis convaincu que l’expérience utilisateur est au cœur de toute application réussie. '
                    // 'Dans mon temps libre, je me forme aux dernières tendances en développement Flutter, '
                    // 'et j’expérimente de nouvelles idées pour améliorer mes compétences techniques. '
                    // 'Je porte une attention particulière aux détails visuels, à l’accessibilité, '
                    // 'et à la fluidité des interfaces. \n'
                    // 'Mon objectif est de créer des solutions fiables, maintenables et agréables à utiliser, '
                    // 'autant pour les utilisateurs finaux que pour les équipes qui assureront leur évolution. '
                    // 'Je m’intéresse aussi à l’architecture logicielle, à l’optimisation des performances '
                    // 'et à la qualité du code. \n'
                    // 'Collaborer, échanger et apprendre continuellement sont pour moi des moteurs essentiels '
                    // 'dans une carrière de développeur.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 30),

                // Bouton Modifier le profil

                // ElevatedButton.icon(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const EditProfilePage()),
                //     );
                //   },
                //   icon: const Icon(Icons.edit),
                //   label: const Text('Modifier le profil'),
                // ),
                ElevatedButton.icon(
                  onPressed: _modifierProfil, // appel de la nouvelle fonction renommée
                  icon: const Icon(Icons.edit),
                  label: const Text('Modifier le profil'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
